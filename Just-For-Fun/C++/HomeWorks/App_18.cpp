#include <iostream>
#include <string>
using namespace std;

int main()
{
    string fName = "Esfandiar";

    cin >> fName;

    cout << endl
         << fName.length() << endl
         << fName;
    fName.resize(10);

    cout << endl
         << fName.length() << endl
         << fName;
    fName.resize(8);

    cout << endl
         << fName.length() << endl
         << fName;

    return 0;
}