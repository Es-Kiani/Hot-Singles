#include <iostream>
using namespace std;

int Fac();
int main()
{
    int res;

    res = Fac();
    cout << res;

    return 0;
}
int Fac()
{
    int n, fn = 1;
    cin >> n;
    for (size_t i = 1; i <= n; i++)
    {
        fn *= i;
    }
    return fn;
}