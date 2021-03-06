#include <iostream>

struct QueueNode {
	int elem;
	QueueNode* next;
};

//INVARIANTE DE REPRESENTACION
//size representa la cantidad de elementos
//el next de last siempre es NULL
//el queue vacio se representa con (0, NULL, NULL)
struct QueueSt {
	int size;
	QueueNode* head;
	QueueNode* last;
};

QueueNode* singleton(int n, QueueNode* q);

Queue emptyQueue() {
	QueueSt* q = new QueueSt;
	q->head = q->last = NULL;
	q->size = 0;

	return q;
}

void enqueue(Queue& q, int n) {
	QueueNode* aux = singleton(n, NULL);

	if (isEmpty(q))
		q->head = aux;
	else
		q->last->next = aux;

	q->last = aux;
	q->size++;
}

//pre !isEmpty(q)
void dequeue(Queue& q) {
	QueueNode* aux = q->head;
}

void clear(Queue& q) {

}

bool isEmpty(Queue q) {
	return q->size == 0;
}

//pre !isEmpty(q)
int first(Queue q) {
	return q->head->elem;
}

int size(Queue q) {
	return q->size;
}
