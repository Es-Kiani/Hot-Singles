;##############################################################################
;# ekiani-hm07.1.asm                                                            #
;#                                                                            #
;# Author: Esfandiar Kiani                                                    #
;# Date:  26-May-2022                                                         #
;#                                                                            #
;##############################################################################

.global  _main

section .text:

_main:  ORG     111
        BSA     IN2     ; Subrouting to get 100 words from input and store them
        HEX     400     ; Address of first place where inputs saved
        DEC     -50     ; Count of inputs
        HLT
IN2,    HEX     0
        LDA     IN2 I
        STA     PTR     ; Store the source data address in in PTR
        ISZ     IN2
        LDA     IN2 I
        STA     CTR     ; Store loop range in CTR
        ISZ     IN2     ; INC to find return address
FST,    SKI             ; Waiting for first input
        BUN     FST
        INP 
        OUT
        BSA     SH4     ; Logical left shift x4 for two times
        BSA     SH4     ; to free up the necessary space for 2nd char
SCD,    SKI             ; Waiting for second input
        BUN     SCD
        INP 
        OUT
        STA     PTR I   ; Storing 1nd & 2ns inputs in memory
        ISZ     PTR
        ISZ     CTR
        BUN     FST
        BUN     IN2 I
section .data:
        CTR,    --
        PTR,    --
        END