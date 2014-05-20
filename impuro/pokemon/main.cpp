#include <iostream>
#include "Pokemon.h"

using namespace std;

int main()
{
    Pokemon pikachu = catchem("Pikachu", "Electrico", 8);
    subirNivel(pikachu);

    cout << pikachu->nombre << endl;
    return 0;
}
