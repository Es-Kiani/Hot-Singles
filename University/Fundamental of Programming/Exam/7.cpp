#include <iostream>

using namespace std;

int main()
{
    int n;
    cout << "n: ";
    cin >> n;
    for (size_t i = 1; i <= n; i++)
    {
        for (size_t p = 0; p < i; p++)
        {
            cout << "*";
        }
        cout << endl;
    }

    return 0;
}