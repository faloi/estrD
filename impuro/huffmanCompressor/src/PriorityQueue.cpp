/*
 * PriorityQueue.cpp
 *
 *  Created on: Jun 28, 2014
 *      Author: faloi
 */

#include "PriorityQueue.h"

struct PriorityQueueStr {
	int size;
};

PriorityQueue emptyPriorityQueue() {
	PriorityQueue value = new PriorityQueueStr;
	value->size = 0;

	return value;
}

int size(PriorityQueue q) {
	return q->size;
}
