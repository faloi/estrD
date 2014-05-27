#include <iostream>

#include "tictactoe.h"

using namespace std;

int main() {
	TicTacToe t = emptyTicTacToe();
	int turn = 1;
	while (!(won(t) || tied(t))) {
		turn = (turn+1)%2;
		cout << endl;
		print(t);
		cout << "\n\nPlayer " << turn+1 << " turn: ";
		int cell;
		cin >> cell;
		while (cell < 0 || cell >= CELLS || getCell(t,cell) != empty) {
			cout << "  Invalid play, choose another: ";
			cin >> cell;
		}
		setCell(t, cell, turn ? cross : circle);
	}

	if (tied(t))
		cout << "Tie" << endl;
	else
		cout << "Player " << turn+1 << " won." << endl;

	return 0;
}

