#include <iostream>
#include <sstream>
#include <ctime>
using namespace std;

class PersianDate
{
private:
    time_t _time;
    tm *_now;

    //! Esfandiar-Kiani

public:
    PersianDate()
    {
        _time = time(0);
        _now = localtime(&_time);
    }
    int year() { return _now->tm_year + 1279; }
    int month() { return _now->tm_mon + 1; }
    int day() { return _now->tm_mday; }
};

class Human
{
protected:
    string _firstName;
    string _lastName;
    int _birthYear;
    int _deadYear = 0;

public:
    Human(string got_firstName, string got_lastName, int got_BirthYear)
    {
        _firstName = got_firstName;
        _lastName = got_lastName;
        _birthYear = got_BirthYear;
    }

    //! Esfandiar-Kiani

    string Get_FirstName() { return _firstName; }
    void Set_FirstName(string got_FirstName)
    {
        _firstName = got_FirstName;
    }

    string Get_LastName() { return _lastName; }
    void Set_LastName(string got_LastName)
    {
        _lastName = got_LastName;
    }

    int Get_BirthYear() { return _birthYear; }
    void Set_BirthYear(int got_BirthYear)
    {
        _birthYear = got_BirthYear;
    }

    int Get_DeadYear() { return _deadYear; }
    void Set_DeadYear(int got_DeadYear = 0)
    {
        _deadYear = got_DeadYear;
    }
};

class Person : public Human
{
private:
    string _address;
    string _phoneNumber;

public:
    Person(string got_firstName = "", string got_lastName = "", int got_BirthYear = 0)
        : Human(got_firstName, got_lastName, got_BirthYear) {}

    //! Esfandiar-Kiani

    string Get_Address() { return _address; }
    void Set_Address(string got_Address)
    {
        _address = got_Address;
    }
    void Set_Address_cin()
    {
        string Address;
        cin >> Address;
        Set_Address(Address);
    }

    string Get_PhoneNumber() { return _phoneNumber; }
    void Set_PhoneNumber(string got_PhoneNumber)
    {
        _phoneNumber = got_PhoneNumber;
    }
    void Set_PhoneNumber_cin()
    {
        string phoneNumber;
        cin >> phoneNumber;
        Set_PhoneNumber(phoneNumber);
    }

    void Set_FirstName_cin()
    {
        string FirstName;
        cin >> FirstName;
        Set_FirstName(FirstName);
    }

    void Set_LastName_cin()
    {
        string lastName;
        cin >> lastName;
        Set_LastName(lastName);
    }

    void Set_BirthYear_cin()
    {
        int BirthYear;
        cin >> BirthYear;
        Set_BirthYear(BirthYear);
    }

    void Set_DeadYear_cin()
    {
        string str_DeadYear;
        int int_DeadYear;
        cin >> str_DeadYear;
        if (str_DeadYear != "-")
        {
            stringstream geek(str_DeadYear);
            geek >> int_DeadYear;
            Set_DeadYear(int_DeadYear);
        }
    }
    //! Esfandiar-Kiani
    void print_Info()
    {
        cout << Get_FirstName() << " " << Get_LastName() << " " << Get_BirthYear() << " " << Get_DeadYear() << " " << _address << " " << _phoneNumber;
    }

    bool isLiving()
    {
        return (Get_DeadYear() == 0 ? true : false);
    }

    int age()
    {
        if (!Get_DeadYear())
        {
            PersianDate now;
            return (now.year() - _birthYear);
        }
        return (_deadYear - _birthYear);
    }
};

int main()
{
    unsigned int N;
    cin >> N;

    Person *personArr = new Person[N]();
    for (size_t i = 0; i < N; i++)
    {
        personArr[i].Set_FirstName_cin();
        personArr[i].Set_LastName_cin();
        personArr[i].Set_BirthYear_cin();
        personArr[i].Set_DeadYear_cin();
        personArr[i].Set_Address_cin();
        personArr[i].Set_PhoneNumber_cin();
    }

    string target_LastName;
    //! Esfandiar-Kiani
    cin >> target_LastName;

    bool isFind = false;
    for (size_t i = 0; i < N; i++)
    {
        if (personArr[i].Get_LastName() == target_LastName)
        {
            if (personArr[i].isLiving())
                cout << personArr[i].age() << " alive ";
            else
                cout << personArr[i].age() << " dead ";
            isFind = true;
        }
    }
    if (!isFind)
    {
        cout << "not found";
    }

    delete[] personArr;

    return 0;
}
