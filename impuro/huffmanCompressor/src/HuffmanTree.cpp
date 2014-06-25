/*
 * HuffmanTree.cpp
 *
 *  Created on: Jun 24, 2014
 *      Author: faloi
 */

#include <iostream>
#include "HuffmanTree.h"

struct HuffmanTreeStr {
	char character;
	int weight;
	HuffmanTree left;
	HuffmanTree right;
};

// Private

inline HuffmanTree create(char c, int w, HuffmanTree a, HuffmanTree b) {
	HuffmanTree value = new HuffmanTreeStr;
	value->character = c;
	value->weight = w;
	value->left = a;
	value->right = b;

	return value;
}

// Public

HuffmanTree leaf(char c, int w) {
	return create(c, w, NULL, NULL);
}

HuffmanTree binary(HuffmanTree a, HuffmanTree b) {
	return create('\0', weight(a) + weight(b), a, b);
}

inline int weight(HuffmanTree t) {
	return t->weight;
}
