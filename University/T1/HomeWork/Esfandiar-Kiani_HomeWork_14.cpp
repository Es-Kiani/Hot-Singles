#include <iostream>

using namespace std;

int main()
{
    int x;
    cout << endl
         << "Welcome\n Enter The Max Number: ";
    cin >> x;
    // Esfandiar-Kiani
    for (size_t i = 1; i <= x; i++)
    {
        for (size_t j = 1; j <= i; j++)
        {
            cout << j;
        }
        cout << endl;
    }
    return 0;
}