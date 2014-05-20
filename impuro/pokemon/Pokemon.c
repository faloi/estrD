#include "Pokemon.h"

Pokemon catchem(string nombre, string tipo, int nivel) {
    Pokemon p = new PokeStruct();
    p->nombre = nombre;
    p->nivel = nivel;
    p->tipo = tipo;

    return p;
}

void subirNivel(Pokemon& p) {
    p->nivel++;
}
