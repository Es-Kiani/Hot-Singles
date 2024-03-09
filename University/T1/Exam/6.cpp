#include <iostream>

using namespace std;

int main()
{
    char str[500];
    int n = 0;

    cout << "Enter Your Text: \n";

    cin.get(str, 499);

    for (size_t i = 0; i <= 500; i++)
    {
        if (str[i] == '*')
        {
            n++;
        }
    }
    if (n < 10)
    {
        cout << "Yes";
    }
    else
    {
        cout << "No";
    }

    return 0;
}