;##############################################################################
;# ekiani-hm05.asm                                                            #
;#                                                                            #
;# Author: Esfandiar Kiani                                                    #
;# Date:  26-May-2022                                                         #
;#                                                                            #
;##############################################################################

.global  _main

section .text:

_main:  ORG     100
        BSA     CUT     ; Subrouting to cut 50 word of memory to another place
        HEX     185     ; Fisrt word of source data address
        HEX     313     ; Fisrt word of destination address
        DEC     -50     ; Count of words that should we cut
        HLT
CUT,    HEX     0
        LDA     CUT I
        STA     PT1     ; Store the source data address in in PT1
        ISZ     CUT
        LDA     CUT I
        STA     PT2     ; Store the source data address in in PT2
        ISZ     CUT
        LDA     CUT I
        STA     CTR     ; Store loop range in CTR
        ISZ     CUT     ; INC to find return address
LOP,    LDA     PT1 I   ; Load data from source
        STA     PT2 I   ; Copy data to dest
        CLA             ; Creat an empty word to replace the source data
        STA     PT1 I   ; Clear the source from data (Write an empty word to memory)
        ISZ     PT1
        ISZ     PT2
        ISZ     CTR
        BUN     LOP
        BUN     CUT I
section .data:
        CTR,    --
        PT1,    --
        PT2,    --
        END