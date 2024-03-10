#include <iostream>
using namespace std;

class A
{
protected:
    int a;

public:
    a(int x = 1)
    {
        a = x;
    }
    void f()
    {
        a += 2;
    }
    void g()
    {
        a += 1;
    }
    int h()
    {
        f();
        return a;
    }
    int j()
    {
        g();
        return a;
    }
};

class B : public A
{
private:
    int b;

public:
    B(int y = 5)
    {
        b = y;
    }
    void f()
    {
        b += 10;
    }
    int j()
    {
        a += 3;
        return a;
    }
};

int main()
{
    A obj1;
    B obj2;

    cout << obj1.h() << endl;
    cout << obj1.j() << endl;
    cout << obj2.h() << endl;
    cout << obj2.j() << endl;
    cout << obj2.A::j() << endl;

    return 0;
}
