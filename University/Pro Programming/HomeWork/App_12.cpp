#include <iostream>
using namespace std;

#define matrixSize 3

class Matrix
{
private:
    int _matrix[matrixSize][matrixSize];
    bool _isPrintedAnything;

public:
    Matrix() { this->_isPrintedAnything = false; }
    void set_Value();
    void print_Zero_Rows();
    void print_One_Rows();
    void print_Zero_Column();
    void print_One_Column();
    bool isPrint();
};

int main()
{
    Matrix matrix;
    matrix.set_Value();

    //!Esfandiar-Kiani

    matrix.print_Zero_Rows();
    matrix.print_One_Rows();
    matrix.print_Zero_Column();
    matrix.print_One_Column();

    if (!matrix.isPrint())
    {
        cout << "none";
        return 0;
    }

    return 0;
}

void Matrix::set_Value()
{
    for (size_t i = 0; i < matrixSize; i++)
    {
        for (size_t j = 0; j < matrixSize; j++)
        {
            cin >> _matrix[i][j];
        }
    }
}

void Matrix::print_Zero_Rows()
{
    bool isRowZero = true;
    for (size_t i = 0; i < matrixSize; i++)
    {
        for (size_t j = 0; j < matrixSize; j++)
        {
            if (_matrix[i][j] != 0)
                isRowZero = false;
        }
        if (isRowZero)
        {
            cout << "row " << i + 1 << " is zero\n";
            _isPrintedAnything = true;
        }
        isRowZero = true;
    }
}

void Matrix::print_One_Rows()
{
    bool isRowOne = true;
    for (size_t i = 0; i < matrixSize; i++)
    {
        for (size_t j = 0; j < matrixSize; j++)
        {
            if (_matrix[i][j] != 1)
                isRowOne = false;
        }
        if (isRowOne)
        {
            cout << "row " << i + 1 << " is one\n";
            _isPrintedAnything = true;
        }
        isRowOne = true;
    }
}

void Matrix::print_Zero_Column()
{
    bool isColumnZero = true;
    for (size_t i = 0; i < matrixSize; i++)
    {
        for (size_t j = 0; j < matrixSize; j++)
        {
            if (_matrix[j][i] != 0)
                isColumnZero = false;
        }
        if (isColumnZero)
        {
            cout << "column " << i + 1 << " is zero\n";
            _isPrintedAnything = true;
        }
        isColumnZero = true;
    }
}

void Matrix::print_One_Column()
{
    bool isColumnOne = true;
    for (size_t i = 0; i < matrixSize; i++)
    {
        for (size_t j = 0; j < matrixSize; j++)
        {
            if (_matrix[j][i] != 1)
                isColumnOne = false;
        }
        if (isColumnOne)
        {
            cout << "column " << i + 1 << " is one\n";
            _isPrintedAnything = true;
        }
        isColumnOne = true;
    }
}

bool Matrix::isPrint()
{
    return _isPrintedAnything;
}
