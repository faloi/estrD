/*
 * CharBag.cpp
 *
 *  Created on: Jun 18, 2014
 *      Author: faloi
 */

#include "CharBag.h"
#include <iostream>

using namespace std;

// Charbag

struct CharBagStr {
	int size;
	unsigned* table;
	unsigned char* elements;
};

CharBag emptyCharBag(int n) {
	CharBag value = new CharBagStr;
	value->size = n;
	value->table = new unsigned[n];
	value->elements = new unsigned char[n];

	for (int i = 0; i < n; i++)
		value->table[i] = 0;

	return value;
}

void add(CharBag& b, unsigned char c) {
	if (b->table[c] == 0)
		b->elements[0] = c;

	b->table[c]++;
}

int get(CharBag& b, unsigned char c) {
	return b->table[c];
}

void deleteCharBag(CharBag& b) {
	delete b->table;
	delete b;
}

// Iterator

struct CharBagIteratorStr {
	CharBag charBag;
	unsigned currentIndex;
};

CharBagIterator iterate(CharBag b) {
	CharBagIterator value = new CharBagIteratorStr;
	value->charBag = b;
	value->currentIndex = 0;

	return value;
}

char currentChar(CharBagIterator it) {
	return it->charBag->elements[it->currentIndex];
}

int currentCount(CharBagIterator it) {
	return get(it->charBag, currentChar(it));
}
