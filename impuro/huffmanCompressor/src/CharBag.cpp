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
	unsigned* table;
	unsigned char* elements;
	unsigned nextElement;
};

CharBag emptyCharBag(int n) {
	CharBag value = new CharBagStr;
	value->table = new unsigned[n];
	value->elements = new unsigned char[n];
	value->nextElement = 0;

	for (int i = 0; i < n; i++)
		value->table[i] = 0;

	return value;
}

void add(CharBag& b, unsigned char c) {
	if (b->table[c] == 0) {
		b->elements[b->nextElement] = c;
		b->nextElement++;
	}

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

bool valid(CharBagIterator it) {
	return it->currentIndex < it->charBag->nextElement;
}

void next(CharBagIterator it) {
	it->currentIndex++;
}

char currentChar(CharBagIterator it) {
	return it->charBag->elements[it->currentIndex];
}

int currentCount(CharBagIterator it) {
	return get(it->charBag, currentChar(it));
}
