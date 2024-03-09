#include <iostream>
using namespace std;
#define E 6

int above_the_main_diameter_sum(int matris[E][E])
{
    int sum = 0;
    for (int i = 0; i < E; i++)
    {
        for (int j = 0; j < E; j++)
        {
            if (j > i)
            {
                sum += matris[i][j];
            }
        }
    }
    return sum;
}

void minimum(int matris[E][E])
{
    int min[3];
    min[2] = matris[0][0];

    for (int i = 0; i < E; i++)
    {
        for (int j = 0; j < E; j++)
        {
            if (matris[i][j] <= min[0])
            {
                min[2] = matris[i][j];
                min[0] = i;
                min[1] = j;
            }
        }
    }
    cout << "MINROW:" << min[0] << endl;
    cout << "COLUMN:" << min[1] << endl;
}

void maximum(int matris[E][E])
{
    int max[3];
    max[2] = matris[0][0];
    for (int i = 0; i < E; i++)
    {
        for (int j = 0; j < E; j++)
        {
            if (matris[i][j] > max[0])
            {
                max[2] = matris[i][j];
                max[0] = i;
                max[1] = j;
            }
        }
    }
    cout << "MAXROW:" << max[0] << endl;
    cout << "COLUMN:" << max[1] << endl;
}

string Tagharon(int matris[E][E])
{
    bool Motagharen = true;
    for (int i = 0; i < E; i++)
    {
        for (int j = 0; j < E; j++)
        {
            if (matris[i][j] != matris[j][i])
            {
                Motagharen = false;
            }
        }
    }
    if (Motagharen == true)
    {
        return "the shape is : Motagharen:)";
    }
    else
    {
        return "the shape is not Motagharen!:(";
    }
}

void JAYGOZINI(int replacement[E], int replacementRow, int matris[E][E])
{
    cout << endl
         << " Your Matrix REPLACED " << endl;
    for (int i = 0; i < replacementRow; i++)
    {
        for (int j = 0; j < E; j++)
            cout << matris[i][j] << "\t";
    }
    cout << endl;

    for (int i = 0; i < E; i++)
    {
        cout << replacement[i] << "\t";
    }
    for (int i = replacementRow; i < E; i++)
    {
        for (int j = 0; j < E; j++)
        {
            cout << matris[i][j] << "\t";
            cout << endl;
        }
    }
}

int main()
{
    cout << "HELLO MR.KAEIMI!\n ";
    cout << "FOZHAN POROZHE ";

    cout << ".............................." << endl;
    cout << ".............................." << endl;
    int Matris[E][E];
    cout << " SAY YOUR MATRIS NUMBER : " << endl;
    for (int i = 0; i < E; i++)
    {
        for (int j = 0; j < E; j++)
        {
            cin >> Matris[i][j];
        }
    }
    cout << ".............................." << endl;

    cout << "code1." << endl
         << "above_the_main_diameter_sum:" << above_the_main_diameter_sum(Matris) << endl;

    cout << ".............................." << endl;

    int p = 0;
    int number;

    cout << "code2." << endl;
    cout << "SAY YOUR NUMBER FOR THE BELOW OF MAIN DIAMETER...";
    cin >> number;

    for (int i = 0; i < E; i++)
    {
        for (int j = 0; j < E; j++)
        {
            if (i > j && number == Matris[i][j])
            {
                p++;
            }
        }
    }
    cout << "P:" << p << endl;

    cout << ".............................." << endl;

    cout << "code3. WHAT IS YOUR MATRIS?" << Tagharon(Matris) << endl;

    cout << ".............................." << endl;
    cout << "code4." << endl;
    int h = 0, s = 0;
    cout << "You can see the Sum Of The Numbers in each ROW";
    for (int i = 0; i < E; i++)
    {
        for (int j = 0; j < E; j++)
        {
            s += Matris[i][j];
        }

        cout << "ROW " << i << " = " << s << endl;
        s = 0;
    }

    cout << ".............................." << endl;

    cout << "code5."
         << "Minimun item:";
    minimum(Matris);
    cout << "Maximum item:";
    maximum(Matris);
    cout << endl;

    cout << ".............................." << endl;
    cout << "code6." << endl;

    int MAX = 0, a = 0, Line = 0;
    for (int i = 0; i < E; i++)
    {
        for (int j = 0; j < E; j++)
        {

            a += Matris[i][j];
        }
        if (a > MAX)
        {
            MAX = a;
            Line = i;
        }
        a = 0;
    }
    cout << " Line Number with Biggest sum : " << Line << endl;
    cout << " Biggest Sum is = " << MAX << endl;

    cout << ".............................." << endl;
    cout << "code7." << endl;
}