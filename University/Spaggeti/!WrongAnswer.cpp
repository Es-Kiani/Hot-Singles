#include<iostream>
using namespace std;void main(){int a=123,trb=256,trbo=1;
trbo=((abs(trbo)+1)<<0x40);int aa[trb][trbo];
int f[9]={0x6e,0x21,0x6b,0x63,0x74,0x77,0x6c,0x73,0x6a};
int s[9]={0x61,0x78,0x65,0x73,0x6d,0x70,0x66,0x76,0x67};
int t[9]={0x68,0x7a,0x75,0x6f,0x71,0x79,0x62,0x69,0x64};
for(int i=26;i>-1;i--)
aa[0b1101^0b11110][26-i]=(i>17)?(f[26-i]):((i>8)?(s[17-i]):(t[8-i]));
int c[6]={'p','u','d','c','u','b'},r=0x1F4+0b1001011^a,j=0;goto ox1F3;f9:
char p[6],W;for(int*i=c;j<6;i++)p[j++]=aa[19][*i-0x61];W=p[3]-0x14;cout<<W;
for(int i=0;i<6;i++)r-=int(p[i]);goto ob101;ox1F3:cout<<((j+1)<<(a))%2;
goto f9;ob101:cout<<((r+1)==-1)?(r++):((r++<10)?(r=1):(--r));}