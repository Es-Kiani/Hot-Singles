/*
 * P2.c
 *
 * Created: 1/25/2023 7:53:42 PM
 * Author: Sima
 */

#include <mega16.h>
#include <delay.h>
flash unsigned char
num[10]={0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,
0b01111101,0b00000111,0b01111111,0b01101111};
flash unsigned char
FAIL[4]={0b01110001,0b01110111,0b00110000,0b00111000};
void main(void)
{
char i=0;
char j=0;
char k=0;
char l=0;
char m=0;
DDRD=0Xff;
PORTD=0X00;
DDRC=0Xff;
PORTC=0X00;
DDRA=0X00;
PORTA=0Xff;
while (1)
    {
               
        while(PINA.0==0)
        {
            for(k=0;k<10;k++)
                {
                    PORTC=0b00001011;
                    PORTD=num[i];;
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[j];
                    delay_ms(10);   
                }
            if(PINA.5==0)
                    {
                        if(j==9)
                        {
                            j=0;
                            if(i==9)
                            {
                                i=0;
                            }
                            else
                            {
                                i++;
                            }
                        }
                        else
                        {
                            j++;
                        }
                    }
            if(PINA.7==0)
                    {
                        if(j==0)
                        {
                            j=9;
                            if(i==0)
                            {
                                i=9;
                            }
                            else
                            {
                                i--;
                            }
                        }
                        else
                        {
                            j--;
                        }
                    }
        }    
        
        if(PINA.2==0)
        {       
            for(k=0;k<50;k++)
            {
                PORTC=0b00001110;
                PORTD=FAIL[0];;
                delay_ms(1);
                PORTC=0b00001101;
                PORTD=FAIL[1];
                delay_ms(1);
                PORTC=0b00001011;
                PORTD=FAIL[2];
                delay_ms(10); 
                PORTC=0b00000111;
                PORTD=FAIL[3];
                delay_ms(1);
                PORTD=FAIL[3];
                delay_ms(10);
            }
        }
        else
        {
            PORTC=0Xff;
        }
        while(PINA.3==0)
        {
            for(i=0;i<10;i++)
            {
                for(j=0;j<10;j++)
                {       
                    for(k=0;k<10;k++)
                    {
                        for(l=0;l<10;l++)
                        {                        
                            for(m=0;m<25;m++)
                            {
                                PORTC=0b00001110;
                                PORTD=num[9-i];
                                delay_ms(10);
                                PORTC=0b00001101;
                                PORTD=num[9-j];
                                delay_ms(10);
                                PORTC=0b00001011;
                                PORTD=num[9-k];
                                delay_ms(10); 
                                PORTC=0b00000111;
                                PORTD=num[9-l];
                                delay_ms(10);
                            }
                            if(PINA.3==1)
                            {
                                break;
                            }              
                        }
                        if(PINA.3==1)
                        {
                            PORTC=0Xff;
                            break;  
                        }
                        
                    }
                    if(PINA.3==1)
                    {
                        PORTC=0Xff;
                        break;
                    }        
                }
                if(PINA.3==1)
                {
                    PORTC=0Xff;
                    break;
                }
            }
        }
                     //1273219902
        while(PINA.4==0)
        {
            for(m=0;m<100;m++)
                {
                    PORTC=0b00000111;
                    PORTD=num[1];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<50;m++) 
                {
                    PORTC=0b00001011;
                    PORTD=num[1];
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[2];
                    delay_ms(10); 
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<33;m++)
                {
                    PORTC=0b00001101;
                    PORTD=num[1];
                    delay_ms(10);
                    PORTC=0b00001011;
                    PORTD=num[2];
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[7];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<25;m++)
                {
                    PORTC=0b00001110;
                    PORTD=num[1];
                    delay_ms(10);
                    PORTC=0b00001101;
                    PORTD=num[2];
                    delay_ms(10);
                    PORTC=0b00001011;
                    PORTD=num[7];
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[3];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<25;m++) 
                {
                    PORTC=0b00001110;
                    PORTD=num[2];
                    delay_ms(10);
                    PORTC=0b00001101;
                    PORTD=num[7];
                    delay_ms(10);
                    PORTC=0b00001011;
                    PORTD=num[3];
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[2];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<25;m++)
                {
                    PORTC=0b00001110;
                    PORTD=num[7];
                    delay_ms(10);
                    PORTC=0b00001101;
                    PORTD=num[3];
                    delay_ms(10);
                    PORTC=0b00001011;
                    PORTD=num[2];
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[1];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }                  
            for(m=0;m<25;m++)
                {
                    PORTC=0b00001110;
                    PORTD=num[3];
                    delay_ms(10);
                    PORTC=0b00001101;
                    PORTD=num[2];
                    delay_ms(10);
                    PORTC=0b00001011;
                    PORTD=num[1];
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[9];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<25;m++) 
                {
                    PORTC=0b00001110;
                    PORTD=num[2];
                    delay_ms(10);
                    PORTC=0b00001101;
                    PORTD=num[1];
                    delay_ms(10);
                    PORTC=0b00001011;
                    PORTD=num[9];
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[9];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<25;m++)
                {
                    PORTC=0b00001110;
                    PORTD=num[1];
                    delay_ms(10);
                    PORTC=0b00001101;
                    PORTD=num[9];
                    delay_ms(10);
                    PORTC=0b00001011;
                    PORTD=num[9];
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[0];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<25;m++)
                {
                    PORTC=0b00001110;
                    PORTD=num[9];
                    delay_ms(10);
                    PORTC=0b00001101;
                    PORTD=num[9];
                    delay_ms(10);
                    PORTC=0b00001011;
                    PORTD=num[0];
                    delay_ms(10);
                    PORTC=0b00000111;
                    PORTD=num[2];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            
           
            for(m=0;m<25;m++)
                {
                    PORTC=0b00001110;
                    PORTD=num[9];
                    delay_ms(10);
                    PORTC=0b00001101;
                    PORTD=num[0];
                    delay_ms(10);
                    PORTC=0b00001011;
                    PORTD=num[2];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<33;m++)
                {
                    PORTC=0b00001110;
                    PORTD=num[0];
                    delay_ms(10);
                    PORTC=0b00001101;
                    PORTD=num[2];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                PORTC=0Xff;
                break;
            }
            for(m=0;m<50;m++)
                {
                    PORTC=0b00001110;
                    PORTD=num[2];
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                break;
            }
            for(m=0;m<100;m++)
                {
                    PORTC=0b00001111;
                    delay_ms(10);
                }
            if(PINA.4==1)
            {
                break;
            }  
        }
    }
        
}