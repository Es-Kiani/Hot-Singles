#include <iostream>

using namespace std;

int main()
{
     int num_Count, Num, num_Cft, total_Cft = 1, sum = 0, Av = 0;

     cout << endl
          << "Welcome To Weighted Average Calculator \n How Many Numbers Do You Want To Calculate The Average? ";
     cin >> num_Count;

     // Esfandiar-Kiani

     for (short i = 0; i < num_Count; i++)
     {
          cout << endl
               << "Enter Your Number: ";
          cin >> Num;

          cout << "Enter Number Coefficient: ";
          cin >> num_Cft;

          total_Cft += num_Cft;
          sum += (Num * num_Cft);
     }

     // For Division by Zero Err
     if (total_Cft != 0)
     {
          Av = sum / total_Cft;
     }
     else
     {
          Av = 0;
     };

     // Esfandiar-Kiani

     cout << endl
          << endl
          << "Your Weighted Average Is: " << Av << endl;

     return 0;
}