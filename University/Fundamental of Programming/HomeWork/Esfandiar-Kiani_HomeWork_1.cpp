#include <iostream>

using namespace std;

int main()
{

    float h, g, result;

    cout << endl
         << "Welcome To Triangle Area Calculator" << endl
         << "     /| " << endl
         << "    / | " << endl
         << " C /  | h" << endl
         << "  /   | " << endl
         << " /    | " << endl
         << "/ ____| " << endl
         << "   g    " << endl
         << endl;

    // Esfandiar-Kiani

    cout << "Enter g: ";
    cin >> g;
    cout << "Enter h: ";
    cin >> h;

    result = (g * h) / 2;

    cout << endl
         << "The Area of This Triang Is: " << result << endl;

    return 0;
}