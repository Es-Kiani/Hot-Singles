
;CodeVisionAVR C Compiler V3.14 Advanced
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

_DIGIT:
	.DB  0x3F,0x6,0x5B,0x4F,0x66,0x6D,0x7D,0x7
	.DB  0x7F,0x6F
_SEG7_DNo:
	.DB  0x0,0xE,0xD,0xB,0x7

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
; * Project-02.c
; *
; * Created: 2023-12-20 11:28:01 PM
; * Author: Esfandiar Kiani
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
;
;flash unsigned char
;    // 7Seg Codes for 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
;    DIGIT[10] = {0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110, 0b01101101,
;                 0b01111101, 0b00000111, 0b01111111, 0b01101111};
;
;flash unsigned char
;    SEG7_DNo[5] = {0X00, 0b00001110, 0b00001101, 0b00001011, 0b00000111};
;
;void main(void)
; 0000 0014 {

	.CSEG
_main:
; .FSTART _main
; 0000 0015     char MSD = 0, LSD = 0;
; 0000 0016 
; 0000 0017     DDRA = 0X00, PORTA = 0Xff;
;	MSD -> R17
;	LSD -> R16
	LDI  R17,0
	LDI  R16,0
	LDI  R30,LOW(0)
	OUT  0x1A,R30
	LDI  R30,LOW(255)
	OUT  0x1B,R30
; 0000 0018     DDRC = 0Xff, PORTC = 0X00;
	OUT  0x14,R30
	LDI  R30,LOW(0)
	OUT  0x15,R30
; 0000 0019     DDRD = 0Xff, PORTD = 0X00;
	LDI  R30,LOW(255)
	OUT  0x11,R30
	LDI  R30,LOW(0)
	OUT  0x12,R30
; 0000 001A 
; 0000 001B     while (1)
_0x3:
; 0000 001C     {
; 0000 001D         PORTC = 0Xff;
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 001E 
; 0000 001F         //*     Manual Counter      -   Done
; 0000 0020         while (PINA .0 == 0)
_0x6:
	SBIC 0x19,0
	RJMP _0x8
; 0000 0021         {
; 0000 0022             PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 0023             PORTD = DIGIT[MSD];
	MOV  R30,R17
	RCALL SUBOPT_0x1
; 0000 0024             delay_ms(1);
; 0000 0025 
; 0000 0026             PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 0027             PORTD = DIGIT[LSD];
	MOV  R30,R16
	RCALL SUBOPT_0x1
; 0000 0028             delay_ms(1);
; 0000 0029 
; 0000 002A             if (PINA .6 == 0)
	SBIC 0x19,6
	RJMP _0x9
; 0000 002B             {
; 0000 002C                 if (LSD == 9)
	CPI  R16,9
	BRNE _0xA
; 0000 002D                 {
; 0000 002E                     LSD = 0;
	LDI  R16,LOW(0)
; 0000 002F                     if (MSD == 9)
	CPI  R17,9
	BRNE _0xB
; 0000 0030                         MSD = 0;
	LDI  R17,LOW(0)
; 0000 0031                     else
	RJMP _0xC
_0xB:
; 0000 0032                         MSD++;
	SUBI R17,-1
; 0000 0033                 }
_0xC:
; 0000 0034                 else
	RJMP _0xD
_0xA:
; 0000 0035                     LSD++;
	SUBI R16,-1
; 0000 0036                 delay_ms(200);
_0xD:
	RJMP _0x66
; 0000 0037             }
; 0000 0038             else if (PINA .7 == 0)
_0x9:
	SBIC 0x19,7
	RJMP _0xF
; 0000 0039             {
; 0000 003A                 if (LSD == 0)
	CPI  R16,0
	BRNE _0x10
; 0000 003B                 {
; 0000 003C                     LSD = 9;
	LDI  R16,LOW(9)
; 0000 003D                     if (MSD == 0)
	CPI  R17,0
	BRNE _0x11
; 0000 003E                         MSD = 9;
	LDI  R17,LOW(9)
; 0000 003F                     else
	RJMP _0x12
_0x11:
; 0000 0040                         MSD--;
	SUBI R17,1
; 0000 0041                 }
_0x12:
; 0000 0042                 else
	RJMP _0x13
_0x10:
; 0000 0043                     LSD--;
	SUBI R16,1
; 0000 0044                 delay_ms(200);
_0x13:
_0x66:
	LDI  R26,LOW(200)
	LDI  R27,0
	CALL _delay_ms
; 0000 0045             }
; 0000 0046         }
_0xF:
	RJMP _0x6
_0x8:
; 0000 0047 
; 0000 0048         //*     FAIL                -   Done
; 0000 0049         while (PINA .1 == 0)
_0x14:
	SBIC 0x19,1
	RJMP _0x16
; 0000 004A         {
; 0000 004B             PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 004C             PORTD = 0b01110001; // F
	LDI  R30,LOW(113)
	RCALL SUBOPT_0x4
; 0000 004D             delay_ms(2);
; 0000 004E 
; 0000 004F             PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 0050             PORTD = 0b01110111; // A
	LDI  R30,LOW(119)
	RCALL SUBOPT_0x4
; 0000 0051             delay_ms(2);
; 0000 0052 
; 0000 0053             PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 0054             PORTD = 0b00110000; // I
	LDI  R30,LOW(48)
	RCALL SUBOPT_0x4
; 0000 0055             delay_ms(2);
; 0000 0056 
; 0000 0057             PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 0058             PORTD = 0b00111000; // L
	LDI  R30,LOW(56)
	RCALL SUBOPT_0x4
; 0000 0059             delay_ms(2);
; 0000 005A         }
	RJMP _0x14
_0x16:
; 0000 005B 
; 0000 005C         //*     Automatic Counter   -   Done
; 0000 005D         while (PINA .2 == 0)
_0x17:
	SBIC 0x19,2
	RJMP _0x19
; 0000 005E         {
; 0000 005F             int Kilo, Hundred, Ten, One, Show;
; 0000 0060 
; 0000 0061             for (Kilo = 9; Kilo >= 0; Kilo--)
	SBIW R28,10
;	Kilo -> Y+8
;	Hundred -> Y+6
;	Ten -> Y+4
;	One -> Y+2
;	Show -> Y+0
	LDI  R30,LOW(9)
	LDI  R31,HIGH(9)
	STD  Y+8,R30
	STD  Y+8+1,R31
_0x1B:
	LDD  R26,Y+9
	TST  R26
	BRPL PC+2
	RJMP _0x1C
; 0000 0062             {
; 0000 0063                 for (Hundred = 9; Hundred >= 0; Hundred--)
	LDI  R30,LOW(9)
	LDI  R31,HIGH(9)
	STD  Y+6,R30
	STD  Y+6+1,R31
_0x1E:
	LDD  R26,Y+7
	TST  R26
	BRPL PC+2
	RJMP _0x1F
; 0000 0064                 {
; 0000 0065                     for (Ten = 9; Ten >= 0; Ten--)
	LDI  R30,LOW(9)
	LDI  R31,HIGH(9)
	STD  Y+4,R30
	STD  Y+4+1,R31
_0x21:
	LDD  R26,Y+5
	TST  R26
	BRMI _0x22
; 0000 0066                     {
; 0000 0067                         for (One = 9; One >= 0; One--)
	LDI  R30,LOW(9)
	LDI  R31,HIGH(9)
	STD  Y+2,R30
	STD  Y+2+1,R31
_0x24:
	LDD  R26,Y+3
	TST  R26
	BRMI _0x25
; 0000 0068                         {
; 0000 0069                             for (Show = 0; Show < 15; Show++)
	LDI  R30,LOW(0)
	STD  Y+0,R30
	STD  Y+0+1,R30
_0x27:
	LD   R26,Y
	LDD  R27,Y+1
	SBIW R26,15
	BRGE _0x28
; 0000 006A                             {
; 0000 006B                                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 006C                                 PORTD = DIGIT[Kilo];
	LDD  R30,Y+8
	LDD  R31,Y+8+1
	RCALL SUBOPT_0x6
; 0000 006D                                 delay_ms(3);
; 0000 006E 
; 0000 006F                                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 0070                                 PORTD = DIGIT[Hundred];
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	RCALL SUBOPT_0x6
; 0000 0071                                 delay_ms(3);
; 0000 0072 
; 0000 0073                                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 0074                                 PORTD = DIGIT[Ten];
	LDD  R30,Y+4
	LDD  R31,Y+4+1
	RCALL SUBOPT_0x6
; 0000 0075                                 delay_ms(3);
; 0000 0076 
; 0000 0077                                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 0078                                 PORTD = DIGIT[One];
	LDD  R30,Y+2
	LDD  R31,Y+2+1
	RCALL SUBOPT_0x6
; 0000 0079                                 delay_ms(3);
; 0000 007A 
; 0000 007B                                 if (PINA.2)
	SBIC 0x19,2
; 0000 007C                                     break;
	RJMP _0x28
; 0000 007D                             }
	LD   R30,Y
	LDD  R31,Y+1
	ADIW R30,1
	ST   Y,R30
	STD  Y+1,R31
	RJMP _0x27
_0x28:
; 0000 007E                             if (PINA.2)
	SBIC 0x19,2
; 0000 007F                                 break;
	RJMP _0x25
; 0000 0080                         }
	LDD  R30,Y+2
	LDD  R31,Y+2+1
	SBIW R30,1
	STD  Y+2,R30
	STD  Y+2+1,R31
	RJMP _0x24
_0x25:
; 0000 0081                         if (PINA.2)
	SBIC 0x19,2
; 0000 0082                             break;
	RJMP _0x22
; 0000 0083                     }
	LDD  R30,Y+4
	LDD  R31,Y+4+1
	SBIW R30,1
	STD  Y+4,R30
	STD  Y+4+1,R31
	RJMP _0x21
_0x22:
; 0000 0084                     if (PINA.2)
	SBIC 0x19,2
; 0000 0085                         break;
	RJMP _0x1F
; 0000 0086                 }
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	SBIW R30,1
	STD  Y+6,R30
	STD  Y+6+1,R31
	RJMP _0x1E
_0x1F:
; 0000 0087                 if (PINA.2)
	SBIC 0x19,2
; 0000 0088                     break;
	RJMP _0x1C
; 0000 0089             }
	LDD  R30,Y+8
	LDD  R31,Y+8+1
	SBIW R30,1
	STD  Y+8,R30
	STD  Y+8+1,R31
	RJMP _0x1B
_0x1C:
; 0000 008A         }
	ADIW R28,10
	RJMP _0x17
_0x19:
; 0000 008B 
; 0000 008C         //*     SSN                 -   Done
; 0000 008D         while (PINA .3 == 0)
_0x2E:
	SBIC 0x19,3
	RJMP _0x30
; 0000 008E         {
; 0000 008F             char i;
; 0000 0090 
; 0000 0091             for (i = 0; i < 55; i++)
	SBIW R28,1
;	i -> Y+0
	LDI  R30,LOW(0)
	ST   Y,R30
_0x32:
	LD   R26,Y
	CPI  R26,LOW(0x37)
	BRSH _0x33
; 0000 0092             {
; 0000 0093                 if (PINA .3)
	SBIC 0x19,3
; 0000 0094                     break;
	RJMP _0x33
; 0000 0095                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 0096                 PORTD = DIGIT[1];
	RCALL SUBOPT_0x7
; 0000 0097                 delay_ms(4);
; 0000 0098             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x32
_0x33:
; 0000 0099 
; 0000 009A             for (i = 0; i < 50; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x36:
	LD   R26,Y
	CPI  R26,LOW(0x32)
	BRSH _0x37
; 0000 009B             {
; 0000 009C                 if (PINA .3)
	SBIC 0x19,3
; 0000 009D                     break;
	RJMP _0x37
; 0000 009E                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 009F                 PORTD = DIGIT[1];
	RCALL SUBOPT_0x7
; 0000 00A0                 delay_ms(4);
; 0000 00A1 
; 0000 00A2                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 00A3                 PORTD = DIGIT[2];
	RCALL SUBOPT_0x8
; 0000 00A4                 delay_ms(4);
; 0000 00A5             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x36
_0x37:
; 0000 00A6 
; 0000 00A7             for (i = 0; i < 45; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x3A:
	LD   R26,Y
	CPI  R26,LOW(0x2D)
	BRSH _0x3B
; 0000 00A8             {
; 0000 00A9                 if (PINA .3)
	SBIC 0x19,3
; 0000 00AA                     break;
	RJMP _0x3B
; 0000 00AB                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 00AC                 PORTD = DIGIT[1];
	RCALL SUBOPT_0x7
; 0000 00AD                 delay_ms(4);
; 0000 00AE 
; 0000 00AF                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 00B0                 PORTD = DIGIT[2];
	RCALL SUBOPT_0x8
; 0000 00B1                 delay_ms(4);
; 0000 00B2 
; 0000 00B3                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 00B4                 PORTD = DIGIT[7];
	RCALL SUBOPT_0x9
; 0000 00B5                 delay_ms(4);
; 0000 00B6             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x3A
_0x3B:
; 0000 00B7 
; 0000 00B8             for (i = 0; i < 40; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x3E:
	LD   R26,Y
	CPI  R26,LOW(0x28)
	BRSH _0x3F
; 0000 00B9             {
; 0000 00BA                 if (PINA .3)
	SBIC 0x19,3
; 0000 00BB                     break;
	RJMP _0x3F
; 0000 00BC                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 00BD                 PORTD = DIGIT[1];
	RCALL SUBOPT_0x7
; 0000 00BE                 delay_ms(4);
; 0000 00BF 
; 0000 00C0                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 00C1                 PORTD = DIGIT[2];
	RCALL SUBOPT_0x8
; 0000 00C2                 delay_ms(4);
; 0000 00C3 
; 0000 00C4                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 00C5                 PORTD = DIGIT[7];
	RCALL SUBOPT_0x9
; 0000 00C6                 delay_ms(4);
; 0000 00C7 
; 0000 00C8                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 00C9                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 00CA                 delay_ms(4);
; 0000 00CB             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x3E
_0x3F:
; 0000 00CC 
; 0000 00CD             for (i = 0; i < 40; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x42:
	LD   R26,Y
	CPI  R26,LOW(0x28)
	BRSH _0x43
; 0000 00CE             {
; 0000 00CF                 if (PINA .3)
	SBIC 0x19,3
; 0000 00D0                     break;
	RJMP _0x43
; 0000 00D1                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 00D2                 PORTD = DIGIT[2];
	RCALL SUBOPT_0x8
; 0000 00D3                 delay_ms(4);
; 0000 00D4 
; 0000 00D5                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 00D6                 PORTD = DIGIT[7];
	RCALL SUBOPT_0x9
; 0000 00D7                 delay_ms(4);
; 0000 00D8 
; 0000 00D9                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 00DA                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 00DB                 delay_ms(4);
; 0000 00DC 
; 0000 00DD                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 00DE                 PORTD = DIGIT[6];
	RCALL SUBOPT_0xB
; 0000 00DF                 delay_ms(4);
; 0000 00E0             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x42
_0x43:
; 0000 00E1 
; 0000 00E2             for (i = 0; i < 40; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x46:
	LD   R26,Y
	CPI  R26,LOW(0x28)
	BRSH _0x47
; 0000 00E3             {
; 0000 00E4                 if (PINA .3)
	SBIC 0x19,3
; 0000 00E5                     break;
	RJMP _0x47
; 0000 00E6                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 00E7                 PORTD = DIGIT[7];
	RCALL SUBOPT_0x9
; 0000 00E8                 delay_ms(4);
; 0000 00E9 
; 0000 00EA                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 00EB                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 00EC                 delay_ms(4);
; 0000 00ED 
; 0000 00EE                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 00EF                 PORTD = DIGIT[6];
	RCALL SUBOPT_0xB
; 0000 00F0                 delay_ms(4);
; 0000 00F1 
; 0000 00F2                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 00F3                 PORTD = DIGIT[8];
	RCALL SUBOPT_0xC
; 0000 00F4                 delay_ms(4);
; 0000 00F5             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x46
_0x47:
; 0000 00F6 
; 0000 00F7             for (i = 0; i < 40; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x4A:
	LD   R26,Y
	CPI  R26,LOW(0x28)
	BRSH _0x4B
; 0000 00F8             {
; 0000 00F9                 if (PINA .3)
	SBIC 0x19,3
; 0000 00FA                     break;
	RJMP _0x4B
; 0000 00FB                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 00FC                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 00FD                 delay_ms(4);
; 0000 00FE 
; 0000 00FF                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 0100                 PORTD = DIGIT[6];
	RCALL SUBOPT_0xB
; 0000 0101                 delay_ms(4);
; 0000 0102 
; 0000 0103                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 0104                 PORTD = DIGIT[8];
	RCALL SUBOPT_0xC
; 0000 0105                 delay_ms(4);
; 0000 0106 
; 0000 0107                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 0108                 PORTD = DIGIT[4];
	RCALL SUBOPT_0xD
; 0000 0109                 delay_ms(4);
; 0000 010A             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x4A
_0x4B:
; 0000 010B 
; 0000 010C             for (i = 0; i < 40; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x4E:
	LD   R26,Y
	CPI  R26,LOW(0x28)
	BRSH _0x4F
; 0000 010D             {
; 0000 010E                 if (PINA .3)
	SBIC 0x19,3
; 0000 010F                     break;
	RJMP _0x4F
; 0000 0110                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 0111                 PORTD = DIGIT[6];
	RCALL SUBOPT_0xB
; 0000 0112                 delay_ms(4);
; 0000 0113 
; 0000 0114                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 0115                 PORTD = DIGIT[8];
	RCALL SUBOPT_0xC
; 0000 0116                 delay_ms(4);
; 0000 0117 
; 0000 0118                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 0119                 PORTD = DIGIT[4];
	RCALL SUBOPT_0xD
; 0000 011A                 delay_ms(4);
; 0000 011B 
; 0000 011C                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 011D                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 011E                 delay_ms(4);
; 0000 011F             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x4E
_0x4F:
; 0000 0120 
; 0000 0121             for (i = 0; i < 40; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x52:
	LD   R26,Y
	CPI  R26,LOW(0x28)
	BRSH _0x53
; 0000 0122             {
; 0000 0123                 if (PINA .3)
	SBIC 0x19,3
; 0000 0124                     break;
	RJMP _0x53
; 0000 0125                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 0126                 PORTD = DIGIT[8];
	RCALL SUBOPT_0xC
; 0000 0127                 delay_ms(4);
; 0000 0128 
; 0000 0129                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 012A                 PORTD = DIGIT[4];
	RCALL SUBOPT_0xD
; 0000 012B                 delay_ms(4);
; 0000 012C 
; 0000 012D                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 012E                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 012F                 delay_ms(4);
; 0000 0130 
; 0000 0131                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 0132                 PORTD = DIGIT[0];
	RCALL SUBOPT_0xE
; 0000 0133                 delay_ms(4);
; 0000 0134             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x52
_0x53:
; 0000 0135 
; 0000 0136             for (i = 0; i < 40; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x56:
	LD   R26,Y
	CPI  R26,LOW(0x28)
	BRSH _0x57
; 0000 0137             {
; 0000 0138                 if (PINA .3)
	SBIC 0x19,3
; 0000 0139                     break;
	RJMP _0x57
; 0000 013A                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 013B                 PORTD = DIGIT[4];
	RCALL SUBOPT_0xD
; 0000 013C                 delay_ms(4);
; 0000 013D 
; 0000 013E                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 013F                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 0140                 delay_ms(4);
; 0000 0141 
; 0000 0142                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 0143                 PORTD = DIGIT[0];
	RCALL SUBOPT_0xE
; 0000 0144                 delay_ms(4);
; 0000 0145 
; 0000 0146                 PORTC = SEG7_DNo[4];
	RCALL SUBOPT_0x5
; 0000 0147                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 0148                 delay_ms(4);
; 0000 0149             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x56
_0x57:
; 0000 014A 
; 0000 014B             for (i = 0; i < 45; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x5A:
	LD   R26,Y
	CPI  R26,LOW(0x2D)
	BRSH _0x5B
; 0000 014C             {
; 0000 014D                 if (PINA .3)
	SBIC 0x19,3
; 0000 014E                     break;
	RJMP _0x5B
; 0000 014F                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 0150                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 0151                 delay_ms(4);
; 0000 0152 
; 0000 0153                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 0154                 PORTD = DIGIT[0];
	RCALL SUBOPT_0xE
; 0000 0155                 delay_ms(4);
; 0000 0156 
; 0000 0157                 PORTC = SEG7_DNo[3];
	RCALL SUBOPT_0x2
; 0000 0158                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 0159                 delay_ms(4);
; 0000 015A             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x5A
_0x5B:
; 0000 015B 
; 0000 015C             for (i = 0; i < 50; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x5E:
	LD   R26,Y
	CPI  R26,LOW(0x32)
	BRSH _0x5F
; 0000 015D             {
; 0000 015E                 if (PINA .3)
	SBIC 0x19,3
; 0000 015F                     break;
	RJMP _0x5F
; 0000 0160                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 0161                 PORTD = DIGIT[0];
	RCALL SUBOPT_0xE
; 0000 0162                 delay_ms(4);
; 0000 0163 
; 0000 0164                 PORTC = SEG7_DNo[2];
	RCALL SUBOPT_0x0
; 0000 0165                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 0166                 delay_ms(4);
; 0000 0167             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x5E
_0x5F:
; 0000 0168 
; 0000 0169             for (i = 0; i < 55; i++)
	LDI  R30,LOW(0)
	ST   Y,R30
_0x62:
	LD   R26,Y
	CPI  R26,LOW(0x37)
	BRSH _0x63
; 0000 016A             {
; 0000 016B                 if (PINA .3)
	SBIC 0x19,3
; 0000 016C                     break;
	RJMP _0x63
; 0000 016D                 PORTC = SEG7_DNo[1];
	RCALL SUBOPT_0x3
; 0000 016E                 PORTD = DIGIT[3];
	RCALL SUBOPT_0xA
; 0000 016F                 delay_ms(4);
; 0000 0170             }
	LD   R30,Y
	SUBI R30,-LOW(1)
	ST   Y,R30
	RJMP _0x62
_0x63:
; 0000 0171         }
	ADIW R28,1
	RJMP _0x2E
_0x30:
; 0000 0172     }
	RJMP _0x3
; 0000 0173 }
_0x65:
	RJMP _0x65
; .FEND

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 13 TIMES, CODE SIZE REDUCTION:21 WORDS
SUBOPT_0x0:
	__POINTW1FN _SEG7_DNo,2
	LPM  R0,Z
	OUT  0x15,R0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:4 WORDS
SUBOPT_0x1:
	LDI  R31,0
	SUBI R30,LOW(-_DIGIT*2)
	SBCI R31,HIGH(-_DIGIT*2)
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(1)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 13 TIMES, CODE SIZE REDUCTION:21 WORDS
SUBOPT_0x2:
	__POINTW1FN _SEG7_DNo,3
	LPM  R0,Z
	OUT  0x15,R0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 12 TIMES, CODE SIZE REDUCTION:19 WORDS
SUBOPT_0x3:
	__POINTW1FN _SEG7_DNo,1
	LPM  R0,Z
	OUT  0x15,R0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x4:
	OUT  0x12,R30
	LDI  R26,LOW(2)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 12 TIMES, CODE SIZE REDUCTION:19 WORDS
SUBOPT_0x5:
	__POINTW1FN _SEG7_DNo,4
	LPM  R0,Z
	OUT  0x15,R0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0x6:
	SUBI R30,LOW(-_DIGIT*2)
	SBCI R31,HIGH(-_DIGIT*2)
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(3)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0x7:
	__POINTW1FN _DIGIT,1
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(4)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0x8:
	__POINTW1FN _DIGIT,2
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(4)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0x9:
	__POINTW1FN _DIGIT,7
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(4)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 12 TIMES, CODE SIZE REDUCTION:63 WORDS
SUBOPT_0xA:
	__POINTW1FN _DIGIT,3
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(4)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0xB:
	__POINTW1FN _DIGIT,6
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(4)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0xC:
	__POINTW1FN _DIGIT,8
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(4)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0xD:
	__POINTW1FN _DIGIT,4
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(4)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0xE:
	LDI  R30,LOW(_DIGIT*2)
	LDI  R31,HIGH(_DIGIT*2)
	LPM  R0,Z
	OUT  0x12,R0
	LDI  R26,LOW(4)
	LDI  R27,0
	JMP  _delay_ms


	.CSEG
_delay_ms:
	adiw r26,0
	breq __delay_ms1
__delay_ms0:
	wdr
	__DELAY_USW 0x7D0
	sbiw r26,1
	brne __delay_ms0
__delay_ms1:
	ret

;END OF CODE MARKER
__END_OF_CODE:
