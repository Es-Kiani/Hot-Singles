#include <iostream>

using namespace std;

class count
{
private:
    static int _numBorn;
    static int _numLiving;

public:
    count()
    {
        _numBorn++;
        _numLiving++;
    }
    //! Esfandiar-Kiani
    ~count()
    {
        _numLiving--;
    }
    static int Get_NumBorn()
    {
        return _numBorn;
    }
    static int Get_NumLiving()
    {
        return _numLiving;
    }
};

int count::_numBorn = 0;
int count::_numLiving = 0;

int main()
{
    count obj1;
    count obj2;
    cout << count::Get_NumBorn();
    cout << count::Get_NumLiving();
    count obj3;
    {
        cout << count::Get_NumBorn();
        cout << count::Get_NumLiving();
        count obj3;
        cout << count::Get_NumBorn();
        cout << count::Get_NumLiving();
    }
    cout << count::Get_NumBorn();
    cout << count::Get_NumLiving();

    return 0;
}
