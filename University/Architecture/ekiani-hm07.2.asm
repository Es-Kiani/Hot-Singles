;##############################################################################
;# ekiani-hm07.2.asm                                                            #
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
        DEC    -100     ; Count of inputs
        HLT
IN2,    HEX     0
        LDA     IN2 I
        STA     PTR     ; Store the source data address in in PTR
        ISZ     IN2
        LDA     IN2 I
        STA     CTR     ; Store loop range in CTR
        ISZ     IN2     ; INC to find return address
LOP,    SKI             ; Waiting for input
        BUN     LOP
        INP 
        OUT
        STA     PTR I   ; Storing input in memory[PTR]
        ISZ     PTR
        ISZ     CTR
        BUN     LOP
        BUN     IN2 I
section .data:
        CTR,    --
        PTR,    --
        END