;##############################################################################
;# ekiani-ch6hm22.asm                                                         #
;#                                                                            #
;# Author: Esfandiar Kiani                                                    #
;# Date:  16-June-2022                                                        #
;#                                                                            #
;##############################################################################

.global  _main

section .text:

_main:  ORG     100 
        BSA     DBC     ; Subroutine to compliment a block of data
        HEX     500     ; Address of first word of block
        DEC     085
        HLT
DBC,    HEX     0
        LDA     DBC I   ; Load the address of block
        STA     PTR     ; Store it to the PTR
        ISZ     DBC
        LDA     DBC I   ; Load, preparing and store the loop counter
        CMA
        INC
        STA     CTR
        ISZ     DBC     ; INC to find return address
LOP,    LDA     PTR I 
        CMA
        STA     PTR I
        ISZ     PTR
        ISZ     CTR
        BUN     LOP
        BUN     DBC I
section .data:
        CTR,    ---
        PTR,    ---
        END