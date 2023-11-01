#include"aircraft.h"
class DomesticFlight:public aircraft
{
private:
	int static num_of_flights;//Point 14
	string source;
	string destination;
public:
	DomesticFlight();
	DomesticFlight(string x, string s, string d, int a, int b);
	DomesticFlight(DomesticFlight &A);
	~DomesticFlight();
	void input(string x,string s,string d, int a, int b);
    void display();
	void show_total_flights();
	void operator++();
	bool operator==(DomesticFlight &X);
	void operator=(DomesticFlight &X);
	friend void modify_class(DomesticFlight &X);
};