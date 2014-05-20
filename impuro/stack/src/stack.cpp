#include "stack.h"

//INV REP
//El stack vacio se representa con NULL
//No se van a generar ciclos
struct StackStr {
    int elem;
    StackStr* next;
};

// Auxiliar
StackStr* singleton(int n, StackStr* s) {
    Stack sN = new StackStr;
    sN->elem = n;
    sN->next = s;
    return sN;
}


// Interfaz
bool isEmpty(Stack s) {
    return s == NULL;
}

Stack emptyStack() {
    return NULL;
}

void push(Stack& s, int n) {
    s = singleton(n, s);
}

void pop(Stack& s) {
    Stack aux = s;
    s = s->next;

    delete aux;
}

int top(Stack s) {
    return s->elem;
}

void clear(Stack& s) {
    while (!isEmpty(s))
        pop(s);
}

int size(Stack s) {
	int acum = 0;

	while (s != NULL) {
		acum++;
		s = s->next;
	}

	return acum;
}
