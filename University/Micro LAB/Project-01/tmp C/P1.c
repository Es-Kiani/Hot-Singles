/*
 * P1.c
 *
 * Created: 1/25/2023 7:31:10 PM
 * Author: Sima
 */
#include <mega16.h>
#include <delay.h>
flash unsigned char
num[10]={0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,
0b01111101,0b00000111,0b01111111,0b01101111};
void main(void)
{
DDRA=0Xff;
PORTA=0X00;
DDRB=0Xff;
PORTB=0x00;
while (1)
    {  
    //red
       PORTB.5=1;
       PORTA=num[8];
       PORTB.0=1;
       delay_ms(1000);
       PORTA=num[7];
       PORTB.0=0;
       delay_ms(1000);
       PORTA=num[6];
       delay_ms(1000);
       PORTA=num[5];
       delay_ms(1000);
       PORTA=num[4];
       delay_ms(1000);
       PORTA=num[3];
       delay_ms(1000);
       PORTA=num[2];
       delay_ms(1000);
       PORTA=num[1];
       delay_ms(1000);
       PORTA=num[0];
       delay_ms(1000);
       PORTA=0x00;
    //yellow
       PORTB.5=0;
       PORTB.6=1;
       delay_ms(2000);
    //green
       PORTB.6=0;
       PORTB.7=1;
       PORTA=num[5];
       delay_ms(1000);
       PORTA=num[4];
       delay_ms(1000);
       PORTA=num[3];
       delay_ms(1000);
       PORTA=num[2];
       delay_ms(1000);
       PORTA=num[1];
       delay_ms(1000);
       PORTA=num[0];
       delay_ms(1000);
       PORTA=0x00;
    //yellow
       PORTB.7=0;
       PORTB.6=1;
       delay_ms(2000);
       PORTB.6=0;
    }
}
