Mini-Flight Management System

Introduction :-
The project manages Domestic Flights, it has aircrafts with 15 seats, i.e can book a desired 
seat(if available),can change the source & destination,it can also change the name of the 
aircraft.

1. Correct use of all access specifiers:-
All the access specifiers are used in a correct way, in the seats class, the 2d-bool array seat 
is kept protected, therefore it can not be used in any class which have inherited the child of seats, 
i.e aircraft as its parent.The variables in aircraft are kept protected & all the functions are kept 
public. Wheras, the variables of DomesticFlight Class are kept private.

2. Over-loading using either methods or constructors:-
Overloaded Constructors are constructed in all Classes.

3. Abstract classes with a method that is required in all derived classes:-
void input(string x,string s,string d, int a, int b) function is required in all classes.

4. Operations on pointers to an object:-
The first operations with tag 'Points 4 & 5' in main.cpp .

5. Over-riding of a method of an abstract class:-
The virtual void input(string x,string s,string d, int a, int b) function in seats class is over-ridden.

6. An example of multi level inheritance:-
The DomesticFlight Class has inherited the aircraft class, and the aircraft class has inherited 
the seats class.

7. Separate compilation with all classes in your assignment:-
All classes are made in a .cpp & .h file.

8. An example of an object passing itself to a function which modifies that object:-
modify_class(A) in main.cpp performs this job.

9. A class with a modified copy constructor :-
In DomesticFlight class, the constructor DomesticFlight(DomesticFlight &A), is modified. The impact
can be seen in main.cpp in lines with tag 'Point 9', where any changes made in one object do
not appear in the copied object.

10. A working destructor with some basic functionality on one of your classes:-
Working of destructor demonstrated in main.cpp in lines with tag 'Points No.10'

11. Correct use of three over-loaded operators (e.g., +, = and ==) :-
Working demonstrated in main.cpp in lines with tag 'Points No.11'

12. Correct use of new and delete for the allocation of an object/objects, with operations on the object using pointers:-
Working demonstrated in main.cpp in lines with tag 'Points No.12'

13. Using 2D Dynamic Array(correct allocation and deallocation with constructor and destructor):-
Working demonstrated in seats class, 2D-bool array is used.

14. Static states of a class and an example usage. Demonstrate the impact:-
In DomesticFlight Class, the int static num_of_flight variable fulfills this job. When used with the
function show_total_flights, it prints the total number of flights booked So far.

15. Demonstrates the difference between a C++ class and a C++ struct:-
Difference is quite evident as we can not access the private,protected members of the classes directly, which 
improves the security of data & restricts its direct access.

16. Passing an object to a method by constant reference. Demonstrate the impact:-
The function in main.cpp, void function_point_16(const aircraft &A), object will be passed to the 
function but we will not be able to change it inside the function as it has been passed as a
constant reference.
