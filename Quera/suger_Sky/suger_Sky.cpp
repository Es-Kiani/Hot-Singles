#include <iostream>
using namespace std;

int main()
{
    int x, y, count = 0;
    cin >> x >> y;

    for (size_t i = 0; i < x; i++)
    {
        for (size_t j = 0; j < y; j++)
        {
            char temp;
            cin >> temp;
            if (temp == '*')
            {
                count++;
            }
        }
    }

    cout << count;

    return 0;
}