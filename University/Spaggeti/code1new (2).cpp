#include<iostream>
using namespace std;
int main()
{

    // 
    int a1 = 0, b1 = 10, arr[10], j;

    if (a1 == 1)
        cout << 1;
    else
        cout << 0;

        // (a1==1) ? (cout<<1) : (cout<<0) ;

    // () ? () : (); 

    // cout << (a1==1) ? (a1++) : (++a1);

    cout<<endl;

    cout << a1++;
    cout << ++a1;

    cout<<endl;
    
    for (int i = 0; i <= 100; i++)
    {
        ++j;
        cout<<  (a1 == 1) ? ((b1 == 10) ? b1 = 1 : b1 = 3) : ((a1 == 2) ? b1 = 2 : b1 = 0);
        if (j == 10) j /= 10;
        
        ///arr[10]; // 1010101010
              // arr[10] = int u  = 1010101010
		//cout << (2 << 1); 
    }
  
        return 0;
}