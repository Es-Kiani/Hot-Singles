#include <iostream>

using namespace std;

int main()
{
    int n;
    float X, sum = 0;

    cout << endl
         << "Welcome\n Choice Your X and n in \"1X-2X+3X-4X ... nX \" " 
         << endl;
    cout << " X= ";
    cin >> X;
    cout << " n= ";
    cin >> n;

    // Esfandiar-Kiani

    for (size_t i = 1; i <= n; i++)
    {
        if (i % 2 == 0)
        { sum -= i;
        } else
        { sum += i;
        }
    }

    cout << endl
         << endl
         << "Total Sum Is: " << sum << endl;

    return 0;
}