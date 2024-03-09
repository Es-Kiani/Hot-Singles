#include <iostream>
#include <math.h>

using namespace std;

long double factorial(int);
double f(int, int);
int main()
{
    int x, m;
    cin >> x >> m;

    cout << std::fixed;
    cout.precision(4);
    cout << f(x, m);
    return 0;
}

long double factorial(int _endNo)
{
    if ((_endNo == 0) || (_endNo == 1))
    {
        return 1;
    }
    else
    {
        return (_endNo * factorial(_endNo - 1));
    }
}

double f(int _x, int _m)
{
    double result = 0;

    if ((_m == 1))
    {
        return (1 - _x);
    }
    if (_m <= 0)
    {
        return 1;
    }
    else
    {
        for (size_t i = 2; i <= _m; i++)
        {
            if (i % 2 == 0)
            {
                result += (pow(i, 4) * (pow(_x, i) / factorial(i)));
            }
            else
            {
                result -= ((pow(i, 4) * (pow(_x, i) / factorial(i))));
            }
        }
        return (1 - _x + result);
    }
}