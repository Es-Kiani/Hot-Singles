#include <iostream>

using namespace std;

int main()
{
    int day_Number;

    cout << endl
         << "Welcome" << endl
         << " Enter Day Number: ";
    cin >> day_Number;

    switch (day_Number)
    {
    case 1:
        cout << "Saturday";
        break;
    case 2:
        cout << "Sunday";
        break;
    case 3:
        cout << "Monday";
        break;
    case 4:
        cout << "Thusday";
        break;
    case 5:
        cout << "Wensday";
        break;
    case 6:
        cout << "Thursday";
        break;
    case 7:
        cout << "Friday";
        break;
    default:
        cout << endl
             << "!Out Of Range!" << endl;
        break;
    }

    return 0;
}