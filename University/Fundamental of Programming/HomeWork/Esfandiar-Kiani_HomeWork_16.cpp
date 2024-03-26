#include <iostream>
using namespace std;

#define m 3
int main()
{
    int Matrix[m][m], sum = 0;

    cout << endl
         << "Welcome\n Enter 3*3 Matrix Items:\n";

    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            cin >> Matrix[i][j];
        }
    }
    // Esfandiar-Kiani
    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            if (i > j)
            {
                sum += Matrix[i][j];
            }
        }
    }
    cout << endl
         << "Sum of Main Diameter: " << sum << endl;
    return 0;}