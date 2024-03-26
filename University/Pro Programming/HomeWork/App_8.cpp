#include <iostream>
using namespace std;

typedef long long int li;

void oneSide(bool *, li *, li);
int main()
{
    bool isOneSide = true;
    li n;

    cin >> n;
    li *X = new li[n];
    li *Y = new li[n];

    for (li i = 0; i < n; i++)
    {
        cin >> X[i] >> Y[i];
    }

    //!Esfandiar-Kiani
    delete[] Y;
    //!Esfandiar-Kiani

    if (n == 2)
        cout << "yes";
    else
    {
        oneSide(&isOneSide, X, n);
        if (isOneSide == true)
            cout << "yes";
        else
            cout << "no";
    }

    delete[] X;

    return 0;
}
void oneSide(bool *_isOneSide, li *_X, li _n)
{
    li positive = 0, minest = 0;
    for (li i = 0; i < _n; i++)
    {
        (_X[i] > 0 ? positive++ : minest++);
    }

    if (positive > 1 and minest > 1)
        *_isOneSide = false;
}