#include<iostream>
#include<stdlib.h>
#include<Windows.h>
using namespace std;

void gotoxy(int x, int y)
{
	COORD c = { x, y };
	SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), c);
}

void simulateHourglass(int totalTime, char ch)
{
	system("CLS");
	cout << " ";
	for (int x = 1; x <= 2 * totalTime; x++)
		cout << "-";
	cout << endl;
	int i = 0, j = 0;
	for (i = totalTime; i >= 1; i--)
	{

		for (j = 0; j < totalTime - i; j++)
		{
			cout << " ";
		}

		cout << "\\";

		for (int j = (2 - i); j < (2 - i) + ((2 * i) - 1); j++)
		{
			cout << ch;
		}

		cout << "/" << endl;
	}


	for (int i = 1; i <= totalTime; i++)
	{
		for (int j = 1; j <= totalTime - i; j++)
		{
			cout << " ";
		}
		cout << "/";
		for (int k = 1; k <= (2 * i) - 1; k++)
		{
			cout << " ";
		}
		cout << "\\" << endl;
	}
	cout << " ";
	for (int x = 1; x <= 2 * totalTime; x++)
		cout << "-";
	cout << endl;

	Sleep(1000);

	for (float i = 1; i <= totalTime; i++)
	{

		for (int j = i; j <= (2 * totalTime) - i; j++)
		{

			gotoxy(j, i);

			cout << " ";
		}

		int r = 2 * totalTime - i + 1;
		for (int z = i; z <= (totalTime * 2) - i; z++)
		{
			gotoxy(z, r);

			cout << ch;
		}
		Sleep(1000);
	}
	gotoxy(0, 2 * totalTime + 1);
	cout << endl;

}

int main()
{
	int n;
	char c;
	cout << "Enter the Total Time: ";
	cin >> n;
	while (n < 1)
	{
		cout << "Time should be greater than 0 " << endl;
		cin >> n;
	}
	cout << "Enter the Sand Particle Shape: ";
	cin >> c;
	simulateHourglass(n, c);

	system("pause");
	return 0;
}