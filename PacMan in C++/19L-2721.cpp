#include<iostream>
#include<windows.h>
#include<conio.h>
#include<ctime>
#include<cstdlib>


using namespace std;


char map[20][60];

void default_map(char Xmap[][60])
{
	for (int i = 0; i < 20; i++)
	{
		for (int j = 0; j < 60; j++)
		{
			map[i][j] = Xmap[i][j];
		}
	}
}
void restart_map(char Xmap[][60])
{
	char new_map[20][60] = {
		"###########################################################",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"###########################################################",
	};
	for (int i = 0; i < 20; i++)
	{
		for (int j = 0; j < 60; j++)
			Xmap[i][j] = new_map[i][j];
	}
}

void gotoxy(int x, int y)
{
	COORD coordinates;
	coordinates.X = x;
	coordinates.Y = y;
	SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coordinates);
}

void maze()
{
	HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);

	for (int i = 0; i < 20; i++)
	{
		for (int j = 0; j < 60; j++)
		{
			if (map[i][j] == '+' || map[i][j] == '<' || map[i][j] == '>' || map[i][j] == 'v' || map[i][j] == '^')
				SetConsoleTextAttribute(h, 14);
			cout << map[i][j];
			SetConsoleTextAttribute(h, 11);
		}
		cout << endl;
	}
}

void enemy1_movement(int defaultY, int defaultX, int &e1Y, int &e1X, char e1)
{
	HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);

	bool flag = true;

	if (map[e1Y + 1][e1X] != '#' && defaultY > e1Y)
	{
		flag = false;
		if (map[e1Y + 1][e1X] == '.')
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = '.';
			gotoxy(e1X, e1Y);
			cout << '.';

		}
		else if (map[e1Y + 1][e1X] == '+')
		{
			SetConsoleTextAttribute(h, 14);
			map[e1Y][e1X] = '+';
			gotoxy(e1X, e1Y);
			cout << '+';
			SetConsoleTextAttribute(h, 11);

		}
		else if (map[e1Y + 1][e1X] == '>' || map[e1Y + 1][e1X] == '<' || map[e1Y + 1][e1X] == 'v' || map[e1Y + 1][e1X] == '^')
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = ' ';
			gotoxy(e1X, e1Y);
			cout << ' ';

		}
		else
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = ' ';
			gotoxy(e1X, e1Y);
			cout << ' ';

		}
		e1Y++;
		gotoxy(e1X, e1Y);

		SetConsoleTextAttribute(h, 9);
		cout << e1;
		map[e1Y][e1X] = e1;
		SetConsoleTextAttribute(h, 11);
	}
	else if (map[e1Y - 1][e1X] != '#' && defaultY < e1Y)
	{
		flag = false;
		if (map[e1Y - 1][e1X] == '.')
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = '.';
			gotoxy(e1X, e1Y);
			cout << '.';
		}
		else if (map[e1Y - 1][e1X] == '+')
		{
			SetConsoleTextAttribute(h, 14);
			map[e1Y][e1X] = '+';
			gotoxy(e1X, e1Y);
			cout << '+';
			SetConsoleTextAttribute(h, 11);
		}
		else if (map[e1Y - 1][e1X] == '>' || map[e1Y - 1][e1X] == '<' || map[e1Y - 1][e1X] == 'v' || map[e1Y - 1][e1X] == '^')
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = ' ';
			gotoxy(e1X, e1Y);
			cout << ' ';
		}
		else
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = ' ';
			gotoxy(e1X, e1Y);
			cout << ' ';
		}

		e1Y--;
		SetConsoleTextAttribute(h, 9);
		gotoxy(e1X, e1Y);
		cout << e1;
		map[e1Y][e1X] = e1;
		SetConsoleTextAttribute(h, 11);

	}
	if (flag == true)
	{
		if (map[e1Y][e1X + 1] != '#'  && defaultX > e1X)
		{
			if (map[e1Y][e1X + 1] == '.')
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = '.';
				gotoxy(e1X, e1Y);
				cout << '.';
			}
			else if (map[e1Y][e1X + 1] == '+')
			{
				SetConsoleTextAttribute(h, 14);
				map[e1Y][e1X] = '+';
				gotoxy(e1X, e1Y);
				cout << '+';
				SetConsoleTextAttribute(h, 11);
			}
			else if (map[e1Y][e1X + 1] == '>' || map[e1Y][e1X + 1] == '<' || map[e1Y][e1X + 1] == 'v' || map[e1Y][e1X + 1] == '^')
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = ' ';
				gotoxy(e1X, e1Y);
				cout << ' ';
			}
			else
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = ' ';
				gotoxy(e1X, e1Y);
				cout << ' ';
			}
			e1X++;
			SetConsoleTextAttribute(h, 9);
			gotoxy(e1X, e1Y);
			cout << e1;
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = e1;
		}
		else if (map[e1Y][e1X - 1] != '#'  && defaultX < e1X)
		{
			if (map[e1Y][e1X - 1] == '.')
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = '.';
				gotoxy(e1X, e1Y);
				cout << '.';
			}
			else if (map[e1Y][e1X - 1] == '+')
			{
				SetConsoleTextAttribute(h, 14);
				map[e1Y][e1X] = '+';
				gotoxy(e1X, e1Y);
				cout << '+';
				SetConsoleTextAttribute(h, 11);
			}
			else if (map[e1Y][e1X - 1] == '>' || map[e1Y][e1X - 1] == '<' || map[e1Y][e1X - 1] == 'v' || map[e1Y][e1X - 1] == '^')
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = ' ';
				gotoxy(e1X, e1Y);
				cout << ' ';
			}
			else
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = ' ';
				gotoxy(e1X, e1Y);
				cout << ' ';
			}
			e1X--;
			SetConsoleTextAttribute(h, 9);
			gotoxy(e1X, e1Y);
			cout << e1;
			map[e1Y][e1X] = e1;
			SetConsoleTextAttribute(h, 11);

		}
	}
}
void enemy2_movement(int defaultY, int defaultX, int &e1Y, int &e1X, char e1)
{

	HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);

	bool flag = true;

	if (map[e1Y + 1][e1X] != '#' && defaultY > e1Y)
	{
		flag = false;
		if (map[e1Y + 1][e1X] == '.')
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = '.';
			gotoxy(e1X, e1Y);
			cout << '.';

		}
		else if (map[e1Y + 1][e1X] == '+')
		{
			SetConsoleTextAttribute(h, 14);
			map[e1Y][e1X] = '+';
			gotoxy(e1X, e1Y);
			cout << '+';
			SetConsoleTextAttribute(h, 11);

		}
		else if (map[e1Y + 1][e1X] == '>' || map[e1Y + 1][e1X] == '<' || map[e1Y + 1][e1X] == 'v' || map[e1Y + 1][e1X] == '^')
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = ' ';
			gotoxy(e1X, e1Y);
			cout << ' ';

		}
		else
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = ' ';
			gotoxy(e1X, e1Y);
			cout << ' ';

		}
		e1Y++;
		gotoxy(e1X, e1Y);

		SetConsoleTextAttribute(h, 13);
		cout << e1;
		map[e1Y][e1X] = e1;
		SetConsoleTextAttribute(h, 11);
	}
	else if (map[e1Y - 1][e1X] != '#' && defaultY < e1Y)
	{
		flag = false;
		if (map[e1Y - 1][e1X] == '.')
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = '.';
			gotoxy(e1X, e1Y);
			cout << '.';
		}
		else if (map[e1Y - 1][e1X] == '+')
		{
			SetConsoleTextAttribute(h, 14);
			map[e1Y][e1X] = '+';
			gotoxy(e1X, e1Y);
			cout << '+';
			SetConsoleTextAttribute(h, 11);
		}
		else if (map[e1Y - 1][e1X] == '>' || map[e1Y - 1][e1X] == '<' || map[e1Y - 1][e1X] == 'v' || map[e1Y - 1][e1X] == '^')
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = ' ';
			gotoxy(e1X, e1Y);
			cout << ' ';
		}
		else
		{
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = ' ';
			gotoxy(e1X, e1Y);
			cout << ' ';
		}

		e1Y--;
		SetConsoleTextAttribute(h, 13);
		gotoxy(e1X, e1Y);
		cout << e1;
		map[e1Y][e1X] = e1;
		SetConsoleTextAttribute(h, 11);

	}
	if (flag == true)
	{
		if (map[e1Y][e1X + 1] != '#'  && defaultX > e1X)
		{
			if (map[e1Y][e1X + 1] == '.')
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = '.';
				gotoxy(e1X, e1Y);
				cout << '.';
			}
			else if (map[e1Y][e1X + 1] == '+')
			{
				SetConsoleTextAttribute(h, 14);
				map[e1Y][e1X] = '+';
				gotoxy(e1X, e1Y);
				cout << '+';
				SetConsoleTextAttribute(h, 11);
			}
			else if (map[e1Y][e1X + 1] == '>' || map[e1Y][e1X + 1] == '<' || map[e1Y][e1X + 1] == 'v' || map[e1Y][e1X + 1] == '^')
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = ' ';
				gotoxy(e1X, e1Y);
				cout << ' ';
			}
			else
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = ' ';
				gotoxy(e1X, e1Y);
				cout << ' ';
			}
			e1X++;
			SetConsoleTextAttribute(h, 13);
			gotoxy(e1X, e1Y);
			cout << e1;
			SetConsoleTextAttribute(h, 11);
			map[e1Y][e1X] = e1;
		}
		else if (map[e1Y][e1X - 1] != '#'  && defaultX < e1X)
		{
			if (map[e1Y][e1X - 1] == '.')
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = '.';
				gotoxy(e1X, e1Y);
				cout << '.';
			}
			else if (map[e1Y][e1X - 1] == '+')
			{
				SetConsoleTextAttribute(h, 14);
				map[e1Y][e1X] = '+';
				gotoxy(e1X, e1Y);
				cout << '+';
				SetConsoleTextAttribute(h, 11);
			}
			else if (map[e1Y][e1X - 1] == '>' || map[e1Y][e1X - 1] == '<' || map[e1Y][e1X - 1] == 'v' || map[e1Y][e1X - 1] == '^')
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = ' ';
				gotoxy(e1X, e1Y);
				cout << ' ';
			}
			else
			{
				SetConsoleTextAttribute(h, 11);
				map[e1Y][e1X] = ' ';
				gotoxy(e1X, e1Y);
				cout << ' ';
			}
			e1X--;
			SetConsoleTextAttribute(h, 13);
			gotoxy(e1X, e1Y);
			cout << e1;
			map[e1Y][e1X] = e1;
			SetConsoleTextAttribute(h, 11);

		}
	}
}

void maze_generator(char Xmap[][60])
{
	Xmap[rand() % 18 + 1][rand() % 56 + 1] = '+';

	for (int i = 1; i < 19; i = i + 2)
	{
		for (int j = rand() % 30 + 1; j < 30; j++)
		{

			Xmap[i][j] = '#';
		}
	}
	for (int i = 2; i < 19; i = i + 2)
	{
		for (int j = rand() % 30 + 30; j < 57; j++)
		{

			Xmap[i][j] = '#';
		}
	}
	Xmap[rand() % 18 + 1][rand() % 56 + 1] = '+';
}

void movement(int &lives, int &stage, int &defaultX, int &defaultY, char &pacman, int &score, char e1, char e2, int &e1Y, int &e1X, int &e2Y, int &e2X)
{
	HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
	bool check = true;
	while (lives>0 && check == true)
	{
		gotoxy(80, 0);
		cout << "Score = " << score;
		gotoxy(80, 1);
		cout << "Remaining Lives = " << lives - 1;
		gotoxy(80, 2);
		cout << "Stage = " << stage;

		if (_kbhit())
		{

			char key = _getch();
			if (key == 'w')
			{
				if (defaultY == 1 || map[defaultY - 1][defaultX] == '#')
					continue;
				if (map[defaultY - 1][defaultX] == '.')
				{
					score++;
				}
				else if (map[defaultY - 1][defaultX] == '+')
				{
					lives++;
				}
				pacman = 'v';
				gotoxy(defaultX, defaultY);
				cout << ' ';
				defaultY--;
				map[defaultY][defaultX] = ' ';
				gotoxy(defaultX, defaultY);

				SetConsoleTextAttribute(h, 14);
				cout << pacman;
				SetConsoleTextAttribute(h, 11);
				gotoxy(80, 0);
				cout << "Score = " << score;
			}
			else if (key == 's')
			{
				if (defaultY == 18 || map[defaultY + 1][defaultX] == '#')
					continue;
				if (map[defaultY + 1][defaultX] == '.')
				{
					score++;
				}
				else if (map[defaultY + 1][defaultX] == '+')
				{
					lives++;
				}
				pacman = '^';
				gotoxy(defaultX, defaultY);
				cout << ' ';
				defaultY++;
				map[defaultY][defaultX] = ' ';
				gotoxy(defaultX, defaultY);

				SetConsoleTextAttribute(h, 14);
				cout << pacman;
				SetConsoleTextAttribute(h, 11);

				gotoxy(80, 0);
				cout << "Score = " << score;
			}
			else if (key == 'a')
			{
				if (defaultX == 1 || map[defaultY][defaultX - 1] == '#')
					continue;
				if (map[defaultY][defaultX - 1] == '.')
				{
					score++;
				}
				else if (map[defaultY][defaultX - 1] == '+')
				{
					lives++;
				}
				pacman = '>';
				gotoxy(defaultX, defaultY);
				cout << ' ';

				defaultX--;
				map[defaultY][defaultX] = ' ';
				gotoxy(defaultX, defaultY);

				SetConsoleTextAttribute(h, 14);
				cout << pacman;
				SetConsoleTextAttribute(h, 11);


				gotoxy(80, 0);
				cout << "Score = " << score;
			}
			else if (key == 'd')
			{
				if (defaultX == 57 || map[defaultY][defaultX + 1] == '#')
					continue;
				if (map[defaultY][defaultX + 1] == '.')
				{
					score++;
				}
				else if (map[defaultY][defaultX + 1] == '+')
				{
					lives++;
				}
				pacman = '<';
				gotoxy(defaultX, defaultY);
				cout << ' ';
				defaultX++;
				map[defaultY][defaultX] = ' ';
				gotoxy(defaultX, defaultY);

				SetConsoleTextAttribute(h, 14);
				cout << pacman;
				SetConsoleTextAttribute(h, 11);


				gotoxy(80, 0);
				cout << "Score = " << score;
			}

		}
		Sleep(200);
		enemy1_movement(defaultY, defaultX, e1Y, e1X, e1);
		enemy2_movement(defaultY, defaultX, e2Y, e2X, e2);


		if (map[defaultY][defaultX] == '@')
		{
			lives--;
			if (lives == 0)
			{
				system("CLS");
				gotoxy(30, 8);
				cout << "YOU FAILED ! BETTER LUCK NEXT TIME" << endl;
				gotoxy(30, 9);
				cout << "YOUR SCORE = " << score << endl;
				gotoxy(30, 10);
				cout << "THE STAGE YOU DIED AT = " << stage << endl;
				break;
			}

			gotoxy(e1X, e1Y);
			cout << " ";
			map[e1Y][e1X] = ' ';

			gotoxy(e2X, e2Y);
			cout << " ";
			map[e2Y][e2X] = ' ';


			gotoxy(defaultX, defaultY);
			cout << " ";

			defaultY = 10;
			defaultX = 30;
			map[defaultX][defaultY] = pacman;
			gotoxy(defaultX, defaultY);
			SetConsoleTextAttribute(h, 14);
			cout << pacman;
			SetConsoleTextAttribute(h, 11);

			e1Y = 9, e1X = 2;
			map[e1Y][e1X] = e1;
			SetConsoleTextAttribute(h, 9);
			gotoxy(e1X, e1Y);
			cout << e1;
			SetConsoleTextAttribute(h, 11);

			e2Y = 9, e2X = 55;
			map[e1Y][e1X] = e2;
			gotoxy(e2X, e2Y);
			SetConsoleTextAttribute(h, 13);
			cout << e2;
			SetConsoleTextAttribute(h, 11);
			gotoxy(80, 15);
			Sleep(2000);
		}

		int counter = 0;
		for (int i = 0; i < 20; i++)
		{
			for (int j = 0; j < 60; j++)
			{
				if (map[i][j] == '.')
				{
					counter++;
				}
			}
		}
		if (counter == 0)
		{
			stage++;
			check = false;
		}
	}
}


int main()
{
	srand(time(0));

	HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleTextAttribute(h, 11);


	char Xmap[20][60] = {
		"###########################################################",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"#.........................................................#",
		"###########################################################",
	};


	int stage = 1;
	int lives = 3;
	char pacman = '>';
	int score = 0;
	maze_generator(Xmap);
	int f = 2;
	while (lives > 0)
	{
		system("CLS");
		if (stage == 1)
		{
			default_map(Xmap);
			char enemy1 = '@';
			char enemy2 = '@';
			int x = 30, y = 10;
			map[y][x] = pacman;
			int e1Y = 9, e1X = 2;
			map[e1Y][e1X] = enemy1;
			int e2Y = 9, e2X = 55;
			map[e2Y][e2X] = enemy2;
			maze();
			movement(lives, stage, x, y, pacman, score, enemy1, enemy2, e1Y, e1X, e2Y, e2X);
			gotoxy(30, 11);
		}

		if (stage == 2)
		{
			system("CLS");
			if (f == 2)
			{
				restart_map(Xmap);
				maze_generator(Xmap);
				f++;
			}
			default_map(Xmap);
			char enemy1 = '@';
			char enemy2 = '@';
			int x = 30, y = 10;
			map[y][x] = pacman;
			int e1Y = 9, e1X = 2;
			map[e1Y][e1X] = enemy1;
			int e2Y = 9, e2X = 55;
			map[e2Y][e2X] = enemy2;
			maze();
			movement(lives, stage, x, y, pacman, score, enemy1, enemy2, e1Y, e1X, e2Y, e2X);
			gotoxy(30, 11);
		}
		if (stage == 2)
		{
			system("CLS");
			if (f == 2)
			{
				restart_map(Xmap);
				maze_generator(Xmap);
				f++;
			}
			default_map(Xmap);
			char enemy1 = '@';
			char enemy2 = '@';
			int x = 30, y = 10;
			map[y][x] = pacman;
			int e1Y = 9, e1X = 2;
			map[e1Y][e1X] = enemy1;
			int e2Y = 9, e2X = 55;
			map[e2Y][e2X] = enemy2;
			maze();
			movement(lives, stage, x, y, pacman, score, enemy1, enemy2, e1Y, e1X, e2Y, e2X);
			gotoxy(30, 11);
		}
		if (stage == 3)
		{
			system("CLS");
			if (f == 3)
			{
				restart_map(Xmap);
				maze_generator(Xmap);
				f++;
			}
			default_map(Xmap);
			char enemy1 = '@';
			char enemy2 = '@';
			int x = 30, y = 10;
			map[y][x] = pacman;
			int e1Y = 9, e1X = 2;
			map[e1Y][e1X] = enemy1;
			int e2Y = 9, e2X = 55;
			map[e2Y][e2X] = enemy2;
			maze();
			movement(lives, stage, x, y, pacman, score, enemy1, enemy2, e1Y, e1X, e2Y, e2X);
			gotoxy(30, 11);
		}
		if (stage == 4)
		{
			system("CLS");
			if (f == 4)
			{
				restart_map(Xmap);
				maze_generator(Xmap);
				f++;
			}
			default_map(Xmap);
			char enemy1 = '@';
			char enemy2 = '@';
			int x = 30, y = 10;
			map[y][x] = pacman;
			int e1Y = 9, e1X = 2;
			map[e1Y][e1X] = enemy1;
			int e2Y = 9, e2X = 55;
			map[e2Y][e2X] = enemy2;
			maze();
			movement(lives, stage, x, y, pacman, score, enemy1, enemy2, e1Y, e1X, e2Y, e2X);
			gotoxy(30, 11);
		}
		if (stage == 5)
		{
			system("CLS");
			if (f == 5)
			{
				restart_map(Xmap);
				maze_generator(Xmap);
				f++;
			}
			default_map(Xmap);
			char enemy1 = '@';
			char enemy2 = '@';
			int x = 30, y = 10;
			map[y][x] = pacman;
			int e1Y = 9, e1X = 2;
			map[e1Y][e1X] = enemy1;
			int e2Y = 9, e2X = 55;
			map[e2Y][e2X] = enemy2;
			maze();
			movement(lives, stage, x, y, pacman, score, enemy1, enemy2, e1Y, e1X, e2Y, e2X);
			gotoxy(30, 11);
		}
		if (stage > 5)
		{
			system("CLS");
			gotoxy(30, 9);
			cout << "YOUR SCORE = " << score << endl;
			gotoxy(30, 10);
			cout << "Congratulations ! You have ended the game !!! " << endl;
			gotoxy(30, 11);
			break;
		}
	}

	return 0;
}