#include <iostream>

using namespace std;

int Fac(int);
int main()
{
    int n, fn = 1, res;

    cin >> n;

    res = Fac(n);

    cout << res;

    return ;
}

int Fac(int n)
{
    int fn = 1;
    for (size_t i = 1; i <= n; i++)
    {
        fn *= i;
    }
    return fn;
}