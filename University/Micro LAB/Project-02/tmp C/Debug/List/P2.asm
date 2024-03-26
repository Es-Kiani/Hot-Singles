
;CodeVisionAVR C Compiler V3.12 Advanced
;(C) Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Build configuration    : Debug
;Chip type              : ATmega16
;Program type           : Application
;Clock frequency        : 8.000000 MHz
;Memory model           : Small
;Optimize for           : Size
;(s)printf features     : int, width
;(s)scanf features      : int, width
;External RAM size      : 0
;Data Stack size        : 256 byte(s)
;Heap size              : 0 byte(s)
;Promote 'char' to 'int': Yes
;'char' is unsigned     : Yes
;8 bit enums            : Yes
;Global 'const' stored in FLASH: No
;Enhanced function parameter passing: Yes
;Enhanced core instructions: On
;Automatic register allocation for global variables: On
;Smart register allocation: On

	#define _MODEL_SMALL_

	#pragma AVRPART ADMIN PART_NAME ATmega16
	#pragma AVRPART MEMORY PROG_FLASH 16384
	#pragma AVRPART MEMORY EEPROM 512
	#pragma AVRPART MEMORY INT_SRAM SIZE 1024
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	#define CALL_SUPPORTED 1

	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU GICR=0x3B
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x0060
	.EQU __SRAM_END=0x045F
	.EQU __DSTACK_SIZE=0x0100
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	CALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	PUSH R26
	PUSH R27
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMRDW
	POP  R27
	POP  R26
	ICALL
	.ENDM

	.MACRO __CALL2EX
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	CALL __EEPROMRDD
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z
	MOVW R30,R0
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	CALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	JMP  __RESET
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00

_num:
	.DB  0x3F,0x6,0x5B,0x4F,0x66,0x6D,0x7D,0x7
	.DB  0x7F,0x6F
_FAIL:
	.DB  0x71,0x77,0x30,0x38

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  GICR,R31
	OUT  GICR,R30
	OUT  MCUCR,R30

;CLEAR R2-R14
	LDI  R24,(14-2)+1
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,__SRAM_START
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	JMP  _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x160

	.CSEG
;/*
; * P2.c
; *
; * Created: 1/25/2023 7:53:42 PM
; * Author: Sima
; */
;
;#include <mega16.h>
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
;#include <delay.h>
;flash unsigned char
;num[10]={0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,
;0b01111101,0b00000111,0b01111111,0b01101111};
;flash unsigned char
;FAIL[4]={0b01110001,0b01110111,0b00110000,0b00111000};
;void main(void)
; 0000 0010 {

	.CSEG
_main:
; .FSTART _main
; 0000 0011 char i=0;
; 0000 0012 char j=0;
; 0000 0013 char k=0;
; 0000 0014 char l=0;
; 0000 0015 char m=0;
; 0000 0016 DDRD=0Xff;
;	i -> R17
;	j -> R16
;	k -> R19
;	l -> R18
;	m -> R21
	LDI  R17,0
	LDI  R16,0
	LDI  R19,0
	LDI  R18,0
	LDI  R21,0
	LDI  R30,LOW(255)
	OUT  0x11,R30
; 0000 0017 PORTD=0X00;
	LDI  R30,LOW(0)
	OUT  0x12,R30
; 0000 0018 DDRC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x14,R30
; 0000 0019 PORTC=0X00;
	LDI  R30,LOW(0)
	OUT  0x15,R30
; 0000 001A DDRA=0X00;
	OUT  0x1A,R30
; 0000 001B PORTA=0Xff;
	LDI  R30,LOW(255)
	OUT  0x1B,R30
; 0000 001C while (1)
_0x3:
; 0000 001D     {
; 0000 001E 
; 0000 001F         while(PINA.0==0)
_0x6:
	SBIC 0x19,0
	RJMP _0x8
; 0000 0020         {
; 0000 0021             for(k=0;k<10;k++)
	LDI  R19,LOW(0)
_0xA:
	CPI  R19,10
	BRSH _0xB
; 0000 0022                 {
; 0000 0023                     PORTC=0b00001011;
	LDI  R30,LOW(11)
	OUT  0x15,R30
; 0000 0024                     PORTD=num[i];;
	MOV  R30,R17
	RCALL SUBOPT_0x0
; 0000 0025                     delay_ms(10);
; 0000 0026                     PORTC=0b00000111;
	LDI  R30,LOW(7)
	OUT  0x15,R30
; 0000 0027                     PORTD=num[j];
	MOV  R30,R16
	RCALL SUBOPT_0x0
; 0000 0028                     delay_ms(10);
; 0000 0029                 }
	SUBI R19,-1
	RJMP _0xA
_0xB:
; 0000 002A             if(PINA.5==0)
	SBIC 0x19,5
	RJMP _0xC
; 0000 002B                     {
; 0000 002C                         if(j==9)
	CPI  R16,9
	BRNE _0xD
; 0000 002D                         {
; 0000 002E                             j=0;
	LDI  R16,LOW(0)
; 0000 002F                             if(i==9)
	CPI  R17,9
	BRNE _0xE
; 0000 0030                             {
; 0000 0031                                 i=0;
	LDI  R17,LOW(0)
; 0000 0032                             }
; 0000 0033                             else
	RJMP _0xF
_0xE:
; 0000 0034                             {
; 0000 0035                                 i++;
	SUBI R17,-1
; 0000 0036                             }
_0xF:
; 0000 0037                         }
; 0000 0038                         else
	RJMP _0x10
_0xD:
; 0000 0039                         {
; 0000 003A                             j++;
	SUBI R16,-1
; 0000 003B                         }
_0x10:
; 0000 003C                     }
; 0000 003D             if(PINA.7==0)
_0xC:
	SBIC 0x19,7
	RJMP _0x11
; 0000 003E                     {
; 0000 003F                         if(j==0)
	CPI  R16,0
	BRNE _0x12
; 0000 0040                         {
; 0000 0041                             j=9;
	LDI  R16,LOW(9)
; 0000 0042                             if(i==0)
	CPI  R17,0
	BRNE _0x13
; 0000 0043                             {
; 0000 0044                                 i=9;
	LDI  R17,LOW(9)
; 0000 0045                             }
; 0000 0046                             else
	RJMP _0x14
_0x13:
; 0000 0047                             {
; 0000 0048                                 i--;
	SUBI R17,1
; 0000 0049                             }
_0x14:
; 0000 004A                         }
; 0000 004B                         else
	RJMP _0x15
_0x12:
; 0000 004C                         {
; 0000 004D                             j--;
	SUBI R16,1
; 0000 004E                         }
_0x15:
; 0000 004F                     }
; 0000 0050         }
_0x11:
	RJMP _0x6
_0x8:
; 0000 0051 
; 0000 0052         if(PINA.2==0)
	SBIC 0x19,2
	RJMP _0x16
; 0000 0053         {
; 0000 0054             for(k=0;k<50;k++)
	LDI  R19,LOW(0)
_0x18:
	CPI  R19,50
	BRSH _0x19
; 0000 0055             {
; 0000 0056                 PORTC=0b00001110;
	LDI  R30,LOW(14)
	OUT  0x15,R30
; 0000 0057                 PORTD=FAIL[0];;
	LDI  R30,LOW(_FAIL*2)
	LDI  R31,HIGH(_FAIL*2)
	RCALL SUBOPT_0x1
; 0000 0058                 delay_ms(1);
; 0000 0059                 PORTC=0b00001101;
	LDI  R30,LOW(13)
	OUT  0x15,R30
; 0000 005A                 PORTD=FAIL[1];
	__POINTW1FN _FAIL,1
	RCALL SUBOPT_0x1
; 0000 005B                 delay_ms(1);
; 0000 005C                 PORTC=0b00001011;
	LDI  R30,LOW(11)
	OUT  0x15,R30
; 0000 005D                 PORTD=FAIL[2];
	__POINTW1FN _FAIL,2
	RCALL SUBOPT_0x2
; 0000 005E                 delay_ms(10);
; 0000 005F                 PORTC=0b00000111;
	LDI  R30,LOW(7)
	OUT  0x15,R30
; 0000 0060                 PORTD=FAIL[3];
	__POINTW1FN _FAIL,3
	RCALL SUBOPT_0x1
; 0000 0061                 delay_ms(1);
; 0000 0062                 PORTD=FAIL[3];
	__POINTW1FN _FAIL,3
	RCALL SUBOPT_0x2
; 0000 0063                 delay_ms(10);
; 0000 0064             }
	SUBI R19,-1
	RJMP _0x18
_0x19:
; 0000 0065         }
; 0000 0066         else
	RJMP _0x1A
_0x16:
; 0000 0067         {
; 0000 0068             PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0069         }
_0x1A:
; 0000 006A         while(PINA.3==0)
_0x1B:
	SBIC 0x19,3
	RJMP _0x1D
; 0000 006B         {
; 0000 006C             for(i=0;i<10;i++)
	LDI  R17,LOW(0)
_0x1F:
	CPI  R17,10
	BRSH _0x20
; 0000 006D             {
; 0000 006E                 for(j=0;j<10;j++)
	LDI  R16,LOW(0)
_0x22:
	CPI  R16,10
	BRSH _0x23
; 0000 006F                 {
; 0000 0070                     for(k=0;k<10;k++)
	LDI  R19,LOW(0)
_0x25:
	CPI  R19,10
	BRSH _0x26
; 0000 0071                     {
; 0000 0072                         for(l=0;l<10;l++)
	LDI  R18,LOW(0)
_0x28:
	CPI  R18,10
	BRSH _0x29
; 0000 0073                         {
; 0000 0074                             for(m=0;m<25;m++)
	LDI  R21,LOW(0)
_0x2B:
	CPI  R21,25
	BRSH _0x2C
; 0000 0075                             {
; 0000 0076                                 PORTC=0b00001110;
	LDI  R30,LOW(14)
	OUT  0x15,R30
; 0000 0077                                 PORTD=num[9-i];
	MOV  R30,R17
	RCALL SUBOPT_0x3
; 0000 0078                                 delay_ms(10);
; 0000 0079                                 PORTC=0b00001101;
	LDI  R30,LOW(13)
	OUT  0x15,R30
; 0000 007A                                 PORTD=num[9-j];
	MOV  R30,R16
	RCALL SUBOPT_0x3
; 0000 007B                                 delay_ms(10);
; 0000 007C                                 PORTC=0b00001011;
	LDI  R30,LOW(11)
	OUT  0x15,R30
; 0000 007D                                 PORTD=num[9-k];
	MOV  R30,R19
	RCALL SUBOPT_0x3
; 0000 007E                                 delay_ms(10);
; 0000 007F                                 PORTC=0b00000111;
	LDI  R30,LOW(7)
	OUT  0x15,R30
; 0000 0080                                 PORTD=num[9-l];
	MOV  R30,R18
	RCALL SUBOPT_0x3
; 0000 0081                                 delay_ms(10);
; 0000 0082                             }
	SUBI R21,-1
	RJMP _0x2B
_0x2C:
; 0000 0083                             if(PINA.3==1)
	SBIC 0x19,3
; 0000 0084                             {
; 0000 0085                                 break;
	RJMP _0x29
; 0000 0086                             }
; 0000 0087                         }
	SUBI R18,-1
	RJMP _0x28
_0x29:
; 0000 0088                         if(PINA.3==1)
	SBIS 0x19,3
	RJMP _0x2E
; 0000 0089                         {
; 0000 008A                             PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 008B                             break;
	RJMP _0x26
; 0000 008C                         }
; 0000 008D 
; 0000 008E                     }
_0x2E:
	SUBI R19,-1
	RJMP _0x25
_0x26:
; 0000 008F                     if(PINA.3==1)
	SBIS 0x19,3
	RJMP _0x2F
; 0000 0090                     {
; 0000 0091                         PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0092                         break;
	RJMP _0x23
; 0000 0093                     }
; 0000 0094                 }
_0x2F:
	SUBI R16,-1
	RJMP _0x22
_0x23:
; 0000 0095                 if(PINA.3==1)
	SBIS 0x19,3
	RJMP _0x30
; 0000 0096                 {
; 0000 0097                     PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0098                     break;
	RJMP _0x20
; 0000 0099                 }
; 0000 009A             }
_0x30:
	SUBI R17,-1
	RJMP _0x1F
_0x20:
; 0000 009B         }
	RJMP _0x1B
_0x1D:
; 0000 009C                      //1273219902
; 0000 009D         while(PINA.4==0)
_0x31:
	SBIC 0x19,4
	RJMP _0x33
; 0000 009E         {
; 0000 009F             for(m=0;m<100;m++)
	LDI  R21,LOW(0)
_0x35:
	CPI  R21,100
	BRSH _0x36
; 0000 00A0                 {
; 0000 00A1                     PORTC=0b00000111;
	RCALL SUBOPT_0x4
; 0000 00A2                     PORTD=num[1];
; 0000 00A3                     delay_ms(10);
; 0000 00A4                 }
	SUBI R21,-1
	RJMP _0x35
_0x36:
; 0000 00A5             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x37
; 0000 00A6             {
; 0000 00A7                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 00A8                 break;
	RJMP _0x33
; 0000 00A9             }
; 0000 00AA             for(m=0;m<50;m++) // with try and fail
_0x37:
	LDI  R21,LOW(0)
_0x39:
	CPI  R21,50
	BRSH _0x3A
; 0000 00AB                 {
; 0000 00AC                     PORTC=0b00001011;
	RCALL SUBOPT_0x5
; 0000 00AD                     PORTD=num[1];
; 0000 00AE                     delay_ms(10);
; 0000 00AF                     PORTC=0b00000111;
	RCALL SUBOPT_0x6
; 0000 00B0                     PORTD=num[2];
; 0000 00B1                     delay_ms(10);
; 0000 00B2                 }
	SUBI R21,-1
	RJMP _0x39
_0x3A:
; 0000 00B3             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x3B
; 0000 00B4             {
; 0000 00B5                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 00B6                 break;
	RJMP _0x33
; 0000 00B7             }
; 0000 00B8             for(m=0;m<33;m++) // with try and fail
_0x3B:
	LDI  R21,LOW(0)
_0x3D:
	CPI  R21,33
	BRSH _0x3E
; 0000 00B9                 {
; 0000 00BA                     PORTC=0b00001101;
	RCALL SUBOPT_0x7
; 0000 00BB                     PORTD=num[1];
; 0000 00BC                     delay_ms(10);
; 0000 00BD                     PORTC=0b00001011;
	RCALL SUBOPT_0x8
; 0000 00BE                     PORTD=num[2];
; 0000 00BF                     delay_ms(10);
; 0000 00C0                     PORTC=0b00000111;
	LDI  R30,LOW(7)
	RCALL SUBOPT_0x9
; 0000 00C1                     PORTD=num[7];
; 0000 00C2                     delay_ms(10);
; 0000 00C3                 }
	SUBI R21,-1
	RJMP _0x3D
_0x3E:
; 0000 00C4             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x3F
; 0000 00C5             {
; 0000 00C6                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 00C7                 break;
	RJMP _0x33
; 0000 00C8             }
; 0000 00C9             for(m=0;m<25;m++) // with try and fail
_0x3F:
	LDI  R21,LOW(0)
_0x41:
	CPI  R21,25
	BRSH _0x42
; 0000 00CA                 {
; 0000 00CB                     PORTC=0b00001110;
	RCALL SUBOPT_0xA
; 0000 00CC                     PORTD=num[1];
; 0000 00CD                     delay_ms(10);
; 0000 00CE                     PORTC=0b00001101;
	RCALL SUBOPT_0xB
; 0000 00CF                     PORTD=num[2];
; 0000 00D0                     delay_ms(10);
; 0000 00D1                     PORTC=0b00001011;
	LDI  R30,LOW(11)
	RCALL SUBOPT_0x9
; 0000 00D2                     PORTD=num[7];
; 0000 00D3                     delay_ms(10);
; 0000 00D4                     PORTC=0b00000111;
	LDI  R30,LOW(7)
	RCALL SUBOPT_0xC
; 0000 00D5                     PORTD=num[3];
; 0000 00D6                     delay_ms(10);
; 0000 00D7                 }
	SUBI R21,-1
	RJMP _0x41
_0x42:
; 0000 00D8             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x43
; 0000 00D9             {
; 0000 00DA                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 00DB                 break;
	RJMP _0x33
; 0000 00DC             }
; 0000 00DD             for(m=0;m<25;m++) // with try and fail
_0x43:
	LDI  R21,LOW(0)
_0x45:
	CPI  R21,25
	BRSH _0x46
; 0000 00DE                 {
; 0000 00DF                     PORTC=0b00001110;
	RCALL SUBOPT_0xD
; 0000 00E0                     PORTD=num[2];
; 0000 00E1                     delay_ms(10);
; 0000 00E2                     PORTC=0b00001101;
	LDI  R30,LOW(13)
	RCALL SUBOPT_0x9
; 0000 00E3                     PORTD=num[7];
; 0000 00E4                     delay_ms(10);
; 0000 00E5                     PORTC=0b00001011;
	LDI  R30,LOW(11)
	RCALL SUBOPT_0xC
; 0000 00E6                     PORTD=num[3];
; 0000 00E7                     delay_ms(10);
; 0000 00E8                     PORTC=0b00000111;
	RCALL SUBOPT_0x6
; 0000 00E9                     PORTD=num[2];
; 0000 00EA                     delay_ms(10);
; 0000 00EB                 }
	SUBI R21,-1
	RJMP _0x45
_0x46:
; 0000 00EC             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x47
; 0000 00ED             {
; 0000 00EE                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 00EF                 break;
	RJMP _0x33
; 0000 00F0             }
; 0000 00F1             for(m=0;m<25;m++) // with try and fail
_0x47:
	LDI  R21,LOW(0)
_0x49:
	CPI  R21,25
	BRSH _0x4A
; 0000 00F2                 {
; 0000 00F3                     PORTC=0b00001110;
	LDI  R30,LOW(14)
	RCALL SUBOPT_0x9
; 0000 00F4                     PORTD=num[7];
; 0000 00F5                     delay_ms(10);
; 0000 00F6                     PORTC=0b00001101;
	LDI  R30,LOW(13)
	RCALL SUBOPT_0xC
; 0000 00F7                     PORTD=num[3];
; 0000 00F8                     delay_ms(10);
; 0000 00F9                     PORTC=0b00001011;
	RCALL SUBOPT_0x8
; 0000 00FA                     PORTD=num[2];
; 0000 00FB                     delay_ms(10);
; 0000 00FC                     PORTC=0b00000111;
	RCALL SUBOPT_0x4
; 0000 00FD                     PORTD=num[1];
; 0000 00FE                     delay_ms(10);
; 0000 00FF                 }
	SUBI R21,-1
	RJMP _0x49
_0x4A:
; 0000 0100             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x4B
; 0000 0101             {
; 0000 0102                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0103                 break;
	RJMP _0x33
; 0000 0104             }
; 0000 0105             for(m=0;m<25;m++) // with try and fail
_0x4B:
	LDI  R21,LOW(0)
_0x4D:
	CPI  R21,25
	BRSH _0x4E
; 0000 0106                 {
; 0000 0107                     PORTC=0b00001110;
	LDI  R30,LOW(14)
	RCALL SUBOPT_0xC
; 0000 0108                     PORTD=num[3];
; 0000 0109                     delay_ms(10);
; 0000 010A                     PORTC=0b00001101;
	RCALL SUBOPT_0xB
; 0000 010B                     PORTD=num[2];
; 0000 010C                     delay_ms(10);
; 0000 010D                     PORTC=0b00001011;
	RCALL SUBOPT_0x5
; 0000 010E                     PORTD=num[1];
; 0000 010F                     delay_ms(10);
; 0000 0110                     PORTC=0b00000111;
	RCALL SUBOPT_0xE
; 0000 0111                     PORTD=num[9];
; 0000 0112                     delay_ms(10);
; 0000 0113                 }
	SUBI R21,-1
	RJMP _0x4D
_0x4E:
; 0000 0114             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x4F
; 0000 0115             {
; 0000 0116                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0117                 break;
	RJMP _0x33
; 0000 0118             }
; 0000 0119             for(m=0;m<25;m++) // with try and fail
_0x4F:
	LDI  R21,LOW(0)
_0x51:
	CPI  R21,25
	BRSH _0x52
; 0000 011A                 {
; 0000 011B                     PORTC=0b00001110;
	RCALL SUBOPT_0xD
; 0000 011C                     PORTD=num[2];
; 0000 011D                     delay_ms(10);
; 0000 011E                     PORTC=0b00001101;
	RCALL SUBOPT_0x7
; 0000 011F                     PORTD=num[1];
; 0000 0120                     delay_ms(10);
; 0000 0121                     PORTC=0b00001011;
	RCALL SUBOPT_0xF
; 0000 0122                     PORTD=num[9];
; 0000 0123                     delay_ms(10);
; 0000 0124                     PORTC=0b00000111;
	RCALL SUBOPT_0xE
; 0000 0125                     PORTD=num[9];
; 0000 0126                     delay_ms(10);
; 0000 0127                 }
	SUBI R21,-1
	RJMP _0x51
_0x52:
; 0000 0128             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x53
; 0000 0129             {
; 0000 012A                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 012B                 break;
	RJMP _0x33
; 0000 012C             }
; 0000 012D             for(m=0;m<25;m++) // with try and fail
_0x53:
	LDI  R21,LOW(0)
_0x55:
	CPI  R21,25
	BRSH _0x56
; 0000 012E                 {
; 0000 012F                     PORTC=0b00001110;
	RCALL SUBOPT_0xA
; 0000 0130                     PORTD=num[1];
; 0000 0131                     delay_ms(10);
; 0000 0132                     PORTC=0b00001101;
	RCALL SUBOPT_0x10
; 0000 0133                     PORTD=num[9];
; 0000 0134                     delay_ms(10);
; 0000 0135                     PORTC=0b00001011;
	RCALL SUBOPT_0xF
; 0000 0136                     PORTD=num[9];
; 0000 0137                     delay_ms(10);
; 0000 0138                     PORTC=0b00000111;
	LDI  R30,LOW(7)
	RCALL SUBOPT_0x11
; 0000 0139                     PORTD=num[0];
; 0000 013A                     delay_ms(10);
; 0000 013B                 }
	SUBI R21,-1
	RJMP _0x55
_0x56:
; 0000 013C             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x57
; 0000 013D             {
; 0000 013E                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 013F                 break;
	RJMP _0x33
; 0000 0140             }
; 0000 0141             for(m=0;m<25;m++) // with try and fail
_0x57:
	LDI  R21,LOW(0)
_0x59:
	CPI  R21,25
	BRSH _0x5A
; 0000 0142                 {
; 0000 0143                     PORTC=0b00001110;
	RCALL SUBOPT_0x12
; 0000 0144                     PORTD=num[9];
; 0000 0145                     delay_ms(10);
; 0000 0146                     PORTC=0b00001101;
	RCALL SUBOPT_0x10
; 0000 0147                     PORTD=num[9];
; 0000 0148                     delay_ms(10);
; 0000 0149                     PORTC=0b00001011;
	LDI  R30,LOW(11)
	RCALL SUBOPT_0x11
; 0000 014A                     PORTD=num[0];
; 0000 014B                     delay_ms(10);
; 0000 014C                     PORTC=0b00000111;
	RCALL SUBOPT_0x6
; 0000 014D                     PORTD=num[2];
; 0000 014E                     delay_ms(10);
; 0000 014F                 }
	SUBI R21,-1
	RJMP _0x59
_0x5A:
; 0000 0150             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x5B
; 0000 0151             {
; 0000 0152                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0153                 break;
	RJMP _0x33
; 0000 0154             }
; 0000 0155 
; 0000 0156             //Part 3.2 Exit 9902
; 0000 0157             for(m=0;m<25;m++) // with try and fail
_0x5B:
	LDI  R21,LOW(0)
_0x5D:
	CPI  R21,25
	BRSH _0x5E
; 0000 0158                 {
; 0000 0159                     PORTC=0b00001110;
	RCALL SUBOPT_0x12
; 0000 015A                     PORTD=num[9];
; 0000 015B                     delay_ms(10);
; 0000 015C                     PORTC=0b00001101;
	LDI  R30,LOW(13)
	RCALL SUBOPT_0x11
; 0000 015D                     PORTD=num[0];
; 0000 015E                     delay_ms(10);
; 0000 015F                     PORTC=0b00001011;
	RCALL SUBOPT_0x8
; 0000 0160                     PORTD=num[2];
; 0000 0161                     delay_ms(10);
; 0000 0162                 }
	SUBI R21,-1
	RJMP _0x5D
_0x5E:
; 0000 0163             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x5F
; 0000 0164             {
; 0000 0165                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0166                 break;
	RJMP _0x33
; 0000 0167             }
; 0000 0168             for(m=0;m<33;m++) // with try and fail
_0x5F:
	LDI  R21,LOW(0)
_0x61:
	CPI  R21,33
	BRSH _0x62
; 0000 0169                 {
; 0000 016A                     PORTC=0b00001110;
	LDI  R30,LOW(14)
	RCALL SUBOPT_0x11
; 0000 016B                     PORTD=num[0];
; 0000 016C                     delay_ms(10);
; 0000 016D                     PORTC=0b00001101;
	RCALL SUBOPT_0xB
; 0000 016E                     PORTD=num[2];
; 0000 016F                     delay_ms(10);
; 0000 0170                 }
	SUBI R21,-1
	RJMP _0x61
_0x62:
; 0000 0171             if(PINA.4==1)
	SBIS 0x19,4
	RJMP _0x63
; 0000 0172             {
; 0000 0173                 PORTC=0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0174                 break;
	RJMP _0x33
; 0000 0175             }
; 0000 0176             for(m=0;m<50;m++) // with try and fail
_0x63:
	LDI  R21,LOW(0)
_0x65:
	CPI  R21,50
	BRSH _0x66
; 0000 0177                 {
; 0000 0178                     PORTC=0b00001110;
	RCALL SUBOPT_0xD
; 0000 0179                     PORTD=num[2];
; 0000 017A                     delay_ms(10);
; 0000 017B                 }
	SUBI R21,-1
	RJMP _0x65
_0x66:
; 0000 017C             if(PINA.4==1)
	SBIC 0x19,4
; 0000 017D             {
; 0000 017E                 break;
	RJMP _0x33
; 0000 017F             }
; 0000 0180             for(m=0;m<100;m++)
	LDI  R21,LOW(0)
_0x69:
	CPI  R21,100
	BRSH _0x6A
; 0000 0181                 {
; 0000 0182                     PORTC=0b00001111;
	LDI  R30,LOW(15)
	OUT  0x15,R30
; 0000 0183                     delay_ms(10);
	LDI  R26,LOW(10)
	LDI  R27,0
	CALL _delay_ms
; 0000 0184                 }
	SUBI R21,-1
	RJMP _0x69
_0x6A:
; 0000 0185             if(PINA.4==1)
	SBIC 0x19,4
; 0000 0186             {
; 0000 0187                 break;
	RJMP _0x33
; 0000 0188             }
; 0000 0189         }
	RJMP _0x31
_0x33:
; 0000 018A     }
	RJMP _0x3
; 0000 018B 
; 0000 018C }
_0x6C:
	RJMP _0x6C
; .FEND

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0x0:
	LDI  R31,0
	SUBI R30,LOW(-_num*2)
	SBCI R31,HIGH(-_num*2)
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(10)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x1:
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(1)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 46 TIMES, CODE SIZE REDUCTION:177 WORDS
SUBOPT_0x2:
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(10)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:24 WORDS
SUBOPT_0x3:
	LDI  R31,0
	LDI  R26,LOW(9)
	LDI  R27,HIGH(9)
	CALL __SWAPW12
	SUB  R30,R26
	SBC  R31,R27
	SUBI R30,LOW(-_num*2)
	SBCI R31,HIGH(-_num*2)
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x4:
	LDI  R30,LOW(7)
	OUT  0x15,R30
	__POINTW1FN _num,1
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x5:
	LDI  R30,LOW(11)
	OUT  0x15,R30
	__POINTW1FN _num,1
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x6:
	LDI  R30,LOW(7)
	OUT  0x15,R30
	__POINTW1FN _num,2
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x7:
	LDI  R30,LOW(13)
	OUT  0x15,R30
	__POINTW1FN _num,1
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x8:
	LDI  R30,LOW(11)
	OUT  0x15,R30
	__POINTW1FN _num,2
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x9:
	OUT  0x15,R30
	__POINTW1FN _num,7
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xA:
	LDI  R30,LOW(14)
	OUT  0x15,R30
	__POINTW1FN _num,1
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0xB:
	LDI  R30,LOW(13)
	OUT  0x15,R30
	__POINTW1FN _num,2
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0xC:
	OUT  0x15,R30
	__POINTW1FN _num,3
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0xD:
	LDI  R30,LOW(14)
	OUT  0x15,R30
	__POINTW1FN _num,2
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xE:
	LDI  R30,LOW(7)
	OUT  0x15,R30
	__POINTW1FN _num,9
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xF:
	LDI  R30,LOW(11)
	OUT  0x15,R30
	__POINTW1FN _num,9
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x10:
	LDI  R30,LOW(13)
	OUT  0x15,R30
	__POINTW1FN _num,9
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x11:
	OUT  0x15,R30
	LDI  R30,LOW(_num*2)
	LDI  R31,HIGH(_num*2)
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x12:
	LDI  R30,LOW(14)
	OUT  0x15,R30
	__POINTW1FN _num,9
	RJMP SUBOPT_0x2


	.CSEG
_delay_ms:
	adiw r26,0
	breq __delay_ms1
__delay_ms0:
	__DELAY_USW 0x7D0
	wdr
	sbiw r26,1
	brne __delay_ms0
__delay_ms1:
	ret

__SWAPW12:
	MOV  R1,R27
	MOV  R27,R31
	MOV  R31,R1

__SWAPB12:
	MOV  R1,R26
	MOV  R26,R30
	MOV  R30,R1
	RET

;END OF CODE MARKER
__END_OF_CODE:
