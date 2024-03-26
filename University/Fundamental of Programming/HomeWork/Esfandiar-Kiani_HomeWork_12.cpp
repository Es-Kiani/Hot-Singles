#include <iostream>

using namespace std;

int main()
{
    int n;
    cout << endl
         << "Welcome To Triangle-Tree Creator\n How Tall Do You Want Your Tree To Be!? ";
    cin >> n;
    cout << endl;

    // Esfandiar-Kiani

    for (size_t i = 1; i <= n; i++)
    {
        for (size_t c = i; c <= n; c++)
        {
            cout << " ";
        }

        for (size_t s = 2 * i - 1; s > 0; s--)
        {
            cout << "*";
        }
        cout << endl;
    }

    for (size_t i = n; i < n+3; i++)
    {
        for (size_t c = 1; c < n; c++)
        {
            cout << " ";
        }
        cout << "***";
        cout << endl;
    }

    // Esfandiar-Kiani

    cout << endl;

    return 0;
}