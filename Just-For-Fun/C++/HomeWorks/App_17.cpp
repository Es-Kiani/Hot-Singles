#include <iostream>
#include <string>
using namespace std;

typedef unsigned int ui;
typedef unsigned long long int uli;

struct Person
{
    string fName;
    string lName;
    ui age;
    uli SN;
    bool isMarride;
    void showInfo()
    {
        cout << endl
             << endl
             << "Name: " << fName + " " + lName << endl
             << "Social Security Number: " << SN << endl
             << "Age: " << age << endl;

        if (isMarride == true)
            cout << "Marride" << endl;
        else
            cout << "Single" << endl;
    };
};

int main()
{
    Person P1;
    cout << "Welcome\n Please Enter Your information To Create Your Profile" << endl;
    cout << "First Name: ";
    cin >> P1.fName;
    cout << "Last Name: ";
    cin >> P1.lName;
    cout << "Age: ";
    cin >> P1.age;
    cout << "Social Number (Social ID): ";
    cin >> P1.SN;
    cout << "Are You Marride? (True/False): ";
    cin >> P1.isMarride;

    P1.showInfo();

    return 0;
}