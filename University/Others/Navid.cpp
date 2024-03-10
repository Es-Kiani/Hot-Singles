#include <iostream>

using namespace std;

int main()
{
    string v, final, temp;
    cin >> v;
    char t;

    int z = 0;

    for (int i = 0; i < v.size(); i++)
    {
        if (v[i] == 'L')
        {
            if (z > 0)
                z = z - 1;
        }
        else if (v[i] == 'R')
        {
            if (z < temp.size())
            {
                z = z + 1;
            }
        }
        else
        {
                
            t = v[i];

            temp.insert(z, 1, t);
            z = z + 1;
        }
    
        final = temp;
    }


    cout << final;

}