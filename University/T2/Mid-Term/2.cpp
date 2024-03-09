#include <iostream>
using namespace std;

#define n 3

int **reverse(int);
int main()
{
    int matrix[n][n], **new_Matrix;

    for (size_t i = 0; i < n; i++)
    {
        for (size_t j = 0; j < n; j++)
            cin >> matrix[i][j];
    }
    cout << endl;

    //! Esfandiar-Kiani
    new_Matrix = reverse(matrix);
    //! Esfandiar-Kiani

    for (size_t i = 0; i < n; i++)
    {
        for (size_t j = 0; j < n; j++)
            cout << new_Matrix[i][j] << "\t";
        cout << endl;
    }

    for (size_t i = 0; i < n; i++)
        delete[] new_Matrix[i];
    delete[] new_Matrix;

    return 0;
}

int **reverse(int got_Matrix[n][n])
{
    int **reversed_Matrix = new int *[n];
    for (size_t i = 0; i < n; i++)
        reversed_Matrix[i] = new int[n];

    for (size_t i = 0; i < n; i++)
    {
        for (size_t j = 0; j < n; j++)
            reversed_Matrix[i][j] = got_Matrix[j][i];
    }
    
    //! Esfandiar-Kiani

    for (size_t i = 0; i < n; i++)  
    {
        int temp = reversed_Matrix[i][0];
        reversed_Matrix[i][0] = reversed_Matrix[i][2];
        reversed_Matrix[i][2] = temp;
    }

    return reversed_Matrix;
}