#include <iostream>
using namespace std;
// ترکیب بازگشتی
int nCr(int, int);
int main()
{
    int k, n;

    cin >> k >> n;
    if (n == k)
    {
        cout << 1;
    }
    else
    {
        cout << nCr(n, k);
    }

    return 0;
}
int nCr(int _n, int _k)
{
    if (_k == 0 || _k == _n)
        return 1;
    else
        return nCr(_n - 1, _k) + nCr(_n - 1, _k - 1);
}
