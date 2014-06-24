/*
 * CharBag.cpp
 *
 *  Created on: Jun 18, 2014
 *      Author: faloi
 */

#include "CharBag.h"
#include <iostream>

using namespace std;

struct CharBagStr {
	int size;
	unsigned* table;
};

CharBag emptyCharBag(int n) {
	CharBag value = new CharBagStr;
	value->size = n;
	value->table = new unsigned[n];

	for (int i = 0; i < n; i++)
		value->table[i] = 0;

	return value;
}

void add(CharBag& b, unsigned char c) {
	b->table[c]++;
}

int get(CharBag& b, unsigned char c) {
	return b->table[c];
}

void deleteCharBag(CharBag& b) {
	delete b->table;
	delete b;
}
