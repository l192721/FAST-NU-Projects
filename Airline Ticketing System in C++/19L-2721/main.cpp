#include"DomesticFlight.h"
void separation()
{
	cout << "------------------------------------------------------------------------------------\n";//Function to make the output more clear
}
void function_point_16(DomesticFlight const &A)
{
	//A.input("Function-16 AirPlane","Lahore","Karachi",4, 1);
	//The above operation is commented as it cant be performed because a const object is passed to a function, which cant be modified. 
}
void main()
{
	separation();
	cout << "Point No.4 and 5 :-\n";
	separation();

	DomesticFlight A;
	seats*S = &A;
	S->input("Pointer Plane", "Karachi", "Islamabad", 1, 1);
	S->input(10, 1);
	S->input(3, 0);
	S->display();//Point 5, the display function is over-ridden as we can see the name of Aircraft,source & destination getting Printed Along with the seats

	//////////////////////////////////////////////////////

	separation();
	cout << "Point No.8 :-\n";
	separation();

	A.display();
	modify_class(A);//Point 8
	A.display();

	/////////////////////////////////
	separation();
	cout << "Point No.9 :-\n";
	separation();
	DomesticFlight C;
	A = C;
	DomesticFlight D(A);
	A.input("Newly named plane", "Gilgit", "Gawadar", 1, 1);
	A.display();
	D.display();


	/////////////////////////////////
	separation();
	cout << "Point No.10 :-\n";
	separation();
	{DomesticFlight B;}//Point 10 to show working of destructor


	/////////////////////////////////
	separation();
	cout << "Point No.11 :-\n";
	separation();
	A++;
	A.display();

	DomesticFlight B;
	B.display();

	A = B;
	A.display();

	if (A == B)
		cout << "(A==B) returns true\n";
	else cout << "(A==B) returns false\n";



	///////////////////////////////
	separation();
	cout << "Point No.12 :-\n";
	separation();
	seats *S2 = new DomesticFlight("Boeing 787", "PointerSource City", "PointerDestination City", 2, 1);//Point 4
	S2->input(1, 1);
	S2->input(1, 2);
	S2->display();
	delete S2;//Point 12
	S2 = nullptr;
	

	separation();
	cout << "Point No.14 :-\n";
	separation();
	A.show_total_flights();
	 

	////////////////////////////////
	separation();
	cout << "Point No.16 :-\n";
	separation();
	A.display();
	function_point_16(A);//This function will make a copy of the object passed here,i.e A, but as it has been passed as a constant reference,it wont be able to make any changes in the object.
	A.display();


	separation();
	system("pause");
}