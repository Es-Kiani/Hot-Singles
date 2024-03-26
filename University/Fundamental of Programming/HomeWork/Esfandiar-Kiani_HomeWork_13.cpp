#include <iostream>

using namespace std;

int main()
{
    int myArr[5];

    cout << endl
         << "Welcome\n Please Give Me 5 Numbers" << endl
         << endl;

    for (size_t i = 0; i < 5; i++)
    {
        cout
            << "Number " << i + 1 << ": ";
        cin >> myArr[i];
    }
    cout << endl;

    // Esfandiar - Kiani

    cout << "Your Numbers List Inverse: {";
    for (short i = 4; i >= 0; i--)
    {
        cout << myArr[i];

        if (i == 0)
        {
            continue;
        };

        cout << " - ";
    }
    cout << "}" << endl;

    return 0;
}