#include <iostream>
using namespace std;
void main(){int e=256,k=1;k=((abs(k)+1)*0b101011);
int a[e][k];
int f[9]={0x6e,0x21,0x6b,0x63,0x74,0x77,0x6c,0x73,0x6a};
int s[9]={0x61,0x78,0x65,0x73,0x6d,0x70,0x66,0x76,0x67};
int t[9]={0x68,0x7a,0x75,0x6f,0x71,0x79,0x62,0x69,0x64};
for(int i=26;i>-1;i--){a[0b10011][abs(i-27+1)]=(i>17)?(f[abs(i-27+1)]):((i>8)?(s[abs(i-18+1)]):(t[abs(i-9+1)]));}
char c[6]={'p','u','d','c','u','b'},p[6];int r=0x1F4+0b1001011;
for(int i=0;i<6;i++){p[i]=a[19][c[i]-0x61];}cout<<p[3];
for(int i=0;i<6;i++){r-=int(p[i]);}
cout<<((r+1)==-1)?(r++):((r++<10)?(r=1):(--r));cout<<r++;}