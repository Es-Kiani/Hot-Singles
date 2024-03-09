#include <iostream>
#include <math.h>

using namespace std;

int main()
{
     float a, b, c, s, result;

     cout << endl
          << "Welcome To Triangle Area Calculator" << endl
          << endl
          << "     /| " << endl
          << "    / | " << endl
          << " A /  | B" << endl
          << "  /   | " << endl
          << " /    | " << endl
          << "/ ____| " << endl
          << "   C    " << endl
          << endl
          << "Enter Triangle Sides" << endl;

     // Esfandiar-Kiani

     cout << " A:";
     cin >> a;

     cout << " B:";
     cin >> b;

     cout << " C:";
     cin >> c;

     s = (a + b + c) / 2;
     result = sqrt(s * (s - a) * (s - b) * (s - c));

     cout << endl
          << "The Area of This Triangle Is: " << result << endl;

     return 0;
}