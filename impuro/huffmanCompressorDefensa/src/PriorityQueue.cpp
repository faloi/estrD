/*
 * PriorityQueue.cpp
 *
 *  Created on: Jun 28, 2014
 *      Author: faloi
 */

#include "PriorityQueue.h"
#include <iostream>

#define MAX_SIZE 256

// INV. REP.
// size - cantidad de elementos contenidos en esta PQ
// elements - como el árbol está completo, podemos guardar los elementos de forma contigua en un array,
// donde los hijos del nodo i, serán 2i y 2i + 1

struct PriorityQueueStr {
	int size;
	HuffmanTree* elements;
};

PriorityQueue emptyPriorityQueue() {
	PriorityQueue value = new PriorityQueueStr;
	value->size = 0;
	value->elements = new HuffmanTree[MAX_SIZE + 1];

	for (int i = 0; i < MAX_SIZE + 1; i++)
		value->elements[i] = NULL;

	return value;
}

void deletePriorityQueue(PriorityQueue& q) {
	delete[] q->elements;
	delete q;
}

int size(PriorityQueue q) {
	return q->size;
}

void enqueue(PriorityQueue& q, HuffmanTree t) {
	int i = ++(q->size);

	while(q->elements[i/2] != NULL && weight(q->elements[i/2]) > weight(t)) {
		q->elements[i] = q->elements[i/2];
		i = i/2;
	}

	q->elements[i] = t;
}

HuffmanTree dequeue(PriorityQueue& q) {
	HuffmanTree minElem = q->elements[1];
	HuffmanTree lastElem = q->elements[q->size--];

	int child = 0, i = 0;

	for (i = 1; i * 2 <= q->size; i = child) {
		child = i * 2;

		if (child != q->size && weight(q->elements[child + 1]) < weight(q->elements[child])) {
			child++;
		}

		if (weight(lastElem) > weight(q->elements[child])) {
			q->elements[i] = q->elements[child];
		} else {
			break;
		}
	}

	q->elements[i] = lastElem;

	return minElem;
}
