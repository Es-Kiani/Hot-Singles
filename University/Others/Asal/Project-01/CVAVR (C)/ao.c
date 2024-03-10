/*
 * ao.c
 *
 * Created: 2024-01-17 05:21:36 PM
 * Author: Asal Omrani
 */

#include <io.h>
#include <mega16.h>
#include <delay.h>

#define ON 1
#define OFF 0
#define RED PORTC .0
#define YELLOW PORTC .1
#define GREEN PORTC .2
#define speaker PORTC .6
#define monitor PORTD

void buzzer()
{
    speaker = ON;
    delay_ms(1000);
    speaker = OFF;
}

void show8()
{
    monitor = 0x7F;
    // buzzer(); //
    monitor = 0x07;
    delay_ms(1000);
    monitor = 0x7D;
    delay_ms(1000);
    monitor = 0x6D;
    delay_ms(1000);
    monitor = 0x66;
    delay_ms(1000);
    monitor = 0x4F;
    delay_ms(1000);
    monitor = 0x5B;
    delay_ms(1000);
    monitor = 0x06;
    delay_ms(1000);
    monitor = 0;    //
}

void show5()
{
    monitor = 0x6D;
    // buzzer(); //
    monitor = 0x66;
    delay_ms(1000);
    monitor = 0x4F;
    delay_ms(1000);
    monitor = 0x5B;
    delay_ms(1000);
    monitor = 0x06;
    delay_ms(1000);
    // monitor = 0;    //
}

void red()
{
    RED = ON;
    buzzer(); //
    show8();
    RED = OFF;
}

void yellow()
{
    YELLOW = ON;
    delay_ms(2000);
    YELLOW = OFF;
}

void green()
{
    GREEN = ON;
    buzzer(); //
    show5();
    GREEN = OFF;
}

void main()
{
    DDRD = 0xFF, DDRC = 0xFF;

    while (1)
    {
        red();

        yellow();

        green();

        yellow();
    }
}