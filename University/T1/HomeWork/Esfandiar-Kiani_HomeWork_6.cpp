#include <iostream>

using namespace std;

int main()
{
    float a, b, c, average;

    cout << endl
         << "Welcome To 3 Numbers Average Calculator" << endl
         << endl
         << "Enter Your Numbers Continuously\na b c : ";
    cin >> a >> b >> c;

    average = (a + b + c) / 2;

    // Esfandiar-Kiani

    cout << endl
         << "The Average of Numbers Is: " << average << endl;

    return 0;
}