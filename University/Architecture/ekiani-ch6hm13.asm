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
        BSA     CUT     ; Subrouting to set 0 to some words of memory
        HEX     500     ; Fisrt word of data address
        HEX     5FF     ; End word of data address
        HLT
STZ,    HEX     0
        LDA     STZ I
        STA     PTR     ; Store the source data address in in PTR
        ISZ     STZ
        CMA
        INC
        ADD     STZ I
        STA     CTR     ; Calculate count of words and store it in CRT
        ISZ     STZ     ; INC to find return address
        CLA             ; Set AC to 0 to assining zero to memory words
LOP,    STA     PTR I
        ISZ     PTR
        ISZ     CTR
        BUN     LOP
        BUN     STZ I
section .data:
        CTR,    --
        PTR,    --
        END