#include <iostream>

struct QueueSt;
typedef QueueSt* Queue;

Queue emptyQueue();

void enqueue(Queue& q, int n);
void dequeue(Queue& q); //pre !isEmpty(q)
void clear(Queue& q);

bool isEmpty(Queue q);
int first(Queue q); //pre !isEmpty(q)
int size(Queue q);
