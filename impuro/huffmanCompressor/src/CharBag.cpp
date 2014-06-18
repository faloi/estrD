/*
 * CharBag.cpp
 *
 *  Created on: Jun 18, 2014
 *      Author: faloi
 */

#include "CharBag.h"

struct CharBagStr {
	int size;
};

CharBag emptyCharBag(int n) {
	CharBag value = new CharBagStr;
	value->size = n;

	return value;
}

void deleteCharBag(CharBag& b) {
	delete b;
}
