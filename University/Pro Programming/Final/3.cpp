#include <iostream>

using namespace std;

class Person
{
protected:
    string _name;
    int _birthYear;

public:
    Person(string got_Name, int got_BirthYear)
    {
        _name = got_Name;
        _birthYear = got_BirthYear;
    }

    void print();
};

class Employee : public Person
{
private:
    string _inID;
    long long int _salary;

public:
    Employee(string got_Name = "", int got_BirthYear = 0, string got_inID = "Null", long long int got_Salary = 0)
        : Person(string got_Name, int got_BirthYear)
    {
        _inID = got_inID;
        _salary = got_Salary;
    }
    void show();
};

int main()
{

    return 0;
}

void Person::print()
{
    cout << "Person name is: " << _name << "\n BirthYear: " << _birthYear;
}

void Employee::show()
{
    cout << "Person name is: " << _name << "\n BirthYear: " << _birthYear << "\ninID: " << _inID << "\nSalary: " << _salary;
}
