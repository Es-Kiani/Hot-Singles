#include <iostream>
using namespace std;
int f(int *n, int L)
{
    if (L == 1)
    {
        return n[L - 1];
    }
    else
    {
        int m = f(n, L - 1);
        return ((n[L - 1] < m) ? (n[L - 1]) : (m));
    }
}
int main()
{
    int a[1] = {10}, b[4] = {20, 100, 400, 16};
    cout << f(a, 1) << endl
         << f(b, 4) << endl;

    return 0;
}