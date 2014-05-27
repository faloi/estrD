#include <iostream>
#include "tictactoe.h"

using namespace std;

//Helpers
void printCell(TicTacToe t, int i) {
	Cell c = t[i];

	switch (c) {
		case empty:
			cout << i;
			break;

		case circle:
			cout << "O";
			break;

		case cross:
			cout << "X";
			break;
	}
}

void printHorizontalSeparator() {
	cout << endl;

	for (int i = 0; i < COLS * 3 + 1; i++)
		cout << "-";

	cout << endl;
}

void printVerticalSeparator() {
	cout << " | ";
}

bool hasRemainingSpaces(TicTacToe t) {
	for (int i = 0; i < CELLS; i++) {
		if (t[i] == empty)
			return true;
	}

	return false;
}

bool check(TicTacToe t, int x, int y, int z) {
	return t[x] != empty && t[x] == t[y] && t[y] == t[z];
}

bool checkRows(TicTacToe t) {
	return check(t, 0, 1, 2) || check(t, 3, 4, 5) || check(t, 6, 7, 8);
}

bool checkColumns(TicTacToe t) {
	return check(t, 0, 3, 6) || check(t, 1, 4, 7) || check(t, 2, 5, 8);
}

bool checkDiagonals(TicTacToe t) {
	return check(t, 0, 4, 8) || check(t, 2, 4, 6);
}

//Interface
TicTacToe emptyTicTacToe() {
	Cell* ret = new Cell[CELLS];

	for (int i = 0; i < CELLS; i++)
		ret[i] = empty;

	return ret;
}

void deleteTicTacToe(TicTacToe& t) {
	delete[] t;
}

void print(TicTacToe t) {
	for (int i = 0; i < CELLS; i++) {
		if (i != 0 && i % COLS == 0)
			printHorizontalSeparator();

		printCell(t, i);

		if (i % COLS != (COLS - 1))
			printVerticalSeparator();
	}
}

Cell getCell(TicTacToe t, int i) {
	return t[i];
}

void setCell(TicTacToe t, int i, Cell c) {
	t[i] = c;
}

bool won(TicTacToe t) {
	return checkRows(t) || checkColumns(t) || checkDiagonals(t);
}

bool tied(TicTacToe t) {
	return !hasRemainingSpaces(t) && !won(t);
}
