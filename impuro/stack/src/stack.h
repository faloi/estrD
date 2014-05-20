#include <iostream>

using namespace std;

struct StackStr;
typedef StackStr* Stack;

Stack emptyStack();
void push(Stack& s, int n);
void pop(Stack& s);
int top(Stack s);
int size(Stack s);
void clear(Stack& s);
bool isEmpty(Stack s);
