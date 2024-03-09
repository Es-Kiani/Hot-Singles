#include <iostream>

using namespace std;

int main()
{
    int n;
    cout << "Enter n:";
    cin >> n;
    for (size_t i = 0; i <= n; i++)
    {
        if (i == 0)
        {
            cout << "*" << endl;
            continue;
        }
        for (size_t j = 1; j <= i + 1; j++)
        {
            if (i % 3 == 0)
            {
                cout << "*";
            }
            else
            {
                cout << "-";
            }
        }
        cout << endl;
    }

    return 0;
}