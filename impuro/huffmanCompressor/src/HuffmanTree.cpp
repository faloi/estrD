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

int weight(HuffmanTree t) {
	return t->weight;
}
