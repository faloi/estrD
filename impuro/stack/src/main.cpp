#include <iostream>
#include "stack.h"

using namespace std;

void printToConsole(Stack s) {
	if (isEmpty(s)) {
		cout << "STACK VACIO";
		return;
	}

	cout << "PRIMER ELEMENTO: " << top(s) << endl;
    cout << "SIZE: " << size(s) << endl;
}

int main()
{
    Stack s = emptyStack();

    push(s, 10);
    push(s, 20);
    push(s, 80);

    pop(s);

    printToConsole(s);

    return 0;
}
