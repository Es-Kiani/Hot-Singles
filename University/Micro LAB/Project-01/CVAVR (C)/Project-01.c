/*
 * Project-01.c
 *
 * Created: 2023-12-19 11:13:11 AM
 * Author: Esfandiar Kiani
 */

#include <mega16.h>
#include <delay.h>


// Write a variable to the microcontroler memory
flash unsigned char
    // 7Seg Codes for Showing Numbers (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    // Converting the a-g codes to binary and from the binary form to hex num
   DIGIT[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};


void main(void)
{
   int counter;

   DDRB  = 0Xff, DDRC  = 0Xff;
   PORTB = 0x00, PORTC = 0X00;

   while (1)
   {
      //*      Sequence 01    -     red light (8s)
      PORTC = DIGIT[8];
      PORTB.4 = 1;        //? Light-1
      PORTB.7 = 1;        //? Buzzer
      delay_ms(1000);
      PORTB.7 = 0;

      for (counter = 8; counter > 0; counter--)
      {
         PORTC = DIGIT[counter];
         delay_ms(1000);
      }
      PORTB.4 = 0;

      //*      Sequence 02    -     yellow light (2s)
      PORTB.5 = 1;        //? Light-2
      delay_ms(2000);
      PORTB.5 = 0;

      //*      Sequence 03    -     green light (5s)
      PORTB.6 = 1;        //? Light-3

      for (counter = 6; counter > 0; counter--)
      {
         PORTC = DIGIT[counter];
         delay_ms(1000);
      }
      PORTB.6 = 0;

      //*      Sequence 04    -     yellow light (2s)
      PORTB.5 = 1;
      delay_ms(2000);
      PORTB.5 = 0;
   }
}
