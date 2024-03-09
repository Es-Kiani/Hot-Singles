#include <iostream>

using namespace std;

int main()
{
     string P1;
     string P2;
     string P3;

     cout << endl
          << "Welcome" << endl
          << "Person 1 Please Say Your Name: ";
     cin >> P1;

     cout << "Person 2 Please Say Your Name: ";
     cin >> P2;

     cout << "Person 3 Please Say Your Name: ";
     cin >> P3;

     cout << endl
          << "Hi " << P1 << endl
          << "Hi " << P2 << endl
          << "Hi " << P3;

     return 0;
}
