#ifndef POKEMON_H_INCLUDED
#define POKEMON_H_INCLUDED

#include <iostream>
using namespace std;

struct PokeStruct {
    string nombre;
    string tipo;
    int nivel;
};

typedef PokeStruct& Pokemon;

Pokemon catchem(string nombre, string tipo, int nivel);
void subirNivel(Pokemon& p);

#endif // POKEMON_H_INCLUDED
