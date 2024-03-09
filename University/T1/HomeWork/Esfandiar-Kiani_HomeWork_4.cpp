#include <iostream>

using namespace std;

int main()
{
    float userNumber = 0;

    cout << endl
         << "Welcome\n Enter Your Number: ";
    cin >> userNumber;

    // Esfandiar-Kiani

    if (userNumber > 0)
    {
        cout << endl
             << "Your Number Is Positive (+)" << endl;
    }
    else if (userNumber < 0)
    {
        cout << endl
             << "Your Number Is Negative (-)" << endl;
    }
    else
    {
        cout << endl
             << "You Entered 0" << endl;
    };

    // Esfandiar-Kiani

    return 0;
}