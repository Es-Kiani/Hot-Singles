#include <iostream>

using namespace std;

int main()
{
    int hour = 0, min = 0, sec = 0;

    cout << "Enter Hour: ";
    cin >> hour;

    cout << "Enter Minute: ";
    cin >> min;

    cout << "Enter Second: ";
    cin >> sec;

    cout << "Total Sec: " << sec + (min * 60) + (hour * 3600);

    return 0;
}