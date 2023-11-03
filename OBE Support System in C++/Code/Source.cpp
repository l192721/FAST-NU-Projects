#include <iostream>
#include <fstream>
#include <cstring>
#include <cstdlib>
#include <vector>
#include <string>
#include <typeinfo>
using namespace std;
string convertToString(char* a, int size)
{
	int i;
	string s = "";
	for (i = 0; i < size; i++) {
		s = s + a[i];

	}
	return s;
}
class CLO
{
private:
	int id;
	string description;
	vector <string> topics;
public:
	CLO()
	{
		id = 0;
		description = "";
	}
	CLO(int i, string des)
	{
		this->description = des;
		this->id = i;
	}
	int getCLOid()
	{
		return id;
	}
	string getdescription()
	{
		return this->description;
	}
	int getid()
	{
		return this->id;
	}
	void setid(int id)
	{
		this->id = id;
	}
	void setdes(string des)
	{
		this->description = des;
	}
	string getdes()
	{
		return this->description;
	}
	void addCoveredTopic(string t)
	{
		topics.push_back(t);
	}
	void CLOdetails()
	{
		cout << "ID: " << id << endl << "Description: " << description << endl;
	}
	string gettopic(int i)
	{
		return topics[i];
	}
	int getsize()
	{
		return this->topics.size();
	}
	void display()
	{
		CLOdetails();
		cout << "TOPICS\n";
		for (int i = 0; i < topics.size(); i++)
		{
			cout << topics[i] << " ";
		}
	}
};
class course
{
	int CH;
	string title;
public:
	vector<CLO> clos;
	course()
	{
		CH = 0;
		title = "";
	}
	bool removeclo(int id)
	{
		for (int i = 0; i < clos.size(); i++)
		{
			if (clos[i].getid() == id)
			{
				clos.erase(clos.begin() + i);
				return true;
			}
		}
		return false;
	}

	bool updateclo(int id, string des)
	{
		for (int i = 0; i < clos.size(); i++)
		{
			if (clos[i].getid() == id)
			{
				clos[i].setdes(des);
				return true;
			}
		}
		return false;
	}
	course(int ch, string title)
	{
		this->CH = ch;
		this->title = title;
	}
	CLO getclo(int i)
	{
		return this->clos[i];
	}
	int getsize()
	{
		return this->clos.size();
	}
	void addclos(CLO c)
	{
		clos.push_back(c);
	}
	int getch()
	{
		return this->CH;
	}
	string gettitle()
	{
		return this->title;
	}
	void settitle(string title)
	{
		this->title = title;
	}
	void setch(int ch)
	{
		this->CH = ch;
	}
	void getclos()
	{
		for (int i = 0; i < clos.size(); i++)
		{
			clos[i].CLOdetails();
		}
	}
	void display()
	{
		cout << "Credit Hour: " << this->CH << endl;
		cout << "Title: " << this->title << endl;
		for (int i = 0; i < clos.size(); i++)
		{
			clos[i].display();
		}
	}
	~course()
	{

	}
};
class PLO
{
public:
	int id;
	string description;
	vector <CLO> clos;

	PLO(int i)
	{
		id = i;
	}
	int getid()
	{
		return this->id;
	}
	string getdes()
	{
		return this->description;
	}
	void addCLO(CLO c)
	{
		clos.push_back(c);
	}
	void getAllCLOS()
	{
		for (int i = 0; i < clos.size(); i++)
			clos[i].CLOdetails();
	}
};
class program
{
	string title;

public:
	vector <course> courses;
	vector <PLO> plos;
	program()
	{
		title = "";
	}
	program(string t)
	{
		title = t;
	}
	string getprogramtitle()
	{
		return title;
	}
	void addplos(PLO p)
	{
		plos.push_back(p);
	}
	void saveplos()
	{
		ofstream fout1, fout2;
		fout1.open("plo.txt", ios::app);
		fout2.open("ploclo.txt", ios::app);
		for (int i = 0; i < plos.size(); i++)
		{
			fout1 << plos[i].getid() << endl;
			for (int j = 0; i < plos[i].clos.size(); j++)
			{
				fout2 << plos[i].clos[j].getid() << "-" << plos[i].clos[j].getdes() << " ";
			}
			fout2 << endl;
		}

	}
	bool removeplo(int id)
	{
		for (int i = 0; i < plos.size(); i++)
		{
			if (plos[i].getid() == id)
			{
				plos.erase(plos.begin() + i);
				return true;
			}

		}
		return false;
	}
	void addCOURSE(course c)
	{
		courses.push_back(c);
	}
	bool removecourse(string title)
	{
		for (int i = 0; i < courses.size(); i++)
		{
			if (courses[i].gettitle() == title)
			{
				courses.erase(courses.begin() + i);
				return true;
			}

		}
		return false;
	}
	course findcourse(string title)
	{
		for (int i = 0; i < courses.size(); i++)
		{
			if (courses[i].gettitle() == title)
			{
				return courses[i];
			}
		}
	}
	bool updatecourse(course c)
	{

		for (int i = 0; i < courses.size(); i++)
		{
			if (courses[i].gettitle() == c.gettitle())
			{
				courses[i].setch(c.getch());
				return true;
			}
		}
		return false;

	}
	void savecourses()
	{
		ofstream fout1, fout2, fout3;
		fout1.open("course.txt", ios::app);
		fout2.open("clo.txt", ios::app);
		fout3.open("topics.txt", ios::app);
		for (int i = 0; i < courses.size(); i++)
		{

			fout1 << courses[i].getch() << "-" << courses[i].gettitle() << " ";
			for (int j = 0; j < courses[i].getsize(); j++)
			{
				for (int i = 0; i < courses[j].clos.size(); i++)
				{
					CLO c = courses[j].clos[i];
					for (int k = 0; k < c.getsize(); k++)
					{
						fout3 << c.gettopic(k) << " ";
					}
					fout3 << endl;
					fout2 << c.getid() << "-" << c.getdescription() << " ";
				}
				fout2 << endl;
			}
		}
		fout1 << endl;
		fout1.close();
		fout2.close();
		fout3.close();

	}
	void settitle(string t)
	{
		this->title = t;
	}
	string gettitle()
	{
		return this->title;
	}
	void display()
	{

		cout << "PROGRAM TITLE: " << this->title << endl;
		for (int i = 0; i < courses.size(); i++)
		{
			courses[i].display();
		}

	}
};
class user
{
	string name;
	string id;
	string type;
	string username;
	string password;
	// user *userlist;
	// int usercount;
public:
	user()
	{

		name = "";
		type = "";
		username = "";
		password = "";
	}

	void display()
	{
		cout << "name: " << this->username << endl;
		cout << "email: " << this->password << endl;
		cout << "id: " << this->id << endl;

	}

	user(string n, string id, string type, string username, string password)
	{
		this->name = n;
		this->id = id;
		this->type = type;
		this->username = username;
		this->password = password;
		// this->usercount=10;
		// userlist=new user[usercount];
	}
	string getname()
	{
		return this->name;
	}
	void setname(string n)
	{
		this->name = n;
	}
	string getid()
	{
		return this->id;
	}
	void setid(string id)
	{
		this->name = id;
	}
	string getpassword()
	{
		return this->password;
	}
	void setphone(string password)
	{
		this->password = password;
	}
	string getusername()
	{
		return this->username;
	}
	void setusername(string username)
	{
		this->username = username;
	}
	string gettype()
	{
		return this->type;
	}
	void settype(string type)
	{
		this->type = type;
	}
	~user()
	{
		//delete []userlist;
	}
};
class teacher : public user
{
public:
	teacher()
	{

	}
	teacher(string name, string id, string type, string username, string password) :user(name, id, type, username, password)
	{

	}

	~teacher()
	{

	}
};
class administrator : public user
{

public:
	vector<program>programs;
	administrator()
	{

	}
	void addprogram(program p)
	{
		programs.push_back(p);
	}
	bool removeprogram(string title)
	{
		for (int i = 0; i < programs.size(); i++)
		{
			if (programs[i].gettitle() == title)
			{
				programs.erase(programs.begin() + i);
				return true;
			}
		}
		return false;
	}
	void setprograms()
	{
		ifstream fin, fin2, fin3, file;
		fin.open("course.txt");
		fin2.open("clo.txt");
		fin3.open("topics.txt");
		file.open("programs.txt");
		char topics[100], tem[100], clos[100], courses[100], temp[100];
		program p;
		string str1;
		getline(file, str1);
		p.settitle(str1);
		int counter = 0;
		while (!fin.eof())
		{

			fin.getline(courses, 100);
			if (courses[0] == '-')
			{
				p.display();
				this->programs.push_back(p);
				getline(file, str1);
				program p(str1);
			}
			else
			{

				int k = 0;
				int m = 0;
				if (courses[0] == ' ')
				{
					k++;
				}
				while (k < strlen(courses))
				{

					if (courses[k] == ' ' || courses[k + 1] == '\0')
					{
						if (courses[k + 1] == '\0')
						{
							tem[m++] = courses[k];
							tem[m] = ' ';
							m++;
						}
						else
						{
							tem[m] = ' ';
							m++;
						}
						m = 0;
						char* word = strtok(tem, "-");
						int num = atoi(word);
						word = strtok(NULL, " ");
						int len = strlen(word);
						string str = convertToString(word, len);
						cout << str << endl;
						course c(num, str);
						fin2.getline(clos, 100);
						char temp[100];
						int i = 0;
						int j = 0;
						if (clos[0] == ' ')
						{
							i++;
						}
						while (i < strlen(clos) + 1)
						{

							if (clos[i] == ' ' || clos[i] == '\0')
							{
								temp[j] = ' ';
								j = 0;
								word = strtok(temp, "-");
								num = atoi(word);
								word = strtok(NULL, " ");
								len = strlen(word);
								str = convertToString(word, len);
								CLO clo(num, str);
								fin3.getline(topics, 100);
								int x = 0, q = 0;
								if (topics[0] == ' ')
								{
									x++;
								}
								char tmp[100];
								while (x < strlen(topics) + 1)
								{

									if (topics[x] == ' ' || topics[x] == '\0')
									{
										q = 0;
										len = strlen(tmp);
										str = convertToString(tmp, len);
										cout << str << endl;
										clo.addCoveredTopic(str);
									}
									else
									{
										tmp[q] = topics[x];
										q++;
									}
									x++;
								}

								c.addclos(clo);


							}
							else
							{
								temp[j] = clos[i];
								j++;
							}
							i++;
						}
						p.addCOURSE(c);



					}
					else
					{
						tem[m] = courses[k];
						m++;
					}
					k++;

				}

			}


		}

		this->programs.push_back(p);

		fin.close();
		file.close();
		fin2.close();
		fin3.close();
	}
	void saveprograms()
	{
		ofstream file;
		file.open("programs.txt", ios::app);
		cout << "NO OF PROGRAMS: " << this->programs.size() << "\n";
		for (int i = 0; i < this->programs.size(); i++)
		{

			if (i > 1)
			{
				ofstream fin;
				fin.open("course.txt", ios::app);
				fin << "-------------------\n";
				fin.close();
			}
			file << programs[i].gettitle() << endl;
			programs[i].savecourses();
			if (i == 0)
			{
				ofstream fin;
				fin.open("course.txt", ios::app);
				fin << "-------------------\n";
				fin.close();
			}
		}
		file.close();
	}
	void removedata()
	{
		ofstream fout1, fout2, fout3, fout4;
		fout1.open("programs.txt");
		fout2.open("course.txt");
		fout3.open("clo.txt");
		fout4.open("topics.txt");
		fout1.close();
		fout2.close();
		fout3.close();
	}

	administrator(string name, string id, string type, string username, string password) :user(name, id, type, username, password)
	{

	}

	~administrator()
	{

	}

};
class list
{
	user* userlist;
	int usercount;
public:
	list()
	{
		usercount = 0;
		userlist = new user[10];
	}
	void getalluser()
	{
		for (int i = 0; i < this->usercount; i++)
		{
			this->userlist[i].display();
		}
	}
	void adduser(user* User)
	{

		userlist[usercount] = *User;
		usercount++;
	}

	void getusers()
	{
		ifstream fin1, fin2;
		fin1.open("C:\\admin.txt");
		fin2.open("C:\\teacher.txt");
		char array[100];
		string arr, name, username, id, type, password;
		int len;
		int c = 0;
		char** token;

		while (!fin1.eof())
		{
			c++;
			fin1.getline(array, 100);
		}


		fin1.close();
		token = new char* [c + 1];
		for (int i = 0; i < c + 1; i++)
		{
			token[i] = new char[100];
		}
		c = 0;
		fin1.open("C:\\admin.txt");
		while (!fin1.eof())
		{

			fin1.getline(array, 100);
			strcpy(token[c], array);
			c++;


		}
		fin1.close();

		for (int i = 0; i < c; i++)
		{
			strcpy(array, token[i]);
			char* word = strtok(array, " ");
			len = strlen(word);
			name = convertToString(word, len);
			word = strtok(NULL, " ");
			len = strlen(word);
			id = convertToString(word, len);
			word = strtok(NULL, " ");
			len = strlen(word);
			username = convertToString(word, len);
			word = strtok(NULL, " ");
			len = strlen(word);
			type = convertToString(word, len);
			word = strtok(NULL, " ");
			len = strlen(word);
			password = convertToString(word, len);
			administrator* user1;
			user1 = new administrator(name, id, type, username, password);
			this->adduser(user1);
			username = "";
			name = "";
			id = "";
			type = "";
			password = "";

		}
		/// save admins
		c = 0;
		while (!fin2.eof())
		{
			c++;
			fin2.getline(array, 100);
		}


		fin2.close();
		token = new char* [c + 1];
		for (int i = 0; i < c + 1; i++)
		{
			token[i] = new char[100];
		}
		c = 0;
		fin2.open("C:\\teacher.txt");
		while (!fin2.eof())
		{

			fin2.getline(array, 100);
			strcpy(token[c], array);
			c++;


		}
		fin2.close();

		for (int i = 0; i < c - 1; i++)
		{
			strcpy(array, token[i]);
			char* word = strtok(array, " ");
			len = strlen(word);
			name = convertToString(word, len);
			word = strtok(NULL, " ");
			len = strlen(word);
			id = convertToString(word, len);
			word = strtok(NULL, " ");
			len = strlen(word);
			username = convertToString(word, len);
			word = strtok(NULL, " ");
			len = strlen(word);
			type = convertToString(word, len);
			word = strtok(NULL, " ");
			len = strlen(word);
			password = convertToString(word, len);
			teacher* t1;
			t1 = new teacher(name, id, type, username, password);
			this->adduser(t1);
			username = "";
			name = "";
			id = "";
			type = "";
			password = "";

		}



	}
	bool login(string username, string pass)
	{
		for (int i = 0; i < this->usercount; i++)
		{
			if (userlist[i].getusername() == username && userlist[i].getpassword() == pass)
			{
				return true;
			}
		}
		return false;
	}
	void saveusers()
	{
		ofstream fout, fout2;
		fout.open("C:\\teacher.txt");
		fout2.open("C:\\admin.txt");

		for (int i = 0; i < this->usercount; i++)
		{
			if (this->userlist[i].gettype() == "teacher")
			{

				fout << this->userlist[i].getname() << " " << this->userlist[i].getid() << " " << this->userlist[i].getusername() << " " << this->userlist[i].gettype() << " " << this->userlist[i].getpassword() << endl;
			}
			else
			{
				fout2 << this->userlist[i].getname() << " " << this->userlist[i].getid() << " " << this->userlist[i].gettype() << endl;
			}

		}
		fout.close();
		fout2.close();
	}
	~list()
	{

	}

};

class EVALUATION
{
protected:
	int Questions;
public:
	EVALUATION(int q)
	{
		Questions = q;
	}
	virtual void isCLOTested(int cloid, int &count) = 0;
};

class Quiz : public EVALUATION
{
private:
	vector<CLO> CLOids;
public:
	Quiz(int q) : EVALUATION(q)
	{}

	void isCLOTested(int cloid, int& count)
	{
		for (int i = 0; i < CLOids.size(); i++)
		{
			if (CLOids[i].getCLOid() == cloid)
			{
				count++;
			}
		}
	}
};

class Assignment : public EVALUATION
{
private:
	vector<CLO> CLOids;
public:
	Assignment(int q) : EVALUATION(q)
	{}

	void isCLOTested(int cloid, int& count)
	{
		for (int i = 0; i < CLOids.size(); i++)
		{
			if (CLOids[i].getCLOid() == cloid)
			{
				count++;
			}
		}
	}
};

class Exam : public EVALUATION
{
private:
	vector<CLO> CLOids;
public:
	Exam(int q) : EVALUATION(q)
	{}

	void isCLOTested(int cloid, int& count)
	{
		for (int i = 0; i < CLOids.size(); i++)
		{
			if (CLOids[i].getCLOid() == cloid)
			{
				count++;
			}
		}
	}
};

int main()
{
	administrator admin;
	admin.setprograms();
	program p("ETRONENGERNING");
	course c(2, "DB");
	CLO clos(2, "electity");
	clos.addCoveredTopic("OHMSLWA");
	clos.addCoveredTopic("OHMDAYA");
	c.addclos(clos);
	p.addCOURSE(c);
	admin.addprogram(p);
	admin.saveprograms();
	for (int i = 0; i < admin.programs.size(); i++)
	{
		admin.programs[i].display();
	}

	//Query to check if a particular CLO has been tested (in 2 or more evaluations) or not 
	vector <EVALUATION> EV;
	Exam EX(4);
	Quiz Q(5);
	Assignment A(10);

	EV.push_back(EX);
	EV.push_back(Q);
	EV.push_back(A);

	int id = 1004;

	int count = 0;
	for (int i = 0; i < EV.size(); i++)
	{
		EV[i].isCLOTested(id, count);
	}
	if (count >= 2)
		cout << "The given CLO has been Tested" << endl;
	else cout << "The given CLO has not been Tested" << endl;




	//Logic for remaining Queries
	
	/*char opt;
	cout << "Press 1 for - Check whether a CLO has been tested or not" << endl;
	cout << "Press 2 for - Check whether all CLOs of a given course has been tested or not" << endl;
	cout << "Press 3 for - For a given PLO, generate a list of all the relevant courses" << endl;
	cin >> opt;

	if (opt == '1')
	{
		int count = 0;
		int cloid;
		cout << "Enter the CLO id to be checked:"; cin >> cloid;
		for (int i = 0; i < Evaluation.size(); i++)
		{
			for (int j = 0; j < Evaluation[i].CLOids.size(); j++)
			{
				if (Evaluation[i].CLOids[j] == cloid)
				{
					count++;
				}
			}
		}
		if (count >= 2)
			cout << "The given CLO has been Tested" << endl;
		else cout << "The given CLO has not been Tested" << endl;

	}
	else if (opt == '2')
	{
		string t;
		bool check = true;
		vector<int>clos;
		bool found = false;
		cout << "Enter the Course Title you want to check: "; cin >> t;
		for (int i = 0; i < Courses.size(); i++)
		{
			if (Courses[i].getcoursetitle() == t) //Course with title 't' has been found.
			{
				found = true;
				for (int j = 0; j < Courses[i].clos.size(); j++)
				{
					clos.push_back(Courses[i].clos[j].getCLOid());
				}
			}
		}
		if (found == false)
			cout << "The entered course does not exist" << endl;
		else
		{
			for (int i = 0; i < clos.size(); i++)
			{
				int count = 0;
				for (int j = 0; j < Evaluation.size(); j++)
				{
					for (int k = 0; k < Evaluation[j].CLOids.size(); k++)
					{
						if (Evaluation[j].CLOids[k] == clos[i])
						{
							count++;
						}
					}
				}
				if (count < 2)
				{
					cout << "All CLOs are not satisfied" << endl;
					break;
				}
			}
			cout << "All CLOs are satisfied" << endl;
		}
	}
	else if (opt == '3')
	{
		int ploid;
		cout << "Enter the PLO id you want to generate list against:"; cin >> ploid;
		for (int i = 0; i < Programs.size(); i++)
		{
			for (int j = 0; j < Programs[i].plos.size(); j++)
			{
				if (Programs[i].plos[j].id == ploid)
				{
					Programs[i].listAllCourses();
				}
			}
		}
	}
	*/
	return 0;
}