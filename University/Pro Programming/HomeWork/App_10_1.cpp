#include <iostream>
#include <cmath>
using namespace std;

class Point
{
public:
    int x, y, z;
    void neg();
    double norm();
    void print();

private:
    int neg_x, neg_y, neg_z;
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
        cin >> dot[i].x >> dot[i].y >> dot[i].z;
    }
    //!Esfandiar-Kiani
    for (size_t i = 0; i < n; i++)
    {
        dot[i].neg();
        dot[i].print();
    }

    return 0;
}

void Point::neg()
{
    neg_x = (-1 * x);
    neg_y = (-1 * y);
    neg_z = (-1 * z);
}

double Point::norm()
{
    return (sqrt(pow(neg_x, 2) + pow(neg_y, 2) + pow(neg_z, 2)));
}

void Point::print()
{
    cout << "(" << neg_x << "," << neg_y << "," << neg_z << ") " << norm() << endl;
}