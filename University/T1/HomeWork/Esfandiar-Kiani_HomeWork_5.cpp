#include <iostream>

using namespace std;

int main()
{
    float a, b;

    cout << endl
         << "Welcome\n\n Enter Your First Number: ";
    cin >> a;

    cout << " Enter Your Second Number: ";
    cin >> b;

    // Esfandiar-Kiani

    if (a > b)
    {
        cout << endl
             << "[1]\tThe First Number Is larger" << endl;
    }
    else if (b > a)
    {
        cout << endl
             << "[-1]\tThe Second Number Is larger" << endl;
    }
    else
    {
        cout << endl
             << "[0]\tNumbers Is Equal" << endl;
    };

    // Esfandiar-Kiani

    return 0;
}