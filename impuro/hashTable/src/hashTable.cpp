#include <stdlib.h>
#include "hashTable.h"

//Private

struct PairStr {
	TKey key;
	TValue value;
};

typedef PairStr* Pair;

struct HashTableStr {
	Pair* table;
	unsigned capacity; //2^exp
	unsigned exp;
	unsigned f;
	unsigned g;
};

Pair makePairKV(TKey key, TValue value) {
	Pair pair = new PairStr;
	pair->key = key;
	pair->value = value;

	return pair;
}

void deletePairKV(Pair pair) {
	delete pair;
}

unsigned random(int min, int max) {
	return (rand() / RAND_MAX) * (max - min) + min;
}

unsigned hash(HashTable table, TKey key) {
	return (key * table->f * table->g) >> (32 - table->exp);
}

void setRandomValues(HashTable newTable) {
	newTable->f = random(0, 1 << 31) | 1; //pone en 1 el ultimo bit, lo cual lo convierte en impar
	newTable->g = random(0, 1 << (31 - newTable->exp));
}

void rehash(HashTable& table) {
	HashTableStr* newTable = new HashTableStr;
	newTable->exp = table->exp + 1;
	newTable->capacity = 1 << newTable->exp; //2 ^ newTable->exp
	newTable->table = new Pair[newTable->capacity];

	for(int i = newTable->capacity - 1; i >= 0; --i)
		newTable->table[i] = NULL;

	setRandomValues(newTable);

	for (int i = 0; i < table->capacity; ++i) {
		Pair p = table->table[i];
		if (p != NULL)
			put(newTable, p->key, p->value);
	}

	deleteHashTable(table);
	table = newTable;
}

// Public

HashTable emptyHashTable();
void deleteHashTable(HashTable& table);

bool has(HashTable table, TKey key) {
	Pair pair = table->table[hash(table, key)];
	return pair != NULL && pair->key == key;
}

TValue get(HashTable table, TKey key) {
	return table->table[hash(table, key)]->value;
}

void put(HashTable& table, TKey key, TValue value) {
	unsigned hashedKey = hash(table, key);

	while (table->table[hashedKey] != NULL) {
		rehash(table);
		hashedKey = hash(table, key);
	}

	table->table[hashedKey] = makePairKV(key, value);
}

void remove(HashTable& table, TKey key) {
	unsigned hashedKey = hash(table, key);

	deletePairKV(table->table[hashedKey]);
	table->table[hashedKey] = NULL;
}
