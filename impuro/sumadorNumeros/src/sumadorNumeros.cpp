//============================================================================
// Name        : sumadorNumeros.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
using namespace std;

double sumar(int n, double* numbers) {
	double acum = 0;

	for (int i = 0; i < n; i++)
		acum += numbers[i];

	return acum;
}

void dispose(double* numbers) {
	delete[] numbers;
}

int main() {
	int n;
	cout << "Cuantos numeros queres flaco? ";
	cin >> n;

	double* numbers = new double[n];

	for (int i = 0; i < n; i++) {
		cout << i + 1 << " de " << n << ": ";
		cin >> numbers[i];
	}

	cout << "Guau, que buen programa, la suma es: " << sumar(n, numbers);

	dispose(numbers);
}
