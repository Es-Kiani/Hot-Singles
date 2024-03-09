#include <iostream>

using namespace std;

int main()
{
    long x;

    cout << endl
         << "Welcome To My App\n Say Your Number: ";
    cin >> x;

    if ((x % 2) == 0)
    {
        cout << endl
             << "=> "
             << x << " is Even" << endl;
    }
    else
    {
        cout << endl
             << "=> "
             << x << " is ODD" << endl;
    };

    return 0;
}