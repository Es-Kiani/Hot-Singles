#include <iostream>

int main()
{
    std::string str = "";
    std::cin >> str;

    std::string res = "";

    int index = 0;
    for (int i = 0; i < str.length(); i++)
    {
        if (str[i] >= 'a' && str[i] <= 'z')
        {
            res.insert(index, 1, str[i]);
            index++;
        }
        else if (str[i] == 'L' && index > 0)
            index--;
        else if (str[i] == 'R' && index < res.length())
            index++;
    }
    std::cout << res;
}
