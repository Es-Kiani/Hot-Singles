#include <iostream>
using namespace std;

class Triangle
{
private:
    double _base, _height, _area;

public:
    Triangle(double gotBase, double gotHeight) //* Constractor
    {
        _base = gotBase;
        _height = gotHeight;
    };
    // void input(double, double);
    void calculate();
    void print();
};

int main()
{
    Triangle objTriangle(13, 69);

    // objTriangle.input(13, 69);
    objTriangle.calculate();
    objTriangle.print();

    return 0;
}

// void Triangle::input(double gotBase, double gotHeight)
// {
//     base = gotBase;
//     height = gotHeight;
// }

void Triangle::calculate()
{
    _area = ((_base * _height) / 2);
}

void Triangle::print()
{
    cout << endl
         << "Area: " << _area << endl;
}