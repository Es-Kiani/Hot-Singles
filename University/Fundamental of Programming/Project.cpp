#include <iostream>
using namespace std;

#define m 4
// Esfandiar-Kiani_Project
void min_max(float arr[m][m])
{
    float min[3], max[3];

    min[0] = arr[0][0];
    max[0] = arr[0][0];
    min[1], min[2], max[1], max[2] = 0;

    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            if (arr[i][j] <= min[0])
            {
                min[0] = arr[i][j];
                min[1] = i;
                min[2] = j;
            }

            if (arr[i][j] > max[0])
            {
                max[0] = arr[i][j];
                max[1] = i;
                max[2] = j;
            }
        }
    };
    // Esfandiar-Kiani_Project
    cout << endl
         << "[+] Min No. Row:"
         << min[1] + 1 << endl
         << "    Min No. Column:"
         << min[2] + 1 << endl;

    cout << endl
         << "[+] Max No. Row:"
         << max[1] + 1 << endl
         << "    Max No. Column:"
         << max[2] + 1 << endl;
}

string symmetrical(float arr[m][m])
{
    bool symmetrically = true;

    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            if (i == j)
            {
                continue;
            }
            else
            {
                if (arr[i][j] != arr[j][i])
                {
                    symmetrically = false;
                }
            }
        }
        // Esfandiar-Kiani_Project
    }
    if (symmetrically == true)
    {
        return "Symmetrical!";
    }
    else
    {
        return "Not Symmetrical...!";
    }
}

float row_Sum(float arr[m])
{
    float Sum = 0;
    for (size_t i = 0; i < m; i++)
    {
        Sum += arr[i];
    }
    return Sum;
}

float up_MainDiameter_sum(float arr[m][m])
{
    float sum = 0;
    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            if (j > i)
            {
                sum += arr[i][j];
            }
        }
    }
    return sum;
}

void replacement(float repArr[m], int repRow, float arr[m][m])
{
    cout << endl
         << "[+] Your New Matrix" << endl;
    for (size_t i = 0; i < repRow - 1; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            cout << arr[i][j] << "\t";
        }
        cout << endl;
    }

    for (size_t i = 0; i < m; i++)
    {
        cout << repArr[i] << "\t";
    }

    cout << endl;

    for (size_t i = repRow; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            cout << arr[i][j] << "\t";
        }
        cout << endl;
    }
}

int main()
{
    float my_Matrix[m][m];
    cout << endl
         << "Welcome\n Enter Your Custom " << m << "*" << m << " Matrix:" << endl;

    // دریافت ماتریس
    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            cin >> my_Matrix[i][j];
        }
    }
    cout << endl;

    // قرینگی
    cout << "[+] Your Matrix Is " << symmetrical(my_Matrix) << endl;

    // کوچکترین و بزرگترین درایه
    min_max(my_Matrix);

    // جمع درایه های هرسطر
    float sum[m];
    cout << endl
         << "[+] One-by-One Row Sum";
    for (size_t row_No = 0; row_No < m; row_No++)
    {
        sum[row_No] = row_Sum(my_Matrix[row_No]);

        cout << endl
             << "    R" << row_No + 1 << " Sum: " << sum[row_No];
    }

    cout << endl;

    // بزرگترین جمع درایه های سطرها
    float biggest_Sum[2];
    bool rowSum_Equality = true;
    biggest_Sum[0] = sum[0];
    biggest_Sum[1] = 1;
    for (size_t sumArr_item = 0; sumArr_item < m; sumArr_item++)
    {
        if (sum[sumArr_item] > biggest_Sum[0])
        {
            biggest_Sum[0] = sum[sumArr_item];
            biggest_Sum[1] = sumArr_item + 1;
        }
        if (biggest_Sum[0] != sum[sumArr_item])
        {
            rowSum_Equality = false;
        }
    }

    if (rowSum_Equality == false)
    {
        cout << endl
             << "[+] Biggest RowSum Is For Row " << biggest_Sum[1] << endl;
    }
    else
    {
        cout << endl
             << "[+] All Rows Sum Is Equal! " << endl;
    }

    // جمع بالای قطر اصلی
    cout << endl
         << "[+] Sum of The Items Above Main Diameter: " << up_MainDiameter_sum(my_Matrix) << endl;

    // تکرار عدد دلخواه در پایین قطر اصلی
    int n = 0;
    float search_Num;
    cout << endl
         << "Do You Have a Number For Search In the Below of Main Diameter?\n Enter it: ";
    cin >> search_Num;

    for (size_t i = 0; i < m; i++)
    {
        for (size_t j = 0; j < m; j++)
        {
            if ((i > j) and (search_Num == my_Matrix[i][j]))
            {
                n++;
            }
        }
    }

    cout << endl
         << "[+] You Search For Number '" << search_Num << "'\n So We Found " << n << " of Them Below The Main Diameter." << endl;

    // جایگزینی سطر دلخواه با بردار دلخواه
    int user_RepRow;
    float user_RepArr[m];
    cout << endl
         << "Enter Your 1*" << m << " Matrix For Replace: " << endl;
    for (size_t i = 0; i < m; i++)
    {
        cin >> user_RepArr[i];
    }
    cout << " Do You Want To Replace it With Which Row? ";
    cin >> user_RepRow;

    replacement(user_RepArr, user_RepRow, my_Matrix);
    // Esfandiar-Kiani_Project

    cout << endl
         << "Thank You For Chousing Us\n Esfandiar-Kiani Project" << endl;
    return 0;
}