#include <iostream>

using namespace std;

int compute(int x, int y, char o)
{
    if (o == '+')
    {
        return x + y;
    }
    else if (o == '-')
    {
        return x - y;
    }
    else if (o == '*')
    {
        return x * y;
    }
    else if (o == '/')
    {
        return x / y;
    }
    else
    {
        cout << "Error";
    };
}

int main()
{
    cout << compute(13, 7, '+');

    return 0;
}