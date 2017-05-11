#ifndef _eddie_SYMBOLTABLE_H_
#define _eddie_SYMBOLTABLE_H_

#include "declare.h"

#include <cassert>
#include <vector>
#include <map>
#include <set>
#include <string>
#include <cstdio>
#include <iostream>

//#define SYMBOLTABLE_DEBUG

namespace eddie {

struct scopeValue{
	int parent;//-1 stands for root
	int choice;//0=universal, only valid for the program name in pascal
	union {
		eddie::program *type1;
		eddie::function_decl *type2;
		eddie::procedure_decl *type3;
	} type;
	scopeValue(int p, eddie::program *t):parent(p),choice(1) { type.type1 = t; }
	scopeValue(int p, eddie::function_decl *t):parent(p),choice(2) { type.type2 = t; }
	scopeValue(int p, eddie::procedure_decl *t):parent(p),choice(3) { type.type3 = t; }
	scopeValue(int p):parent(p),choice(0) { }
	scopeValue(int p, const std::string &s): parent(p), choice(0) { }
	void print() const {
		printf("parent : %d, type : ", parent);
		switch(choice) {
		case 0: printf("universal"); break;
		case 1: printf("program, name : %s", type.type1->child1->child1->name.c_str()); break;
		case 2: printf("function, name : %s", type.type2->child1->child1->name.c_str()); break;
		case 3: printf("procedure, name : %s", type.type3->child1->child1->name.c_str()); break;
		case 4: printf("error choice"); break;
		}
		printf("\n");
	}
};

class symbolTable {
private :
	std::vector<scopeValue> scope;
	std::map<std::string,std::vector<eddie::identifier *> > table;
	std::set<int> label;
	std::set<int> usedlabel;
	std::set<identifier *> const_pool;
public :
	void printScope();
	void printIdentifier();
	void printConst();
	void addConst(eddie::identifier *id) { const_pool.insert(id); }
	//identifier *getConst(identifier *i, int scopee);
	std::set<eddie::identifier *> &getConstPoll() { return const_pool; }
	/*
	insert a new scope into the table
	return value=scope_id for this scope, -1 means there already exists this scope
	*/
	int insertScope() {//for global scope only
#ifdef SYMBOLTABLE_DEBUG
		printf("Inside insertScope().\n");
#endif
		scope.push_back(scopeValue(-1, "global"));
#ifdef SYMBOLTABLE_DEBUG
		printf("Out of insertScope().\n");
#endif
		return scope.size()-1;
	}

	int insertScope(eddie::program *id, int parent_scope) {
#ifdef SYMBOLTABLE_DEBUG
		printf("Inside insertScope(), id = %s, pscope = %d\n",
			id->child1->child1->name.c_str(), parent_scope);
#endif
		if(lookUpScope(id)!=-1) {
#ifdef SYMBOLTABLE_DEBUG
			printf("Out of insertScope(), id = %s, pscope = %d\n",
				id->child1->child1->name.c_str(), parent_scope);
#endif
			return -1;
		}
		scope.push_back(scopeValue(parent_scope, id));
#ifdef SYMBOLTABLE_DEBUG
		printf("Out of insertScope(), id = %s, pscope = %d\n",
			id->child1->child1->name.c_str(), parent_scope);
#endif
		return scope.size()-1;
	}
	int insertScope(eddie::function_decl *id, int parent_scope) {
#ifdef SYMBOLTABLE_DEBUG
		printf("Inside insertScope(), id = %s, pscope = %d\n",
			id->child1->child1->name.c_str(), parent_scope);
#endif
		if(lookUpScope(id)!=-1) {
#ifdef SYMBOLTABLE_DEBUG
			printf("Out of insertScope(), id = %s, pscope = %d\n",
				id->child1->child1->name.c_str(), parent_scope);
#endif
			return -1;
		}
		scope.push_back(scopeValue(parent_scope, id));
#ifdef SYMBOLTABLE_DEBUG
		printf("Out of insertScope(), id = %s, pscope = %d\n",
			id->child1->child1->name.c_str(), parent_scope);
#endif
		return scope.size()-1;
	}
	int insertScope(eddie::procedure_decl *id, int parent_scope) {
#ifdef SYMBOLTABLE_DEBUG
		printf("Inside insertScope(), id = %s, pscope = %d\n",
			id->child1->child1->name.c_str(), parent_scope);
#endif
		if(lookUpScope(id)!=-1) {
#ifdef SYMBOLTABLE_DEBUG
			printf("Out of insertScope(), id = %s, pscope = %d\n",
				id->child1->child1->name.c_str(), parent_scope);
#endif
			return -1;
		}
		scope.push_back(scopeValue(parent_scope, id));
#ifdef SYMBOLTABLE_DEBUG
		printf("Out of insertScope(), id = %s, pscope = %d\n",
			id->child1->child1->name.c_str(), parent_scope);
#endif
		return scope.size()-1;
	}

	/*
	search for the specified scope
	return value is the id for that scope
	-1 means no such scope exists
	*/
	int lookUpScope(eddie::program *id);
	int lookUpScope(eddie::function_decl *id);
	int lookUpScope(eddie::procedure_decl *id);

	/*
	get the scopeValue of the specified scope
	*/
	scopeValue getScope(int s) const {
		//for(int i=0; i<scope.size(); ++i)
		//	scope[i].print();
		//std::cout << " in getScope : " << s << std::endl;
		assert(s<scope.size());
		return scope.at(s);
	}

	/*
	insert a new identifier into the table
	if there already exists this name in this scope, return false
	*/
	bool insertID(eddie::identifier *id, int scope);

	/*
	look for the identifier specified by name and scope
	will return the identifier found in the most nested scope, iscope is set to be the scope of found identifier
	if it does not exist, return value is NULL
	*/
	eddie::identifier *lookUp(const eddie::identifier * const id, int s, int &is) const ;

	eddie::identifier *lookUp(const std::string &id, int s, int &is) const;

	/*
	similar to the one above except this only looks in the specified scope, not potential parent scopes
	*/

	eddie::identifier *lookUp(const eddie::identifier * const id, int s) const {
	#ifdef SYMBOLTABLE_DEBUG
		printf("Inside lookUp(), id = %s , scope = %d\n",
			id->name.c_str(), s);
	#endif
		return lookUp(id, s, s);
	}

	eddie::identifier *lookUp(const std::string &id, int s) const {
		int temp;
		return lookUp(id, s, temp);
	}

	/*
	delete and return the specified identifier in the table
	if it does not exist, the return value is NULL
	*/
	//eddie::identifier *pop(const identifier * const id, int s);

	bool addLabel(int l) {
		label.insert(l);
		return true;
	}
	bool addUsedLabel(int l) {
		usedlabel.insert(l);
		return true;
	}
	bool checkLabel();
};

extern symbolTable gtable;

}

#endif
