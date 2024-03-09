;##############################################################################
;# ekiani-ch6hm13.asm                                                         #
;#                                                                            #
;# Author: Esfandiar Kiani                                                    #
;# Date:  14-June-2022                                                        #
;#                                                                            #
;##############################################################################

.global  _main

section .text:

_main:  ORG     100 
        BSA     STZ     ; Subroutine to multiply two number with multi
        DEC     5       ; First number
        DEC     4       ; Second number
        STA     RES
        HLT
STZ,    HEX     0
        LDA     STZ I
        ADD     MON
        CMA
        INC
        STA     CTR     ; Store loop range in CTR
        ISZ     STZ
        LDA     STZ I 
        STA     RES
        ISZ     STZ     ; INC to find return address
LOP,    ADD     RES
        ISZ     CTR
        BUN     LOP
        BUN     STZ I
section .data:
        CTR,    --
        RES,    --
        MON,    -1
        END