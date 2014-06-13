Heap
--------------

### Invariante de representación
Se utilizará un árbol binario que cumpla con las siguientes características:
- debe ser completo
- el mínimo debe estar en la raíz
- todos los subárboles deben ser heaps

### Operaciones

#### Inserción

Puede dividirse en dos pasos:
- se agrega el elemento en la siguiente posición libre
- se hace _**percolate up**_ del nuevo nodo hasta que quede en la posición correcta

#### Borrado

Puede dividirse en dos pasos:
- se borra el nodo con el elemento menor (la raíz)
- se hace _**percolate down**_ hasta que el nuevo elemento menor quede en la raíz

### Implementaciones

#### Usando un array

Como el árbol está completo, podemos guardar los elementos de forma contigua en un array. Por ejemplo:

```
                 (3)
                  |                           ----------------------------------------
          |--------------|                    |   | 13 | 21 | 16 | 24 | 31 | 19 | 68 |
         (21)           (16)                  ----------------------------------------
          |               |                     0    1    2    3    4    5    6    7
      |-------|       |-------|
    (24)     (31)   (19)     (68)
```

Como se ve en el ejemplo, los hijos del nodo _**i**_, serán _**2i**_ y _**2i + 1**_. De eso se desprende que el padre de _**i**_ será _**i div 2**_. Veamos entonces la implementación propiamente dicha:

```cpp
// Heap.h
struct HeapHeader {
  int maxSize;
  int size;
  ELEM_TYPE* elements;
};

typedef HeapHeader* Heap;

Heap createHeap(int maxSize);
void insertHeap(Heap& h, ELEM_TYPE x);
ELEM_TYPE deleteMinHeap(Heap& h);

// Heap.c
Heap createHeap(int maxSize) {
  Heap h = new HeapHeader();
  h->maxSize = maxSize;
  h->size = 0;
  h->elements = new ELEM_TYPE[maxSize + 1];

  return h;
}

void insertHeap(Heap& h, ELEM_TYPE x) {
  if (isFull(h))
    error("El heap esta lleno!");

  int i = ++(h->size);
  while(h->elements[i/2] > x) {
    h->elements[i] = h->elements[i/2];
    i = i/2;
  }

  h->elements[i] = x;
}

ELEM_TYPE deleteMinHeap(Heap& h) {
  if (isEmpty(h))
    error("El heap esta vacio!");

  ELEM_TYPE minElem = h->elements[i];
  ELEM_TYPE lasElem = h->elements[h->size--];

  for (int i = 1; i * 2 <= h->size; i = child) {
    child = i * 2;

    if (child != h->size && h->elements[child + 1] < h->elements[child]) {
      child++;
    }

    if (lastElem > h->elements[child]) {
      h->elements[i] = h->elements[child];
    } else {
      break;
    }
  }

  h->elements[i] = lastElem;

  return minElem;
}
```
