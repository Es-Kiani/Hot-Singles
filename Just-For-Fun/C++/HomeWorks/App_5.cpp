#include <iostream>

using namespace std;

int main()
{
    int Counter = 0;
    while (Counter < 100)
    {
        cout << Counter << endl;
        Counter++;
        if (Counter == 85)
        {
            cout << Counter << endl
                 << endl
                 << "---------------" << endl
                 << "Counter Number Is: " << Counter << endl
                 << " Hi Sexy . . . !" << endl;
            break;
        };
    };

    return 0;
}
