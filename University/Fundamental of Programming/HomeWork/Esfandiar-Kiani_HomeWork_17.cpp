#include <iostream>

using namespace std;

int main()
{
    const short m = 3;
    int ma_1[m][m], ma_2[m][m], sum[m][m];

    cout << endl
         << "Welcome\n Enter First 3*3 Matrix Items:\n";
    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            cin >> ma_1[i][j];
        }
    }

    cout << endl
         << "\n Enter Second 3*3 Matrix Items:\n";
    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            cin >> ma_2[i][j];
        }
    }
    // Esfandiar-Kiani
    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            sum[i][j] = ma_1[i][j] + ma_2[i][j];
        }
    }

    cout << endl
         << "Total Sum: " << endl;
    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {

            cout << sum[i][j] << "\t";
        }
        cout << endl;
    }
    return 0;
}