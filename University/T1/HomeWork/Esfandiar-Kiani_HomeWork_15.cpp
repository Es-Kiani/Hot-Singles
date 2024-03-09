#include <iostream>

using namespace std;

int main()
{
    int Matrix[3][3], sum = 0;

    cout << endl
         << "Welcome\n Enter 3*3 Matrix Items:\n";

    for (size_t i = 0; i < 3; i++)
    {
        for (size_t j = 0; j < 3; j++)
        {
            cin >> Matrix[i][j];
        }
    }
    // Esfandiar-Kiani
    for (size_t i = 0; i < 3; i++)
    {
        for (size_t j = 0; j < 3; j++)
        {
            if (i == j)
            {
                sum += Matrix[i][j];
            }
        }
    }
    cout << endl
         << "Sum of Main Diameter: " << sum << endl;

    return 0;
}