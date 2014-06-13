typedef int TKey;
typedef int TValue;

struct HashTableStr;
typedef HashTableStr* HashTable;

HashTable emptyHashTable();
void deleteHashTable(HashTable& table);
bool has(HashTable table, TKey key);
TValue get(HashTable table, TKey key);
void put(HashTable& table, TKey key, TValue value);
void remove(HashTable& table, TKey key);
