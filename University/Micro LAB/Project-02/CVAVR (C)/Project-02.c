/*
 * Project-02.c
 *
 * Created: 2023-12-20 04:28:01 PM
 * Author: Esfandiar Kiani
 */

#include <mega16.h>
#include <delay.h>

flash unsigned char
    SEG7_DNo[5] = {0x00, 0x0E, 0x0D, 0x0B, 0x07};

flash unsigned char
    // 7Seg Codes for Showing Numbers (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    // Converting the a-g codes to binary and from the binary form to hex num
    DIGIT[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

void main(void)
{
    char MSD = 0, LSD = 0;

    DDRA  = 0X00, DDRC  = 0Xff, DDRD  = 0Xff;
    PORTA = 0Xff, PORTC = 0X00, PORTD = 0X00;

    while (1)
    {
        PORTC = 0Xff;

        //*     Manual Up-Down Counter      -   Done
        while (PINA.0 == 0)
        {
            PORTC = SEG7_DNo[2];
            PORTD = DIGIT[MSD];
            delay_ms(1);

            PORTC = SEG7_DNo[3];
            PORTD = DIGIT[LSD];
            delay_ms(1);

            if (PINA.6 == 0)
            {
                if (LSD == 9)
                { LSD = 0; MSD = (MSD == 9) ? 0 : MSD + 1; }
                else
                    LSD++;
                delay_ms(200);
            }
            else if (PINA.7 == 0)
            {
                if (LSD == 0)
                    { LSD = 9; MSD = (MSD == 0) ? 9 : MSD - 1; }
                else
                    LSD--;
                delay_ms(200);
            }
        }

        //*     'FAIL'                      -   Done
        while (PINA.1 == 0)
        {
            PORTC = SEG7_DNo[1];
            PORTD = 0x71; // F
            delay_ms(2);

            PORTC = SEG7_DNo[2];
            PORTD = 0x77; // A
            delay_ms(2);

            PORTC = SEG7_DNo[3];
            PORTD = 0x30; // I
            delay_ms(2);

            PORTC = SEG7_DNo[4];
            PORTD = 0x38; // L
            delay_ms(2);
        }

        //*     Automatic Down Counter      -   Done
        while (PINA.2 == 0)
        {
            int Kilo, Hundred, Ten, One, Show;

            for (Kilo = 9; Kilo >= 0; Kilo--)
            {
                for (Hundred = 9; Hundred >= 0; Hundred--)
                {
                    for (Ten = 9; Ten >= 0; Ten--)
                    {
                        for (One = 9; One >= 0; One--)
                        {
                            for (Show = 0; Show < 15; Show++)
                            {
                                PORTC = SEG7_DNo[1];
                                PORTD = DIGIT[Kilo];
                                delay_ms(3);

                                PORTC = SEG7_DNo[2];
                                PORTD = DIGIT[Hundred];
                                delay_ms(3);

                                PORTC = SEG7_DNo[3];
                                PORTD = DIGIT[Ten];
                                delay_ms(3);

                                PORTC = SEG7_DNo[4];
                                PORTD = DIGIT[One];
                                delay_ms(3);


                                if (PINA.2) break;}
                            if (PINA.2) break;}
                        if (PINA.2) break;}
                    if (PINA.2) break;}
                if (PINA.2) break;}
        }

        //*     SSN                         -   Done
        while (PINA.3 == 0)
        {
            char i;

            for (i = 0; i < 55; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[1];
                delay_ms(4);
            }

            for (i = 0; i < 50; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[1];
                delay_ms(4);

                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[2];
                delay_ms(4);
            }

            for (i = 0; i < 45; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[1];
                delay_ms(4);

                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[2];
                delay_ms(4);

                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[7];
                delay_ms(4);
            }

            for (i = 0; i < 40; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[1];
                delay_ms(4);

                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[2];
                delay_ms(4);

                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[7];
                delay_ms(4);

                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[3];
                delay_ms(4);
            }

            for (i = 0; i < 40; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[2];
                delay_ms(4);

                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[7];
                delay_ms(4);

                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[3];
                delay_ms(4);

                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[6];
                delay_ms(4);
            }

            for (i = 0; i < 40; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[7];
                delay_ms(4);

                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[3];
                delay_ms(4);

                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[6];
                delay_ms(4);

                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[8];
                delay_ms(4);
            }

            for (i = 0; i < 40; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[3];
                delay_ms(4);

                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[6];
                delay_ms(4);

                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[8];
                delay_ms(4);

                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[4];
                delay_ms(4);
            }

            for (i = 0; i < 40; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[6];
                delay_ms(4);

                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[8];
                delay_ms(4);

                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[4];
                delay_ms(4);

                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[3];
                delay_ms(4);
            }

            for (i = 0; i < 40; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[8];
                delay_ms(4);

                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[4];
                delay_ms(4);

                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[3];
                delay_ms(4);

                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[0];
                delay_ms(4);
            }

            for (i = 0; i < 40; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[4];
                delay_ms(4);

                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[3];
                delay_ms(4);

                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[0];
                delay_ms(4);

                PORTC = SEG7_DNo[4];
                PORTD = DIGIT[3];
                delay_ms(4);
            }

            for (i = 0; i < 45; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[3];
                delay_ms(4);

                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[0];
                delay_ms(4);

                PORTC = SEG7_DNo[3];
                PORTD = DIGIT[3];
                delay_ms(4);
            }

            for (i = 0; i < 50; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[0];
                delay_ms(4);

                PORTC = SEG7_DNo[2];
                PORTD = DIGIT[3];
                delay_ms(4);
            }

            for (i = 0; i < 55; i++)
            {
                if (PINA.3)
                    break;
                PORTC = SEG7_DNo[1];
                PORTD = DIGIT[3];
                delay_ms(4);
            }
        }
    }
}