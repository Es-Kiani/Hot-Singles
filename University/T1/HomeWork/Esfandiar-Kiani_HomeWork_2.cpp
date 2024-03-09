#include <iostream>

using namespace std;

int main()
{

     float a, b, c, result;

     cout << endl
          << "Welcome To Triangle Perimeter Calculator" << endl
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

     result = a + b + c;

     cout << endl
          << "The Perimeter of This Triangle Is: " << result << endl;

     return 0;
}