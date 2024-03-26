#include <iostream>

using namespace std;

int main()
{
    unsigned int r, c, n;
    cout << endl
         << "Enter Numbers: ";
    cin >> n >> r >> c;

    int ***myArr_3D = new int **[n];

    for (size_t k = 0; k < n; k++)
    {
        myArr_3D[k] = new int *[r];
        for (size_t i = 0; i < r; i++)
        {
            myArr_3D[k][i] = new int[c];
        }
    }

    cout << endl;

    for (size_t k = 0; k < n; k++)
    {
        for (size_t i = 0; i < r; i++)
        {
            for (size_t j = 0; j < c; j++)
            {
                myArr_3D[k][i][j] = (i + 1) * (j + 1);
                cout << myArr_3D[k][i][j] << "\t";
            }
            cout << endl;
        }
        cout << endl
             << endl
             << endl;
    }

    for (size_t k = 0; k < n; k++)
    {
        for (size_t i = 0; i < r; i++)
        {
            delete[] myArr_3D[k][i];
        }
        delete[] myArr_3D[k];
    }
    delete[] myArr_3D;

    return 0;
}