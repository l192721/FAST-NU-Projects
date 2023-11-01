#include<iostream>
#include<string>
#include<fstream>
#include<Windows.h>
using namespace std;

class Room
{
protected:
	static int num_checkins;
	static int num_checkouts;
	string firstname;
	string lastname;
	int age;
	string gender;
	string cnic;
	int balance;
	int days;
	string check_in;
	string check_out;
	int time_remaining;
	string type;
public:
	Room()
	{
		firstname = "";
		lastname = "";
		age = 0;
		gender = "";
		cnic = "";
		balance = 0;
		days = 0;
		check_in = "";
		check_out = "";
		time_remaining = 0;
		type = "";
	}
	Room(string type)
	{
		firstname = "";
		lastname = "";
		age = 0;
		gender = "";
		cnic = "";
		balance = 0;
		days = 0;
		check_in = "";
		check_out = "";
		time_remaining = 0;
		this->type = type;
	}
	virtual~Room(){}

	virtual void setfloorandroom(int fl, int r) = 0;
	virtual void setfirstname(string f) = 0;
	virtual void setlastname(string l) = 0;
	virtual void setage(int a) = 0;
	virtual void setgender(string g) = 0;
	virtual void setcnic(string c) = 0;
	virtual void setdays(int d) = 0;
	virtual void checkin(int fl, int r, string ci) = 0;
	virtual void checkout() = 0;
	virtual void view_reserved_rooms() = 0;
	virtual void detailed_report() = 0;
	void display(){}
};

class Standard :public Room
{
private:
	int price = 300;
	int floor;
	int room_number;
	int **arr;
public:
	Standard() : Room("Standard")
	{
		floor = 0;
		room_number = 0;
		arr = new int*[5];
		for (int i = 0; i < 5; i++)
		{
			*(arr + i) = new int[10];
		}
	}
	~Standard()
	{
		for (int i = 0; i < 5; i++)
			delete[]arr[i];
		delete arr;
	}
	void setfloorandroom(int fl, int r)
	{
		floor = fl - 1;
		room_number = r - 1;
	}
	void setfirstname(string f)
	{
		firstname = f;
	}
	void setlastname(string l)
	{
		lastname = l;
	}
	void setage(int a)
	{
		age = a;
	}
	void setgender(string g)
	{
		gender = g;
	}
	void setcnic(string c)
	{
		cnic = c;
	}
	void setdays(int d)
	{
		days = d;
		balance = price*days;
		if (arr[floor][room_number] != 1 && arr[floor][room_number] != 2)
		{
			arr[floor][room_number] = 1;
			cout << "Room No." << room_number + 1 << " of floor " << floor + 1 << " of Standard type has been booked successfully.\n";
			cout << "Your balance is : " << balance << endl;
		}
		else cout << "Sorry, this room is already occupied.\n";
	}
	void checkin(int fl, int r, string ci)
	{

		if (arr[fl - 1][r - 1] == 1)
		{
			cout << "You have checked in successfully.\n";
			arr[fl - 1][r - 1] = 2;
			num_checkins++;
		}
		else cout << "You haven't booked this room. !!!\n";
	}
	void checkout()
	{
		cout << "Enter the Room No.  : "; cin >> room_number;
		cout << "Enter the Floor your room was at : "; cin >> floor;
		if (arr[floor - 1][room_number - 1] == 2)
		{
			cout << "Enter your check out time in the following format (01-01-21---08:00PM) : "; cin >> check_out;
			cout << "You have checked out successfully\n";
			arr[floor - 1][room_number - 1] = 0;
			num_checkouts++;
		}
		else cout << "This room wasn't checked in !!!\n";
	}
	void view_reserved_rooms()
	{
		cout << "Reserved Rooms of Standard Category at each floor are given as below :- \n";

		cout << "    ";
		for (int i = 0; i < 5; i++)
		{
			if (i == 0)//Printing room no. only at the first iteration.
			{
				for (int j = 0; j < 10; j++)
					cout << j + 1 << "   ";
				cout << endl;
			}
			cout << i + 1 << "   ";//printing floor number with every iteration.
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 11);
					cout << "R   ";
					SetConsoleTextAttribute(h, 7);
				}
				else if (arr[i][j] == 2)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 14);
					cout << "C   ";
					SetConsoleTextAttribute(h, 7);
				}
				else cout << "O   ";
			}
			cout << endl;
		}
	}
	void detailed_report()
	{
		cout << "Number of Checkins Today : " << num_checkins << endl;//These lines will be displayed only in this child class
		cout << "Number of Checkouts Today : " << num_checkouts << endl;//These lines will be displayed only in this child class
		int counter = 0;
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1 || arr[i][j] == 2)
					counter++;
			}
		}
		cout << counter << " number of " << "Standard Rooms have been booked.\n";
		cout << 50 - counter << " number of " << "Standard Rooms are empty.\n";
	}
};

class Moderate :public Room
{
private:
	int price = 500;
	int floor;
	int room_number;
	int **arr;
public:
	Moderate() : Room("Moderate")
	{
		floor = 0;
		room_number = 0;
		arr = new int*[5];
		for (int i = 0; i < 5; i++)
		{
			*(arr + i) = new int[10];
		}
	}
	~Moderate()
	{
		for (int i = 0; i < 5; i++)
			delete[]arr[i];
		delete arr;
	}
	void setfloorandroom(int fl, int r)
	{
		floor = fl - 1;
		room_number = r - 1;
	}
	void setfirstname(string f)
	{
		firstname = f;
	}
	void setlastname(string l)
	{
		lastname = l;
	}
	void setage(int a)
	{
		age = a;
	}
	void setgender(string g)
	{
		gender = g;
	}
	void setcnic(string c)
	{
		cnic = c;
	}
	void setdays(int d)
	{
		days = d;
		balance = price*days;
		if (arr[floor][room_number] != 1 && arr[floor][room_number] != 2)
		{
			arr[floor][room_number] = 1;
			cout << "Room No." << room_number + 1 << " of floor " << floor + 1 << " of Moderate type has been booked successfully.\n";
			cout << "Your balance is : " << balance << endl;
		}
		else cout << "Sorry, this room is already occupied.\n";
	}
	void checkin(int fl, int r, string ci)
	{

		if (arr[fl - 1][r - 1] == 1)
		{
			cout << "You have checked in successfully.\n";
			arr[fl - 1][r - 1] = 2;
			num_checkins++;
		}
		else cout << "You haven't booked this room. !!!\n";
	}
	void checkout()
	{
		cout << "Enter the Room No.  : "; cin >> room_number;
		cout << "Enter the Floor your room was at : "; cin >> floor;
		if (arr[floor - 1][room_number - 1] == 2)
		{
			cout << "Enter your check out time in the following format (01-01-21---08:00PM) : "; cin >> check_out;
			cout << "You have checked out successfully\n";
			arr[floor - 1][room_number - 1] = 0;
			num_checkouts++;
		}
		else cout << "This room wasn't checked in !!!\n";
	}
	void view_reserved_rooms()
	{
		cout << "Reserved Rooms of Moderate Category at each floor are given as below :- \n";

		cout << "    ";
		for (int i = 0; i < 5; i++)
		{
			if (i == 0)//Printing room no. only at the first iteration.
			{
				for (int j = 0; j < 10; j++)
					cout << j + 1 << "   ";
				cout << endl;
			}
			cout << i + 1 << "   ";//printing floor number with every iteration.
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 11);
					cout << "R   ";
					SetConsoleTextAttribute(h, 7);
				}
				else if (arr[i][j] == 2)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 14);
					cout << "C   ";
					SetConsoleTextAttribute(h, 7);
				}
				else cout << "O   ";
			}
			cout << endl;
		}
	}
	void detailed_report()
	{
		int counter = 0;
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1 || arr[i][j] == 2)
					counter++;
			}
		}
		cout << counter << " number of " << "Moderate Rooms have been booked.\n";
		cout << 50 - counter << " number of " << "Moderate Rooms are empty.\n";
	}
};

class Superior :public Room
{
private:
	int price = 1000;
	int floor;
	int room_number;
	int **arr;
public:
	Superior() : Room("Superior")
	{
		floor = 0;
		room_number = 0;
		arr = new int*[5];
		for (int i = 0; i < 5; i++)
		{
			*(arr + i) = new int[10];
		}
	}
	~Superior()
	{
		for (int i = 0; i < 5; i++)
			delete[]arr[i];
		delete arr;
	}
	void setfloorandroom(int fl, int r)
	{
		floor = fl - 1;
		room_number = r - 1;
	}
	void setfirstname(string f)
	{
		firstname = f;
	}
	void setlastname(string l)
	{
		lastname = l;
	}
	void setage(int a)
	{
		age = a;
	}
	void setgender(string g)
	{
		gender = g;
	}
	void setcnic(string c)
	{
		cnic = c;
	}
	void setdays(int d)
	{
		days = d;
		balance = price*days;
		if (arr[floor][room_number] != 1 && arr[floor][room_number] != 2)
		{
			arr[floor][room_number] = 1;
			cout << "Room No." << room_number + 1 << " of floor " << floor + 1 << " of Superior type has been booked successfully.\n";
			cout << "Your balance is : " << balance << endl;
		}
		else cout << "Sorry, this room is already occupied.\n";
	}
	void checkin(int fl, int r, string ci)
	{

		if (arr[fl - 1][r - 1] == 1)
		{
			cout << "You have checked in successfully.\n";
			arr[fl - 1][r - 1] = 2;
			num_checkins++;
		}
		else cout << "You haven't booked this room. !!!\n";
	}
	void checkout()
	{
		cout << "Enter the Room No.  : "; cin >> room_number;
		cout << "Enter the Floor your room was at : "; cin >> floor;
		if (arr[floor - 1][room_number - 1] == 2)
		{
			cout << "Enter your check out time in the following format (01-01-21---08:00PM) : "; cin >> check_out;
			cout << "You have checked out successfully\n";
			arr[floor - 1][room_number - 1] = 0;
			num_checkouts++;
		}
		else cout << "This room wasn't checked in !!!\n";
	}
	void view_reserved_rooms()
	{
		cout << "Reserved Rooms of Superior Category at each floor are given as below :- \n";

		cout << "    ";
		for (int i = 0; i < 5; i++)
		{
			if (i == 0)//Printing room no. only at the first iteration.
			{
				for (int j = 0; j < 10; j++)
					cout << j + 1 << "   ";
				cout << endl;
			}
			cout << i + 1 << "   ";//printing floor number with every iteration.
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 11);
					cout << "R   ";
					SetConsoleTextAttribute(h, 7);
				}
				else if (arr[i][j] == 2)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 14);
					cout << "C   ";
					SetConsoleTextAttribute(h, 7);
				}
				else cout << "O   ";
			}
			cout << endl;
		}
	}
	void detailed_report()
	{
		int counter = 0;
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1 || arr[i][j] == 2)
					counter++;
			}
		}
		cout << counter << " number of " << "Superior Rooms have been booked.\n";
		cout << 50 - counter << " number of " << "Superior Rooms are empty.\n";
	}
};

class JuniorSuite :public Room
{
private:
	int price = 2000;
	int floor;
	int room_number;
	int **arr;
public:
	JuniorSuite() : Room("JuniorSuite")
	{
		floor = 0;
		room_number = 0;
		arr = new int*[5];
		for (int i = 0; i < 5; i++)
		{
			*(arr + i) = new int[10];
		}
	}
	~JuniorSuite()
	{
		for (int i = 0; i < 5; i++)
			delete[]arr[i];
		delete arr;
	}
	void setfloorandroom(int fl, int r)
	{
		floor = fl - 1;
		room_number = r - 1;
	}
	void setfirstname(string f)
	{
		firstname = f;
	}
	void setlastname(string l)
	{
		lastname = l;
	}
	void setage(int a)
	{
		age = a;
	}
	void setgender(string g)
	{
		gender = g;
	}
	void setcnic(string c)
	{
		cnic = c;
	}
	void setdays(int d)
	{
		days = d;
		balance = price*days;
		if (arr[floor][room_number] != 1 && arr[floor][room_number] != 2)
		{
			arr[floor][room_number] = 1;
			cout << "Room No." << room_number + 1 << " of floor " << floor + 1 << " of JuniorSuite type has been booked successfully.\n";
			cout << "Your balance is : " << balance << endl;
		}
		else cout << "Sorry, this room is already occupied.\n";
	}
	void checkin(int fl, int r, string ci)
	{

		if (arr[fl - 1][r - 1] == 1)
		{
			cout << "You have checked in successfully.\n";
			arr[fl - 1][r - 1] = 2;
			num_checkins++;
		}
		else cout << "You haven't booked this room. !!!\n";
	}
	void checkout()
	{
		cout << "Enter the Room No.  : "; cin >> room_number;
		cout << "Enter the Floor your room was at : "; cin >> floor;
		if (arr[floor - 1][room_number - 1] == 2)
		{
			cout << "Enter your check out time in the following format (01-01-21---08:00PM) : "; cin >> check_out;
			cout << "You have checked out successfully\n";
			arr[floor - 1][room_number - 1] = 0;
			num_checkouts++;
		}
		else cout << "This room wasn't checked in !!!\n";
	}
	void view_reserved_rooms()
	{
		cout << "Reserved Rooms of JuniorSuite Category at each floor are given as below :- \n";

		cout << "    ";
		for (int i = 0; i < 5; i++)
		{
			if (i == 0)//Printing room no. only at the first iteration.
			{
				for (int j = 0; j < 10; j++)
					cout << j + 1 << "   ";
				cout << endl;
			}
			cout << i + 1 << "   ";//printing floor number with every iteration.
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 11);
					cout << "R   ";
					SetConsoleTextAttribute(h, 7);
				}
				else if (arr[i][j] == 2)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 14);
					cout << "C   ";
					SetConsoleTextAttribute(h, 7);
				}
				else cout << "O   ";
			}
			cout << endl;
		}
	}
	void detailed_report()
	{
		int counter = 0;
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1 || arr[i][j] == 2)
					counter++;
			}
		}
		cout << counter << " number of " << "JuniorSuite Rooms have been booked.\n";
		cout << 50 - counter << " number of " << "JuniorSuite Rooms are empty.\n";
	}
};

class Suite :public Room
{
private:
	int price = 5000;
	int floor;
	int room_number;
	int **arr;
public:
	Suite() : Room("Suite")
	{
		floor = 0;
		room_number = 0;
		arr = new int*[5];
		for (int i = 0; i < 5; i++)
		{
			*(arr + i) = new int[10];
		}
	}
	~Suite()
	{
		for (int i = 0; i < 5; i++)
			delete[]arr[i];
		delete arr;
	}
	void setfloorandroom(int fl, int r)
	{
		floor = fl - 1;
		room_number = r - 1;
	}
	void setfirstname(string f)
	{
		firstname = f;
	}
	void setlastname(string l)
	{
		lastname = l;
	}
	void setage(int a)
	{
		age = a;
	}
	void setgender(string g)
	{
		gender = g;
	}
	void setcnic(string c)
	{
		cnic = c;
	}
	void setdays(int d)
	{
		days = d;
		balance = price*days;
		if (arr[floor][room_number] != 1 && arr[floor][room_number] != 2)
		{
			arr[floor][room_number] = 1;
			cout << "Room No." << room_number + 1 << " of floor " << floor + 1 << " of Suite type has been booked successfully.\n";
			cout << "Your balance is : " << balance << endl;
		}
		else cout << "Sorry, this room is already occupied.\n";
	}
	void checkin(int fl, int r, string ci)
	{

		if (arr[fl - 1][r - 1] == 1)
		{
			cout << "You have checked in successfully.\n";
			arr[fl - 1][r - 1] = 2;
			num_checkins++;
		}
		else cout << "You haven't booked this room. !!!\n";
	}
	void checkout()
	{
		cout << "Enter the Room No.  : "; cin >> room_number;
		cout << "Enter the Floor your room was at : "; cin >> floor;
		if (arr[floor - 1][room_number - 1] == 2)
		{
			cout << "Enter your check out time in the following format (01-01-21---08:00PM) : "; cin >> check_out;
			cout << "You have checked out successfully\n";
			arr[floor - 1][room_number - 1] = 0;
			num_checkouts++;
		}
		else cout << "This room wasn't checked in !!!\n";
	}
	void view_reserved_rooms()
	{
		cout << "Reserved Rooms of Suite Category at each floor are given as below :- \n";

		cout << "    ";
		for (int i = 0; i < 5; i++)
		{
			if (i == 0)//Printing room no. only at the first iteration.
			{
				for (int j = 0; j < 10; j++)
					cout << j + 1 << "   ";
				cout << endl;
			}
			cout << i + 1 << "   ";//printing floor number with every iteration.
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 11);
					cout << "R   ";
					SetConsoleTextAttribute(h, 7);
				}
				else if (arr[i][j] == 2)
				{
					HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
					SetConsoleTextAttribute(h, 14);
					cout << "C   ";
					SetConsoleTextAttribute(h, 7);
				}
				else cout << "O   ";
			}
			cout << endl;
		}
	}
	void detailed_report()
	{
		int counter = 0;
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 10; j++)
			{
				if (arr[i][j] == 1 || arr[i][j] == 2)
					counter++;
			}
		}
		cout << counter << " number of " << "Suite Rooms have been booked.\n";
		cout << 50 - counter << " number of " << "Suite Rooms are empty.\n";
	}
};

int Room::num_checkins = 0;
int Room::num_checkouts = 0;

void main()
{
	//Object Declaration
	Room *ptr;
	Standard std;
	Moderate mdt;
	Superior sup;
	JuniorSuite jsu;
	Suite su;

	ifstream fin;
	fin.open("rooms.txt");

	int option1, option2;
	while (fin.eof() == false)
	{
		fin >> option1;
		if (option1 == 1)
		{
			int fl, r, a, d;
			string f, l, g, c;
			fin >> option2;

			if (option2 == 1)
				ptr = &std;
			else if (option2 == 2)
				ptr = &mdt;
			else if (option2 == 3)
				ptr = &sup;
			else if (option2 == 4)
				ptr = &jsu;
			else
				ptr = &su;

			fin >> fl;
			fin >> r;
			ptr->setfloorandroom(fl, r);
			fin >> f;
			ptr->setfirstname(f);
			fin >> l;
			ptr->setlastname(l);
			fin >> a;
			ptr->setage(a);
			fin >> g;
			ptr->setgender(g);
			fin >> c;
			ptr->setcnic(c);
			fin >> d;
			ptr->setdays(d);
		}
		else if (option1 == 2)
		{
			fin >> option2;

			if (option2 == 1)
				ptr = &std;
			else if (option2 == 2)
				ptr = &mdt;
			else if (option2 == 3)
				ptr = &sup;
			else if (option2 == 4)
				ptr = &jsu;
			else
				ptr = &su;

			int fl, r;
			string ci;
			fin >> fl;
			fin >> r;
			fin >> ci;
			ptr->checkin(fl, r, ci);
		}

	}

	system("CLS");

	cout << "------------------------------------------------\n";
	cout << "------------HOTEL MANAGEMENT SYSTEM-------------\n";
	cout << "------------------------------------------------\n\n\n";

	fin.close();
	ofstream fout;
	fout.open("rooms.txt", ios::app);

	do
	{
		cout << "Press 1 to Reserve a Room\n";
		cout << "Press 2 to Check In a Customer\n";
		cout << "Press 3 to view Reserved Rooms\n";
		cout << "Press 4 to see detailed Report\n";
		cout << "Press 5 to exit\n";
		cin >> option1;

		if (option1 == 1)
		{
			int r, fl, a, d;
			string f, l, g, c;
			cout << "Press 1 for Standard Room \n";
			cout << "Press 2 for Moderate Room\n";
			cout << "Press 3 for Superior Room\n";
			cout << "Press 4 for JuniorSuite\n";
			cout << "Press 5 for Suite\n";

			cin >> option2;

			if (option2 == 1)
				ptr = &std;
			else if (option2 == 2)
				ptr = &mdt;
			else if (option2 == 3)
				ptr = &sup;
			else if (option2 == 4)
				ptr = &jsu;
			else
				ptr = &su;

			cout << "Enter the floor you want to reserve the room at : ";
			cin >> fl;
			while (fl > 5 || fl < 1)
			{
				cout << "Floor must be greater than 0 & less than 6.\n";
				cin >> fl;
			}
			cout << "Enter the Room number you want to reserve : ";
			cin >> r;
			while (r > 10 || r < 1)
			{
				cout << "Room must be greater than 0 & less than 11.\n";
				cin >> r;
			}

			char choice;
			cout << "Are you a new customer ? Press Y for 'Yes' & N for 'No'.\n";
			cin >> choice;
			if (choice == 'Y' || choice == 'y')
			{
				cout << "Enter your full name : ";
				cin >> f;
				cin >> l;
				ptr->setfirstname(f);
				ptr->setlastname(l);

				cout << "Enter your age : ";
				cin >> a;
				ptr->setage(a);

				cout << "Enter your gender : ";
				cin >> g;
				ptr->setgender(g);

				cout << "Enter your CNIC No. : ";
				cin >> c;
				ptr->setcnic(c);

				ptr->setfloorandroom(fl, r);
				cout << "Enter your days of stay : ";
				cin >> d;
				ptr->setdays(d);

				ofstream FOUT;
				FOUT.open("customers.txt", ios::app);
				if (FOUT.is_open() == true)
				{
					FOUT << f << endl << l << endl << a << endl << g << endl << c << endl;
					FOUT.close();
				}

				fout << endl << option1 << endl << option2 << endl << fl << endl << r << endl << f << endl << l << endl << a << endl << g << endl << c << endl << d;
			}
			else
			{
				cout << "Enter your full name : ";
				cin >> f;
				cin >> l;
				ifstream FIN;
				FIN.open("customers.txt");
				bool x = false;//To check if info has been found or not.
				while (FIN.eof() == false)
				{
					string checkf, checkl;
					FIN >> checkf;
					if (f == checkf )
					{
						FIN >> checkl;
						if (l == checkl)
						{
							x = true;
							FIN >> a;
							FIN >> g;
							FIN >> c;
							cout << "Information retrieved successfully.\n";
						}
					}
					if (x == true)
						break;
				}
				FIN.close();
				if (x == true)
				{
					cout << "Enter your days of stay : ";
					cin >> d;
					while (d < 1)
					{
						cout << "Days must be greater than 0.\n";
						cin >> d;
					}
					ptr->setfirstname(f);
					ptr->setlastname(l);
					ptr->setage(a);
					ptr->setgender(g);
					ptr->setcnic(c);
					ptr->setfloorandroom(fl, r);
					ptr->setdays(d);
					fout << endl << option1 << endl << option2 << endl << fl << endl << r << endl << f << endl << l << endl << a << endl << g << endl << c << endl << d;
				}
				else
				{
					cout << "Sorry. We couldn't found your name in our database\n";
				}

			}

		}
		if (option1 == 2)
		{
			cout << "Press 1 for Standard Room \n";
			cout << "Press 2 for Moderate Room\n";
			cout << "Press 3 for Superior Room\n";
			cout << "Press 4 for JuniorSuite\n";
			cout << "Press 5 for Suite\n";
			cin >> option2;

			if (option2 == 1)
				ptr = &std;
			else if (option2 == 2)
				ptr = &mdt;
			else if (option2 == 3)
				ptr = &sup;
			else if (option2 == 4)
				ptr = &jsu;
			else
				ptr = &su;


			int fl, r;
			string ci;
			cout << "Enter the Floor you reserved the room at : ";
			cin >> fl;
			while (fl > 5 || fl < 1)
			{
				cout << "Floor must be greater than 0 & less than 6.\n";
				cin >> fl;
			}
			cout << "Enter the Room number you reserved : ";
			cin >> r;
			while (r > 10 || r < 1)
			{
				cout << "Room must be greater than 0 & less than 11.\n";
				cin >> r;
			}

			cout << "Enter your Check-In time in the following format(01-01-2021---08:00) : ";
			cin >> ci;
			ptr->checkin(fl, r, ci);
			fout << endl << option1 << endl << option2 << endl << fl << endl << r << endl << ci;
		}
		if (option1 == 3)
		{
			cout << "'R' represents a Reserved Room, 'O' represents an Empty room, 'C' represents a checked-in room.\n";
			cout << "Room No. is given  horizontally, Floor Number is given vertically.\n";
			ptr = &std;
			ptr->view_reserved_rooms();
			ptr = &mdt;
			ptr->view_reserved_rooms();
			ptr = &sup;
			ptr->view_reserved_rooms();
			ptr = &jsu;
			ptr->view_reserved_rooms();
			ptr = &su;
			ptr->view_reserved_rooms();
		}
		if (option1 == 4)
		{
			ptr = &std;
			ptr->detailed_report();
			ptr = &mdt;
			ptr->detailed_report();
			ptr = &sup;
			ptr->detailed_report();
			ptr = &jsu;
			ptr->detailed_report();
			ptr = &su;
			ptr->detailed_report();
		}
		if (option1 == 5)
			break;

	} while (option1 != 5);

	system("pause");
}