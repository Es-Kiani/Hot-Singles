#include <iostream>

using namespace std;

class CellPhone
{
private:
    double _price;
    double _profit;

public:
    CellPhone(double got_Price = 1000, double got_Profit = 0)
    {
        _price = got_Price;
        _profit = got_Profit;
    }
    double Get_Price();
    double Get_Profit();
    void Set_Price(double);
    void Set_Profit(double);
    CellPhone operator+(CellPhone &second_Phone)
    {
        CellPhone obj1;

        obj1.Set_Price(this->_price + second_Phone.Get_Price());
        obj1.Set_Profit(this->_profit + second_Phone.Get_Profit());

        return obj1;
    }
};

int main()
{
    //! Esfandiar-Kiani
    CellPhone obj1;
    CellPhone obj2;
    CellPhone obj3;
    {
        CellPhone obj4;
    }

    return 0;
}

double CellPhone::Get_Price()
{
    return _price;
}
double CellPhone::Get_Profit()
{
    return _profit;
}
void CellPhone::Set_Price(double got_Price)
{
    _price = got_Price;
}
void CellPhone::Set_Profit(double got_Profit)
{
    _profit = got_Profit - _price;
}
// CellPhone operator+(CellPhone &second_Phone)
// {
//     CellPhone obj1;

//     obj1.Set_Price(_price + second_Phone.Get_Price());
//     obj1.Set_Profit(this->_profit + second_Phone.Get_Profit());

//     return obj1;
// }
