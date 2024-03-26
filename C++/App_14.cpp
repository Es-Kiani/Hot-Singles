#include <iostream>

using namespace std;

#define pi = 3.14
typedef unsigned int ui;

int main()
{
    ui Number;
    float testArray[4];
    const double r = 2.13;
    auto L = 'S';

    for (register size_t i = 0; i < 5; i++)
    {
        cout << boolalpha;
        cin >> testArray[i];
    };

    cout << testArray;

    return 0;
}