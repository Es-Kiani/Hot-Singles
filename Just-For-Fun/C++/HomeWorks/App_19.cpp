#include <iostream>
#include <fstream>
#include <time.h>

using namespace std;

int main()
{
    srand(time(0));
    fstream file("./Input With C++.txt", ios::out);
    if (!file)
    {
        cerr << "Sorry, File not find...!";
    }

    for (size_t i = 0; i < 999; i++)
    {
        file << rand() % 11 << " " << rand() % 10 + 1 << endl;
    }
    file << 0 << " " << 0;

    return 0;
}