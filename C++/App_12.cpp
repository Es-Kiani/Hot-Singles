#include <iostream>

using namespace std;

int main()
{
    int password = 13, user_Input;

    do
    {
        cout << endl
             << "INPUT YOUR PASSWORD: ";

        cin >> user_Input;

        cout << ((user_Input == password) ? "CORRECT" : "WRONG") << endl;
    } while (user_Input != password);

    return 0;
}