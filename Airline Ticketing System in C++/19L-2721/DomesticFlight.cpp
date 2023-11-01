#include"DomesticFlight.h"

int DomesticFlight :: num_of_flights = 0;

DomesticFlight::DomesticFlight() :aircraft()
{
	source = "Un-initialized Source";
	destination = "Un-initialized Destination";
	num_of_flights++;
}
DomesticFlight::DomesticFlight(string x, string s, string d, int a, int b) : aircraft(x,a,b)
{
	source = s;
	destination = d;
	num_of_flights++;
}
DomesticFlight::DomesticFlight(DomesticFlight &A) :aircraft(A)
{
	source = A.source;
	destination = A.destination;
}
DomesticFlight::~DomesticFlight()
{
	cout << "Destructor of DomesticFlight called\n";
}
void DomesticFlight::input(string x, string s, string d, int a, int b)
{
	source = s;
	destination = d;
	aircraft::input(x,s,d, a, b);
}
void DomesticFlight::show_total_flights()
{
	cout << "Total No. of Planes booked : " << num_of_flights << endl;
}
void DomesticFlight::display()
{
	cout << endl;
	cout << "Source : " << source << "\		Destination : " << destination << endl;
	aircraft::display();
}
void DomesticFlight:: operator++()
{

	bool check = false;
	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			if (seat[i][j] == false)
			{
				cout << "Seat of index (" << i << ", " << j << ") booked Successfully\n";
				seat[i][j] = true;
				check = true;
				break;
			}
		}
		if (check)
			break;
	}
	if (!check)
		cout << "Sorry...All seats of the Aircraft are already booked\n";
}
bool DomesticFlight:: operator==(DomesticFlight &X)
{
	if (name != X.name || source != X.source || destination != X.destination)
		return false;
	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			if (X.seat[i][j] != seat[i][j])
				return false;
		}
	}
	return true;
}
void DomesticFlight:: operator=(DomesticFlight &X)
{
	destination = X.destination;
	source = X.source;
	name = X.name;
	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			seat[i][j] = X.seat[i][j];
		}
	}
}
void modify_class(DomesticFlight &X)
{
	X.source = "Modified Source";
	X.destination = "Modified Destination";
	X.name = "Modified Aircraft";
	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			X.seat[i][j] = true;
		}
	}
}