;##############################################################################
;# ekiani-hm06.asm                                                            #
;#                                                                            #
;# Author: Esfandiar Kiani                                                    #
;# Date:  26-May-2022                                                         #
;#                                                                            #
;##############################################################################

.global  _main

section .text:

_main:  ORG     100
        BSA     XCG     ; Subrouting to exchange two word of memory with each other
        HEX     555     ; Fisrt word of source data address
        HEX     222     ; Fisrt word of destination address
        DEC     -13     ; Count of words that should we change
        HLT
XCG,    HEX     0
        LDA     XCG I
        STA     PT1     ; Store the source data address in in PT1
        ISZ     XCG
        LDA     XCG I
        STA     PT2     ; Store the source data address in in PT2
        ISZ     XCG
        LDA     XCG I
        STA     CTR     ; Store loop range in CTR
        ISZ     XCG     ; INC to find return address
LOP,    LDA     PT2 I   ; Creat and store a copy of second word of data
        STA     TMP
        LDA     PT1 I   ; Make a copy of first word to place of second word
        STA     PT2 I
        LDA     TMP I   ; Store second word data from temporary variable to place of first word (exchange)
        STA     PT1 I
        ISZ     PT1
        ISZ     PT2
        ISZ     CTR
        BUN     LOP
        BUN     XCG I
section .data:
        CTR,    --
        PT1,    --
        PT2,    --
        TMP,    --
        END