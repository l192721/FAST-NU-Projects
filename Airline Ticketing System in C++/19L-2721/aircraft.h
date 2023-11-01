#include"seats.h"
class aircraft : public seats //Point 6
{
protected://Point 1
	string name;
public://Point 1
	aircraft();
	aircraft(aircraft &A);
	~aircraft();
	aircraft(string x, int a, int b);//Point 2
	void input(int a, int b);
	void input(string x,string s,string d, int a, int b);//point 5
	void display();
};