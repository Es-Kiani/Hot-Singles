#include <iostream>

using namespace std;

void input(int **, int, int);
void output(int **, int, int);
int **transpose(int **, int, int);

int main()
{
    int m, n;
    cin >> m >> n;

    int **Matrix = new int *[m];
    for (size_t i = 0; i < m; i++)
    {
        Matrix[i] = new int[n];
    }
    //! Esfandiar-Kiani
    input(Matrix, m, n);
    int **transposed = transpose(Matrix, m, n);
    output(transposed, m, n);

    for (size_t i = 0; i < m; i++)
    {
        delete[] Matrix[i];
    }
    delete[] Matrix;

    return 0;
}

void input(int **got_Matrix, int m, int n)
{
    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < n; j++)
        {
            cin >> got_Matrix[i][j];
        }
    }
}

void output(int **got_Matrix, int m, int n)
{
    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < n; j++)
        {
            cout << got_Matrix[i][j] << "\t";
        }
        cout << endl;
    }
}

int **transpose(int **got_Matrix, int m, int n)
{
    int **new_Matrix = new int *[m];
    for (size_t i = 0; i < m; i++)
    {
        new_Matrix[i] = new int[n];
    }

    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < n; j++)
        {
            new_Matrix[i][j] = got_Matrix[j][i];
        }
    }

    return new_Matrix;
}
