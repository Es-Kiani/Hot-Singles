#include <iostream>
using namespace std;

int main()
{
    int x = 1, y = 3, z = 4, m = 4;
    char array1[2] = {'C', 'o'}, array2[2] = {'R', 'p'}, array3[2] = {'(', 'M'}, array4[2] = {'A', '!'}, array5[4] = {'S', 'b', 'F', 'P'}, array6[4] = {'u', 'V', 'Q', 'x'}, array7[11];
    char ****plaintext = new char ***[x];
    plaintext[0] = new char **[y];
    for (int j = 0; j < y; j++)
    {
        plaintext[0][j] = new char *[z];
        for (int k = 0; k < m; k++)
            plaintext[0][j][k] = new char[m];
    }
    for (int j = 0; j < y; j++)
        for (int k = 0; k < z; k++)
            for (int l = 0; l < m; l++)
            {   (k == 0 && l == 0)   ? plaintext[0][j][k][l] = *array1 + (j == 0 ? 0 : j == 1 ? 31 : 40)
                : (k == 1 && l == 0) ? plaintext[0][j][k][l] = *array2 + (j == 0 ? 0 : j == 1 ? 19 : 29)
                : (k == 2 && l == 0) ? plaintext[0][j][k][l] = *array3 + (j == 0 ? 14 * 2 : j == 1 ? 14 * 2 * k + j + 4 : 14 * (k + 1))
                : (k == 3 && l == 0) ? plaintext[0][j][k][l] = *array4 + (j == 0 ? 0 : j == 1 ? j + k : 20) : NULL;
                (l != 0 && l % 2 == 0) ? array7[3 * j + j + k] = array5[j + k - 1] + 2 : array7[3 * j + j + k] = array6[j + k - 1] + 75;}
                
    cout << plaintext[0][0][0][0] << plaintext[0][0][1][0] << plaintext[0][0][2][0] << plaintext[0][0][3][0] << plaintext[0][1][0][0] << plaintext[0][1][1][0] << plaintext[0][1][2][0] << plaintext[0][1][3][0] << plaintext[0][2][0][0] << plaintext[0][2][1][0] << plaintext[0][2][2][0] << "\n";
    cout << array7[0] << array7[1] << array7[2] << array7[3] << array7[4] << array7[5] << array7[6] << array7[7] << array7[8] << array7[9] << array7[10];
    return 0;
}
