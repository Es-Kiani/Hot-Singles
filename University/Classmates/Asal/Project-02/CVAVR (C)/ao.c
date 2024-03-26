/*
 * ao.c
 *
 * Created: 2024-01-18 03:39:42 PM
 * Author: Asal Omrani
 */

#include <io.h>
#include <mega16.h>
#include <delay.h>

#define UP PINB .0
#define DOWN PINB .1
#define ON 0
#define OFF 0

flash unsigned char
    addad[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

void show(char n1, char n2, char n3, char n4)
{
    PORTC = 0x0E, PORTD = n1;
    delay_ms(10);

    PORTC = 0x0D, PORTD = n2;
    delay_ms(10);

    PORTC = 0x0B, PORTD = n3;
    delay_ms(10);

    PORTC = 0x07, PORTD = n4;
    delay_ms(10);
}

void counter()
{
    int a, b, c, d;
    for (a = 9; a >= 0; a--)
        for (b = 9; b >= 0; b--)
            for (c = 9; c >= 0; c--)
                for (d = 9; d >= 0; d--)
                {
                    show(addad[a], addad[b], addad[c], addad[d]);
                    if (PINA .3 == 1)
                        return;
                }
}

void codemeli()
{
    char i;
    for (i = 0; i < 20; i++)
        show(OFF, OFF, OFF, addad[1]);
    for (i = 0; i < 20; i++)
        show(OFF, OFF, addad[1], addad[2]);
    for (i = 0; i < 20; i++)
        show(OFF, addad[1], addad[2], addad[7]);
    for (i = 0; i < 20; i++)
        show(addad[1], addad[2], addad[7], addad[3]);
    for (i = 0; i < 20; i++)
        show(addad[2], addad[7], addad[3], addad[6]);
    for (i = 0; i < 20; i++)
        show(addad[7], addad[3], addad[6], addad[3]);
    for (i = 0; i < 20; i++)
        show(addad[3], addad[6], addad[3], addad[9]);
    for (i = 0; i < 20; i++)
        show(addad[6], addad[3], addad[9], addad[7]);
    for (i = 0; i < 20; i++)
        show(addad[3], addad[9], addad[7], addad[3]);
    for (i = 0; i < 20; i++)
        show(addad[9], addad[7], addad[3], addad[1]);
    for (i = 0; i < 20; i++)
        show(addad[7], addad[3], addad[1], OFF);
    for (i = 0; i < 20; i++)
        show(addad[3], addad[1], OFF, OFF);
    for (i = 0; i < 20; i++)
        show(addad[1], OFF, OFF, OFF);
}

void main()
{
    char a = 0, b = 0;
    DDRA = 0X00, DDRB = 0X00, DDRC = 0Xff, DDRD = 0Xff;
    PORTA = 0Xff, PORTB = 0Xff, PORTC = 0X00, PORTD = 0X00;

    while (1)
    {
        if (PINA .0 == ON)
        {
            while (PINA .0 == ON)
            {
                show(addad[a], addad[b], OFF, OFF);
                if (UP == ON)
                {
                    if (b == 9)
                    {
                        b = 0;
                        if (a == 9)
                            a = 0;
                        else
                            a++;
                    }
                    else
                        b++;
                    delay_ms(300);
                }
                else if (DOWN == ON)
                {
                    if (b == 0)
                    {
                        b = 9;
                        if (a == 0)
                            a = 9;
                        else
                            a--;
                    }
                    else
                        b--;
                    delay_ms(300);
                }
            }
        }
        else if (PINA .2 == ON)
        {
            while (PINA .2 == ON)
                show(0x71, 0x77, 0x30, 0x38);
        }
        else if (PINA .3 == ON)
        {
            counter();
        }
        else if (PINA .4 == ON)
        {
            codemeli();
        }
        else
        {
            show(0, 0, 0, 0);
        }
    }
}
