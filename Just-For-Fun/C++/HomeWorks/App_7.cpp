#include <iostream>

using namespace std;

int main()
{
    int age = 20;
    do
    {
        cout << "What is your Age? ";
        cin >> age;
    } while (age <= 18);
    return 0;
}