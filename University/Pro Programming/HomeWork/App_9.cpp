#include <iostream>
using namespace std;

class rectangular
{
public:
    int length, Hight;

    int P()
    {
        return (2 * (Hight + length));
    }

    int A()
    {
        return (Hight * length);
    }
};

int main()
{
    rectangular Rect_1;

    Rect_1.length = 10;
    Rect_1.Hight = 13;

    cout << Rect_1.A() << endl
         << Rect_1.P();

    return 0;
}