#include <iostream>

using namespace std;

int main()
{
    cout << "Welcome" << endl;

    int x = 0;
    int y = 0;

    cin >> x;
    cin >> y;

    if ((x == 1) and (y == 2))
    {
        cout << "1 & 2";
    }
    else
    {
        cout << "Wrong";
    };

    return 0;
}
