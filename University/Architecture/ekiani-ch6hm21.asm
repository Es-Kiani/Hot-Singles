;##############################################################################
;# ekiani-ch6hm21.asm                                                         #
;#                                                                            #
;# Author: Esfandiar Kiani                                                    #
;# Date:  16-June-2022                                                        #
;#                                                                            #
;##############################################################################

.global  _main

section .text:

_main:  ORG     100 
        BSA     SUB     ; Subroutine to subtract two numbers
FNM,    DEC     13      ; First number (Operand one)
SNM,    DEC     22      ; Second number (Operand two)
RES,    DEC     ---     ; An empty space to store result of subtraction
        HLT
SUB,    HEX      0
        LDA     SUB I   ; Load the first number
        CMA
        INC             ; Create two's compliment of that
        ISZ     SUB     
        ADD     SUB I   ; Add second number with first number's two's compliment (Subtraction)
        ISZ     SUB
        STA     SUB I   ; Store the result in the third place
        ISZ     SUB     ; INC to find return address
        BUN     SUB I
section .data:
        END