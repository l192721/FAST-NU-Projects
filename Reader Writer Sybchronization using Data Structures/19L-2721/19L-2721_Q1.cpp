#include<iostream>
#include<vector>
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
	k key;
	Info Information;
	friend ostream &operator<<(ostream& os, const HeapItem &H)//Overload Operator to Output Heap Item.
	{
		return os << "Key : " << H.key << endl
			<< "Information :- " << endl
			<< H.Information << endl;
	}
	void operator = (const HeapItem &H)
	{
		key = H.key;
		Information = H.Information;
	}
};

template <typename k>
class MaxHeap
{
private:
	vector <k> vec;
	int heapsize;
	HeapItem<int> min;
public:
	MaxHeap()
	{
		HeapItem<int>temp;
		temp.key = NULL;
		vec.push_back(temp);//Placing Null at zero index
		heapsize = 0;
		min.key = INT_MAX;
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
	k FindMax()
	{
		//if (!isEmpty())
		return vec[1];
	}
	k FindMin()
	{
		//if (!isEmpty())
		return min;
	}
	void Insert(HeapItem <int> &H)
	{
		heapsize++;
		vec.push_back(H);
		int i = heapsize;
		while (i > 1 && vec[i].key > vec[i / 2].key)
		{
			swap(vec[i], vec[i / 2]);
			i = i / 2;
		}
		if (min.key > H.key)
		{
			min = H;
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
		if (2 * i <= heapsize && vec[largest].key < vec[2 * i].key)
			largest = 2 * i;

		if (2 * i + 1 <= heapsize && vec[largest].key < vec[2 * i + 1].key)
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
				cout << "Key : " << vec[i].key << endl;
				cout << "Information :-\n" << vec[i].Information << endl << endl;
			}
		}
	}

	~MaxHeap(){}
};

int main()
{
	HeapItem < int> array[10];
	for (int i = 0; i < 10; i++)
	{
		array[i].key = i * 10;
		array[i].Information.id = i;
		array[i].Information.operation = 'W';
	}
	MaxHeap <HeapItem<int>> M;

	M.BuildQueue(array, 10);
	M.print();
	cout << "Size : " << M.size() << endl << endl;
	cout << "ExtractMax returned:-\n\n" << M.ExtractMax();
	cout << M.FindMax() << endl;
	cout << M.FindMin();


	system("pause");
	return 0;
}