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

HuffmanTree leaf(char c, int w) {
	HuffmanTree value = new HuffmanTreeStr;
	value->character = c;
	value->weight = w;
	value->left = NULL;
	value->right = NULL;

	return value;
}

inline int weight(HuffmanTree t) {
	return t->weight;
}

HuffmanTree binary(HuffmanTree a, HuffmanTree b) {
	HuffmanTree value = new HuffmanTreeStr;
	value->weight = weight(a) + weight(b);
	value->left = a;
	value->right = b;

	return value;
}
