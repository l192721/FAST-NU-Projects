#include<iostream>
#include<vector>
#include<list>
#include<algorithm>
#include<string>
#include<fstream>
#include<Windows.h>

using namespace std;


struct Info
{
	int id;
	char operation;
	friend ostream &operator<<(ostream& os, const Info &I)//Overload Operator to Output Heap Item.
	{
		return os << "Id : " << I.id << endl
			<< "Operation : " << I.operation << endl;
	}
};

template <typename k>
struct HeapItem
{
	k priority;
	Info Information;
	friend ostream &operator<<(ostream& os, const HeapItem &H)//Overload Operator to Output Heap Item.
	{
		return os << "Priority : " << H.priority << endl
			<< "Information :- " << endl
			<< H.Information << endl;
	}
	void operator = (const HeapItem &H) //Assignment operator Overload
	{
		priority = H.priority;
		Information = H.Information;
	}
};

template <typename k>
class MaxHeap
{
private:
	vector <k> vec;
	int heapsize;
public:
	MaxHeap()
	{
		HeapItem<int>temp;
		temp.priority = NULL;
		vec.push_back(temp);//Placing Null at zero index
		heapsize = 0;
	}
	void BuildQueue(k arr[], int size)
	{
		for (int i = 0; i < size; i++)
			Insert(arr[i]);
	}

	k ExtractMax()
	{
		k max = vec[1];
		vec[1] = vec[heapsize];
		heapsize--;
		vec.pop_back();
		Heapify(1);
		return max;
	}
	int FindMax()
	{
		if (!isEmpty())
			return vec[1].priority;
		else return 0;
	}
	k FindMaxHeapItem()
	{
		return vec[1];
	}
	int FindMin()
	{
		if (!isEmpty())
		{
			k min = vec[1];
			for (int i = 1; i <= heapsize; i++)
			{
				if (min.priority < vec[i].priority)
				{
					min = vec[i];
				}
			}
			return min.priority;
		}
		else return 0;
	}
	void Insert(HeapItem <int> &H)
	{
		heapsize++;
		vec.push_back(H);
		int i = heapsize;
		while (i > 1 && vec[i].priority > vec[i / 2].priority)//Conditions to maintain Priority
		{
			swap(vec[i], vec[i / 2]);
			i = i / 2;
		}
	}
	int size()
	{
		return heapsize;
	}
	bool isEmpty()
	{
		if (heapsize == 0)
			return true;
		else return false;
	}

	void Heapify(int i)
	{
		int largest = i;
		if (2 * i <= heapsize && vec[largest].priority < vec[2 * i].priority)
			largest = 2 * i;

		if (2 * i + 1 <= heapsize && vec[largest].priority < vec[2 * i + 1].priority)
			largest = 2 * i + 1;

		if (largest != i)
		{
			swap(vec[i], vec[largest]);
			Heapify(largest);
		}
	}


	void print()
	{
		if (heapsize>0)
		{
			for (int i = 1; i <= heapsize; i++)
			{
				cout << "Priority : " << vec[i].priority << endl;
				cout << "Information :-\n" << vec[i].Information << endl << endl;
			}
		}
	}

	~MaxHeap(){}
};

template<typename K>
class File
{
public:
	K FileID;
	MaxHeap <HeapItem<int>> WaitingQueue;                     //Wating Queue at each File (Node)
	list <int> ActiveUsers;                                   //LinkedList to keep track of Active users
	char ActiveUserOperation;                                 //Stores Operation of Active Users 
};

class HashTable
{
	list <File<int>> *arr;                                    //Array of LinkedLists
	int BUCKET;                                               //Size of Table to perform hashfunction
public:
	HashTable(int cap)
	{
		BUCKET = cap;
		arr = new list <File<int>>[BUCKET];
	}
	HashTable()
	{
		BUCKET = 10;
		arr = new list <File<int>>[BUCKET];
	}
	void insertFile(File<int> file)
	{
		int index = hashFunction(file.FileID);
		list<File<int>>::iterator it;                              //Iterator to traverse within LinkedList
		for (it = arr[index].begin(); it != arr[index].end(); it++)
		{
			if (it->FileID == file.FileID)
			{
				cout << "File with ID : " << file.FileID << " already exist in HashTable.\n";
				return;
			}
		}
		arr[index].push_back(file);
		cout << "File with ID : " << file.FileID << " added successfully to Hash Table. \n";
	}
	void insertFile(File<int> file,HeapItem<int> Item)
	{
		int index = hashFunction(file.FileID);
		list<File<int>>::iterator it;                              //Iterator to traverse within LinkedList
		for (it = arr[index].begin(); it != arr[index].end(); it++)
		{
			if (it->FileID == file.FileID)
			{
				if (it->ActiveUsers.empty())
				{
					it->ActiveUsers.push_back(Item.priority);
					it->ActiveUserOperation = Item.Information.operation;
				}
				else
				{
					it->WaitingQueue.Insert(Item);
				}
				cout << "File Record updated Successfully.\n";
				return;
			}
		}
		file.ActiveUsers.push_back(Item.Information.id);
		file.ActiveUserOperation = Item.Information.operation;
		arr[index].push_back(file);
		cout << "File with ID : " << file.FileID << " added successfully to Hash Table. \n";
	}
	int hashFunction(int x)
	{
		return (x % BUCKET);
	}
	void RequestFileAccess()
	{
		int file, user, priority;
		cout << "Enter File ID : "; cin >> file;
		int index = hashFunction(file);
		list<File<int>>::iterator it;                              //Iterator to traverse within LinkedList
		for (it = arr[index].begin(); it != arr[index].end(); it++)
		{
			if (it->FileID == file)
			{
				cout << "Enter User ID : "; cin >> user;
				char opt;
				cout << "Press H if priority is Highest,\nPress L if priority is Lowest,\nPress R if you want to input the priority : ";
				cin >> opt;
				if (opt == 'H' || opt == 'h')
				{
					priority = it->WaitingQueue.FindMax() + 1;
				}
				else if (opt == 'L' || opt == 'l')
				{
					priority = it->WaitingQueue.FindMin() - 1;
				}
				else
				{
					cout << "Enter Priority : ";
					cin >> priority;
				}
				char opr;
				cout << "Press W for Write,\nPress R for Read,\n";
				cout << "Enter Operation : "; cin >> opr;
				HeapItem<int> H;
				H.priority = priority;
				H.Information.id = user;
				H.Information.operation = opr;
				if (it->WaitingQueue.isEmpty() == true && it->ActiveUsers.empty() == true)
				{
					cout << "Access Granted to User with ID : " << H.Information.id << endl;//Give access if there is no item in waiting list
					it->ActiveUsers.push_back(H.Information.id);
					it->ActiveUserOperation = H.Information.operation;
				}
				else
				{
					cout << "User with ID : " << H.Information.id << " is added to the waiting Queue of File with ID : " << file << endl;
					it->WaitingQueue.Insert(H);                 //Add Item to the Heap if it is not empty
				}
				return;
			}
		}
		cout << "Error !!! File with File ID : " << file << " does not exist.\n";
	}


	void ReleaseFile()
	{
		int file;
		int user;
		int check = false;                                             //To check if user is found or not
		cout << "Enter File ID : "; cin >> file;
		int index = hashFunction(file);
		list<File<int>>::iterator it;                                  //Iterator to traverse within LinkedList
		for (it = arr[index].begin(); it != arr[index].end(); it++)
		{
			if (it->FileID == file)
			{
				cout << "Enter the User ID who no longer needs to access the file : "; cin >> user;
				if (it->ActiveUsers.empty() == false)
				{
					list<int>::iterator i;                                  //Iterator to traverse within LinkedList of Active Users
					for (i = it->ActiveUsers.begin(); i != it->ActiveUsers.end(); i++)
					{
						if (*i == user)
						{
							check = true;
							cout << "File Released from User ID : " << *i;
							it->ActiveUsers.erase(i);
							break;                                          //Break the loop if User is deleted
						}
					}
					if (!check)
						cout << "User with ID : " << user << " not found.";
					cout << endl;
				}
				if (it->WaitingQueue.isEmpty() == false)
				{
					if (it->WaitingQueue.FindMaxHeapItem().Information.operation == 'w' || //Check if Max Priority Person wants to write.
						it->WaitingQueue.FindMaxHeapItem().Information.operation == 'W')
					{
						cout << "User with ID : " << it->WaitingQueue.FindMaxHeapItem().Information.id << " removed from the Priority Queue" <<
							" & is Granted Access of File : " << file << endl;
						it->ActiveUsers.push_back(it->WaitingQueue.FindMaxHeapItem().Information.id);  //Add Active users to ActiveUsers LinkedList to keep their track
						it->ActiveUserOperation = it->WaitingQueue.FindMaxHeapItem().Information.operation; //Store Operation of Active Users
						it->WaitingQueue.ExtractMax();             //Remove Item from Queue
						return;
					}
					else if (it->WaitingQueue.FindMaxHeapItem().Information.operation == 'R' ||
						it->WaitingQueue.FindMaxHeapItem().Information.operation == 'r')
					{
						while (it->WaitingQueue.FindMaxHeapItem().Information.operation == 'R' ||
							it->WaitingQueue.FindMaxHeapItem().Information.operation == 'r')
						{
							if (it->WaitingQueue.isEmpty() == true) //Terminate the Loop if The priority queue has become empty
								return;

							cout << "User with ID : " << it->WaitingQueue.FindMaxHeapItem().Information.id << " removed from the Priority Queue" <<
								" & is Granted Access of File : " << file << endl;
							it->ActiveUsers.push_back(it->WaitingQueue.FindMaxHeapItem().Information.id);  //Add Active users to ActiveUsers LinkedList to keep their track
							it->ActiveUserOperation = it->WaitingQueue.FindMaxHeapItem().Information.operation;
							it->WaitingQueue.ExtractMax();          //Remove Item from Queue

							if (it->WaitingQueue.isEmpty() == true) //Terminate the Loop if The priority queue has become empty
								return;
						}
					}
				}
				return;
			}
		}
		cout << "Error !!! File with File ID : " << file << " does not exist.\n";
	}

	/*bool SearchFile(int id) //Self Made Helper function to find a file in LL
	{
	int index = hashFunction(id);
	list<File<int>>::iterator it;
	for (it = arr[index].begin(); it != arr[index].end(); it++)
	{
	if (it->FileID == id)
	return true;
	}
	return false;
	}*/


	void deleteFile(File<int> file)
	{
		int index = hashFunction(file.FileID);
		list<File<int>>::iterator it;
		for (it = arr[index].begin(); it != arr[index].end(); it++)
		{
			if (it->FileID == file.FileID)
			{
				if (it->WaitingQueue.isEmpty() == true && it->ActiveUsers.empty() == true)
				{
					cout << "File with ID : " << it->FileID << " removed successfully.\n";
					arr[index].erase(it);
					return;
				}
				else
				{
					cout << "File with ID : " << it->FileID << " cannot be deleted as it's Waiting Queue is not Empty or it still have some Active Users.\n";
					return;
				}
			}
		}
		cout << "File with ID : " << file.FileID << " not found.\n";
	}

	void PrintHash()
	{
		list<File<int>>::iterator it;
		for (int i = 0; i < BUCKET; i++)
		{
			HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE); //Colours to make ouput more readable
			SetConsoleTextAttribute(h, 11);
			cout << "H" << i << " --->\n";
			SetConsoleTextAttribute(h, 7);
			for (it = arr[i].begin(); it != arr[i].end(); it++)
			{
				cout << "File : " << it->FileID << "....Access granted to ";
				if (it->ActiveUsers.empty() == false)                       //Print Active Users Only if ActiveUser LL is non empty
				{
					list<int>::iterator i;                                  //Iterator to traverse within LinkedList of Active Users
					for (i = it->ActiveUsers.begin(); i != it->ActiveUsers.end(); i++)
					{
						cout << "User " << *i;
						if (it->ActiveUsers.empty() == false)
						{
							cout << ", ";
						}
						else break;                                          //Terminate if all Active Users are Printed
					}
					if (it->ActiveUserOperation == 'w' || it->ActiveUserOperation == 'W')
						cout << "Write";
					else if (it->ActiveUserOperation == 'r' || it->ActiveUserOperation == 'R')
						cout << "Read";
				}
				else cout << "none";
				cout << endl;  //Printed File info & Active Users till here

				if (it->WaitingQueue.isEmpty() == false)
				{
					cout << "Next User " << it->WaitingQueue.FindMaxHeapItem().Information.id << ", ";
					if (it->WaitingQueue.FindMaxHeapItem().Information.operation == 'w' || it->WaitingQueue.FindMaxHeapItem().Information.operation == 'W')
						cout << "Write";
					else if (it->WaitingQueue.FindMaxHeapItem().Information.operation == 'r' || it->WaitingQueue.FindMaxHeapItem().Information.operation == 'R')
						cout << "Read";
				}
				else cout << "Next None";
				cout << endl;  //Printed Next User till here
				if (it->WaitingQueue.size() - 1 > 0)
				{
					cout << "Waiting " << it->WaitingQueue.size() - 1 << " Users.\n";
				}
				else cout << "Waiting None\n";
			}
		}
	}

	void Load(string file)
	{
		ifstream fin;
		fin.open(file);
		if (!fin.is_open())
		{
			cout << "File to Load not found.\n";
			return;
		}
		int f, u, p;      //file,user,priority
		char a;           //access
		while (!fin.eof())
		{
			if (fin.peek() == ',')
				fin.ignore();
			fin >> f;
			if (fin.peek() == ',')
				fin.ignore();
			fin >> u;
			if (fin.peek() == ',')
				fin.ignore();
			fin >> p;
			if (fin.peek() == ',')
				fin.ignore();
			fin >> a;
			if (fin.peek() == ',')
				fin.ignore();
			HeapItem<int>item;
			item.Information.id = u;
			item.Information.operation = a;
			item.priority = p;

			File<int>obj;
			obj.FileID = f;
			insertFile(obj, item);
		}
	}

	~HashTable()
	{
		delete[] arr;
		arr = nullptr;
	}
};

void logo()
{
	cout << "               **************************************************************************************\n";
	cout << "               *                                                                                    *\n";
	cout << "               *                                                                                    *\n";
	cout << "               *                                                                                    *\n";
	cout << "               *                                                                                    *\n";
	cout << "               *                             ZROX ONLINE FILE REPOSITORY                            *\n";
	cout << "               *                                                                                    *\n";
	cout << "               *                                                                                    *\n";
	cout << "               *                                                                                    *\n";
	cout << "               *                                                                                    *\n";
	cout << "               **************************************************************************************\n";
}

void menu(int &opt)
{
	cout << "Press 1->Print Hash Table\n";
	cout << "Press 2->Load Data\n";
	cout << "Press 3->Insert a File\n";
	cout << "Press 4->Delete a File\n";
	cout << "Press 5->Request Access to a File\n";
	cout << "Press 6->Release a File\n";
	cout << "Press 0->Exit\n";
	cin >> opt;
}
int main()
{
	logo();
	HashTable Table(10);
	int opt;
x:  menu(opt);
	if (opt == 1)
	{
		Table.PrintHash();
		goto x;
	}
	if (opt == 2)
	{
		Table.Load("file.txt");
		goto x;
	}
	if (opt == 3)
	{
		File<int>F;
		cout << "Enter ID of file : "; cin >> F.FileID;
		Table.insertFile(F);
		goto x;
	}
	if (opt == 4)
	{
		File<int>F;
		cout << "Enter ID of file : "; cin >> F.FileID;
		Table.deleteFile(F);
		goto x;
	}
	if (opt == 5)
	{
		Table.RequestFileAccess();
		goto x;
	}
	if (opt == 6)
	{
		Table.ReleaseFile();
		goto x;
	}
	system("pause");
	return 0;
}