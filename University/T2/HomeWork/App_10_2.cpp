#include <iostream>
#include <cmath>
using namespace std;

class Point
{
public:
    void setter();
    void neg();
    double norm();
    void print();

private:
    int _x, _y, _z;
    int _neg_x, _neg_y, _neg_z;
};

int main()
{
    unsigned short int n;
    cin >> n;

    cout << fixed;
    cout.precision(3);

    Point dot[n];

    for (size_t i = 0; i < n; i++)
    {
        dot[i].setter();
    }
    //!Esfandiar-Kiani
    for (size_t i = 0; i < n; i++)
    {
        dot[i].neg();
        dot[i].print();
    }

    return 0;
}

void Point::setter()
{
    cin >> _x >> _y >> _z;
}

void Point::neg()
{
    _neg_x = (-1 * _x);
    _neg_y = (-1 * _y);
    _neg_z = (-1 * _z);
}

double Point::norm()
{
    return (sqrt(pow(_neg_x, 2) + pow(_neg_y, 2) + pow(_neg_z, 2)));
}

void Point::print()
{
    cout << "(" << _neg_x << "," << _neg_y << "," << _neg_z << ") " << norm() << endl;
}
