#include <iostream>
using namespace std;

void add(int *, int *, int, int);
void simplify(int *, int *);
int main()
{
    int n = 0, kasr[1001][2], result_Sourat = 0, result_Makhraj = 1;

    for (size_t i = 0; i < 1001; i++)
    {
        for (size_t j = 0; j < 2; j++)
        {
            cin >> kasr[i][j];
        }
        if (kasr[i][1] == 0)
            break;
        n++;
    }
    //! Esfandiar-Kiani
    if (n >= 2)
    {
        for (size_t i = 0; i < n; i++)
        {
            add(&result_Sourat, &result_Makhraj, kasr[i][0], kasr[i][1]);
        }

        simplify(&result_Sourat, &result_Makhraj);
        cout << result_Sourat << "/" << result_Makhraj;
    }
    else
    {
        simplify(&kasr[0][0], &kasr[0][1]);
        cout << kasr[0][0] << "/" << kasr[0][1];
    }

    return 0;
}

void add(int *result_Sourat_ptr, int *result_Makhraj_ptr, int kasr_i_Sourat, int kasr_i_Makhraj)
{
    if (*result_Sourat_ptr == 0 or kasr_i_Sourat == 0)
    {
        *result_Sourat_ptr = (kasr_i_Sourat != 0 ? kasr_i_Sourat : *result_Sourat_ptr);
        *result_Makhraj_ptr = (kasr_i_Sourat != 0 ? kasr_i_Makhraj : *result_Makhraj_ptr);
    }
    else
    {
        if (*result_Makhraj_ptr == kasr_i_Makhraj)
            *result_Sourat_ptr += kasr_i_Sourat;
        else
        {
            if (kasr_i_Sourat == kasr_i_Makhraj)
                *result_Sourat_ptr += *result_Makhraj_ptr;
            else
            {
                *result_Sourat_ptr = (((*result_Sourat_ptr) * kasr_i_Makhraj) + (kasr_i_Sourat * (*result_Makhraj_ptr)));
                *result_Makhraj_ptr *= kasr_i_Makhraj;
            }
        }
    }
}

void simplify(int *_result_Sourat, int *_result_Makhraj)
{
    bool canSimple;
    do
    {
        canSimple = false;
        for (unsigned long int i = 2; i <= (*_result_Sourat > *_result_Makhraj ? *_result_Sourat : *_result_Makhraj); i++)
        {
            if (*_result_Sourat % i == 0 and *_result_Makhraj % i == 0)
            {
                *_result_Sourat /= i;
                *_result_Makhraj /= i;
                canSimple = true;
            }
        }
    } while (canSimple == true);
}
