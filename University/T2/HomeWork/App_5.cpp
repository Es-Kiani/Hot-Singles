#include <iostream>
using namespace std;
// ترکیب بدون بازگشتی
long int factorial(int);
int main()
{
    int k, n;
    cin >> k >> n;

    cout << factorial(n) / (factorial(k) * factorial((n - k)));

    return 0;
}
long int factorial(int _endNo)
{
    if (_endNo > 1)
    {
        return _endNo * factorial(_endNo - 1);
    }
    else
    {
        return 1;
    }
}