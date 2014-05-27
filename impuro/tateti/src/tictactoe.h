#include <iostream>

#define ROWS  3
#define COLS  3
#define CELLS ROWS*COLS

enum Cell { empty, circle, cross };

typedef Cell* TicTacToe;

TicTacToe emptyTicTacToe();

void deleteTicTacToe(TicTacToe& t);

void print(TicTacToe t);

Cell getCell(TicTacToe t, int i);

void setCell(TicTacToe t, int i, Cell c);

bool won(TicTacToe t);

bool tied(TicTacToe t);
