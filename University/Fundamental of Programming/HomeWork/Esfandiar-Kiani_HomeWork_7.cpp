#include <iostream>

using namespace std;

int main()
{
	float longBase, shortBase, height, area;
	cout << endl
		 << "Welcome To Trapezoid Area Calculator" << endl
		 << endl
		 << " Enter Long Base Value: ";
	cin >> longBase;

	cout << " Enter Short Base Value: ";
	cin >> shortBase;

	cout << " Height of Trapezoid: ";
	cin >> height;

	// Esfandiar-Kiani

	area = ((longBase + shortBase) / 2) * height;

	cout << endl
		 << "The Area of This Trapezoid Is: " << area << endl;

	return 0;
}