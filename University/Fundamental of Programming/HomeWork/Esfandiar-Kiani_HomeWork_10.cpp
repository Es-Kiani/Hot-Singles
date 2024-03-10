#include <iostream>

using namespace std;

int main()
{
    int a = 1, b, u_Num, n = 0;

    cout << endl
         << "Welcome\n  Say Your Number and it's Range as [a,b] "
         << endl;

    cout << " Number= ";
    cin >> u_Num;

    cout << " a= ";
    cin >> a;

    cout << " b= ";
    cin >> b;

    // Esfandiar-Kiani

    // Division by Zero Err
    if (a == 0)
    {
        a = 1;
    }

    for (int i = a; i <= b; i++)
    {
        if (u_Num % i == 0)
        {
            cout << endl
                 << i;
            n++;
        }
    }

    // Esfandiar-Kiani

    if (n != 0)
    {
        cout << endl
             << "n: " << n << endl;
    }
    else
    {
        cout << endl
             << "Nothing was found...!" << endl;
    }
    return 0;
}