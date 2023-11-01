#include"seats.h"

seats::seats()
{
	seat = new bool*[5];
	for (int i = 0; i < 5; i++)
	{
		*(seat + i) = new bool[3];
	}
	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			seat[i][j] = false;
		}
	}
}
seats::seats(seats &X)
{
	seat = new bool*[5];
	for (int i = 0; i < 5; i++)
	{
		*(seat + i) = new bool[3];
	}
	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 3; j++)
			seat[i][j] = X.seat[i][j];
	}
}
seats::seats(int x, int y)
{
	seat = new bool*[5];
	for (int i = 0; i < 5; i++)
	{
		*(seat + i) = new bool[3];
	}
	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			seat[i][j] = false;
			if (x < 5 && y < 3)
				seat[x][y] = true;
		}
	}
}

seats::	~seats()
{
	cout << "Destructor of Seats Class called...\n";
	for (int i = 0; i < 5; i++)
	{
		delete seat[i];
	}
	delete[]seat;
}

void seats::display()
{
	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			cout << seat[i][j] << "	";
		}
		cout << endl << endl;
	}
}