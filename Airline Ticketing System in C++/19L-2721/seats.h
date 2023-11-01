#pragma once
#include<iostream>
#include<string>
using namespace std;
class seats
{
protected://Point 1
	bool **seat;//Point 13
public://Point 1
	seats();
	seats(seats &X);
	seats(int x, int y);//Point 2
	virtual ~seats();
	virtual void input(int a, int b)=0;//Point 3 and 5
	virtual void input(string x,string s,string d, int a, int b)=0;
	virtual void display();
};