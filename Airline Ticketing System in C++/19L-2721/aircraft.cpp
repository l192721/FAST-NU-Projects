#include"aircraft.h"
aircraft::aircraft() : seats()
{
	name = "Boeing Un named";
}
aircraft::aircraft(aircraft &A) : seats(A)
{
	name = A.name;
}
aircraft::~aircraft()
{
	cout << "Destructor of Aircraft Class called...\n";
}
aircraft::aircraft(string x, int a, int b) : seats(a, b)
{
	name = x;
}
void aircraft::display()
{
	cout << "Aircraft name = " << name << endl;
	seats::display();
}
void aircraft::input(string x, string s, string d, int a, int b)
{
	name = x;
	if (a>5 || b > 3)
	{
		cout << "Seat index is not within the aircraft\n";
	}
	else if (seat[a][b] == false)
	{
		cout << "Seat of index (" << a << ", " << b << ") booked Successfully\n";
		seat[a][b] = true;
	}
	else cout << "Sorry....Your desired seat is already booked\n";

}
void aircraft::input(int a, int b)
{
	if (a>5 || b > 3)
	{
		cout << "Seat index is not within the aircraft\n";
	}
	else if (seat[a][b] == false)
	{
		cout << "Seat of index (" << a << ", " << b << ") booked Successfully\n";
		seat[a][b] = true;
	}
	else cout << "Sorry....Your desired seat is already booked\n";
}
