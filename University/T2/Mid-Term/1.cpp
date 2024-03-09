#include <iostream>
using namespace std;

double average(double *, int);
double total_Sum(double *, int);
int main()
{
    int n;
    cout << "Please Enter the number of monthly sales to be inopte: ";
    cin >> n;

    double *sales = new double[n];

    for (size_t i = 0; i < n; i++)
    {
        cout << "please input sale for month " << i + 1 << " : ";
        cin >> sales[i];
    }

    cout << endl
         << "the monthly average is: "
         << average(sales, n);
    cout << endl
         << "the total sum is: "
         << total_Sum(sales, n);

    delete[] sales;
    return 0;
}

double average(double *_sales_ptr, int _n)
{
    double total_Av = 0;
    for (size_t i = 0; i < _n; i++)
    {
        total_Av += (_sales_ptr[i]);
    }
    total_Av /= _n;
    return total_Av;
}
double total_Sum(double *_sales, int _n)
{
    double total_S = 0;
    for (size_t i = 0; i < _n; i++)
    {
        total_S += _sales[i];
    }
    return total_S;
}