#include <iostream>
using namespace std;
#define m 5
int main()
{
    int myArr[m];

    cout << endl
         << "Hello\n";

    for (size_t i = 0; i < m; i++)
    {
        cout << "Enter Item" << i + 1 << ": ";
        cin >> myArr[i];
    }

    cout << endl;

    for (size_t i = 0; i < m; i++)
    {
        cout << "Item Number" << i + 1 << ": " << myArr[i] << endl;
    }

    return 0;
}