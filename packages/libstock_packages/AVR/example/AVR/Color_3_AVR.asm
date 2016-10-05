
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 39
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;Color_3_AVR.c,9 :: 		void main()
;Color_3_AVR.c,12 :: 		uint8_t id_buffer[6] = { 0 };
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STD        Y+8, R27
	LDI        R27, 0
	STD        Y+9, R27
	LDI        R27, 0
	STD        Y+10, R27
	LDI        R27, 0
	STD        Y+11, R27
	LDI        R27, 0
	STD        Y+12, R27
	LDI        R27, 0
	STD        Y+13, R27
;Color_3_AVR.c,13 :: 		uint8_t id_reg = 0x12;
; id_reg start address is: 18 (R18)
	LDI        R18, 18
;Color_3_AVR.c,14 :: 		uint8_t uart_text[25] = { 0 };
	LDI        R30, #lo_addr(?ICSmain_uart_text_L0+0)
	LDI        R31, hi_addr(?ICSmain_uart_text_L0+0)
	MOVW       R26, R28
	ADIW       R26, 14
	LDI        R24, 25
	LDI        R25, 0
	CALL       ___CC2DW+0
;Color_3_AVR.c,18 :: 		system_setup();
	PUSH       R18
	CALL       _system_setup+0
;Color_3_AVR.c,21 :: 		UART1_Write_Text( "Device ID:  " );
	LDI        R27, #lo_addr(?lstr1_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
	POP        R18
;Color_3_AVR.c,22 :: 		color_3_hal_read( id_buffer, id_reg, 1 );
	MOVW       R16, R28
	SUBI       R16, 248
	SBCI       R17, 255
	LDI        R27, 1
	MOV        R5, R27
	MOV        R4, R18
; id_reg end address is: 18 (R18)
	MOVW       R2, R16
	CALL       _color_3_hal_read+0
;Color_3_AVR.c,23 :: 		IntToHex( id_buffer[0], uart_text );
	MOV        R17, R28
	MOV        R18, R29
	SUBI       R17, 242
	SBCI       R18, 255
	MOVW       R30, R28
	ADIW       R30, 8
	LD         R16, Z
	MOV        R4, R17
	MOV        R5, R18
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToHex+0
;Color_3_AVR.c,24 :: 		UART1_Write_Text( uart_text );
	MOVW       R16, R28
	SUBI       R16, 242
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,25 :: 		UART1_Write_Text( "\r\n\r\n\r\n" );
	LDI        R27, #lo_addr(?lstr2_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,26 :: 		Delay_ms(1000);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main0:
	DEC        R16
	BRNE       L_main0
	DEC        R17
	BRNE       L_main0
	DEC        R18
	BRNE       L_main0
;Color_3_AVR.c,28 :: 		while(1)
L_main2:
;Color_3_AVR.c,30 :: 		color_3_get_rgb_data( &my_color );
	MOVW       R16, R28
	MOVW       R2, R16
	CALL       _color_3_get_rgb_data+0
;Color_3_AVR.c,32 :: 		UART1_Write_Text( "Clear Data: " );
	LDI        R27, #lo_addr(?lstr3_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,33 :: 		IntToStr( my_color.clear_data, uart_text );
	MOVW       R16, R28
	SUBI       R16, 242
	SBCI       R17, 255
	MOVW       R4, R16
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _IntToStr+0
;Color_3_AVR.c,34 :: 		UART1_Write_Text( uart_text );
	MOVW       R16, R28
	SUBI       R16, 242
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,35 :: 		UART1_Write_Text( "\r\n" );
	LDI        R27, #lo_addr(?lstr4_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr4_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,37 :: 		UART1_Write_Text( "Red Data:   " );
	LDI        R27, #lo_addr(?lstr5_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr5_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,38 :: 		IntToStr( my_color.red_data, uart_text );
	MOVW       R16, R28
	SUBI       R16, 242
	SBCI       R17, 255
	MOVW       R4, R16
	LDD        R2, Y+2
	LDD        R3, Y+3
	CALL       _IntToStr+0
;Color_3_AVR.c,39 :: 		UART1_Write_Text( uart_text );
	MOVW       R16, R28
	SUBI       R16, 242
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,40 :: 		UART1_Write_Text( "\r\n" );
	LDI        R27, #lo_addr(?lstr6_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr6_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,42 :: 		UART1_Write_Text( "Green Data: " );
	LDI        R27, #lo_addr(?lstr7_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr7_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,43 :: 		IntToStr( my_color.green_data, uart_text );
	MOVW       R16, R28
	SUBI       R16, 242
	SBCI       R17, 255
	MOVW       R4, R16
	LDD        R2, Y+4
	LDD        R3, Y+5
	CALL       _IntToStr+0
;Color_3_AVR.c,44 :: 		UART1_Write_Text( uart_text );
	MOVW       R16, R28
	SUBI       R16, 242
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,45 :: 		UART1_Write_Text( "\r\n" );
	LDI        R27, #lo_addr(?lstr8_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr8_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,47 :: 		UART1_Write_Text( "Blue Data:  " );
	LDI        R27, #lo_addr(?lstr9_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr9_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,48 :: 		IntToStr( my_color.blue_data, uart_text );
	MOVW       R16, R28
	SUBI       R16, 242
	SBCI       R17, 255
	MOVW       R4, R16
	LDD        R2, Y+6
	LDD        R3, Y+7
	CALL       _IntToStr+0
;Color_3_AVR.c,49 :: 		UART1_Write_Text( uart_text );
	MOVW       R16, R28
	SUBI       R16, 242
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,50 :: 		UART1_Write_Text( "\r\n" );
	LDI        R27, #lo_addr(?lstr10_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr10_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,52 :: 		Delay_ms(1000);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main4:
	DEC        R16
	BRNE       L_main4
	DEC        R17
	BRNE       L_main4
	DEC        R18
	BRNE       L_main4
;Color_3_AVR.c,53 :: 		}
	JMP        L_main2
;Color_3_AVR.c,54 :: 		}
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

_system_setup:

;Color_3_AVR.c,56 :: 		void system_setup( void )
;Color_3_AVR.c,60 :: 		UART1_Init( 9600 );
	PUSH       R2
	PUSH       R3
	LDI        R27, 51
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;Color_3_AVR.c,61 :: 		Delay_ms(300);
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_system_setup6:
	DEC        R16
	BRNE       L_system_setup6
	DEC        R17
	BRNE       L_system_setup6
	DEC        R18
	BRNE       L_system_setup6
	NOP
	NOP
;Color_3_AVR.c,62 :: 		UART1_Write_Text( "UART Initialized\r\n" );
	LDI        R27, #lo_addr(?lstr11_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr11_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,65 :: 		TWI_Init( 100000 );
	IN         R27, TWPS0_bit+0
	CBR        R27, BitMask(TWPS0_bit+0)
	OUT        TWPS0_bit+0, R27
	IN         R27, TWPS1_bit+0
	CBR        R27, BitMask(TWPS1_bit+0)
	OUT        TWPS1_bit+0, R27
	LDI        R27, 32
	OUT        TWBR+0, R27
	CALL       _TWI_Init+0
;Color_3_AVR.c,66 :: 		Delay_ms(500);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_system_setup8:
	DEC        R16
	BRNE       L_system_setup8
	DEC        R17
	BRNE       L_system_setup8
	DEC        R18
	BRNE       L_system_setup8
	NOP
;Color_3_AVR.c,67 :: 		UART1_Write_Text( "I2C Initialized\r\n" );
	LDI        R27, #lo_addr(?lstr12_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr12_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,69 :: 		color_3_init( _i2c_address );
	LDS        R2, __i2c_address+0
	CALL       _color_3_init+0
;Color_3_AVR.c,70 :: 		Delay_ms(300);
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_system_setup10:
	DEC        R16
	BRNE       L_system_setup10
	DEC        R17
	BRNE       L_system_setup10
	DEC        R18
	BRNE       L_system_setup10
	NOP
	NOP
;Color_3_AVR.c,72 :: 		UART1_Write_Text( "Color 3 Initialized\r\n" );
	LDI        R27, #lo_addr(?lstr13_Color_3_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr13_Color_3_AVR+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;Color_3_AVR.c,73 :: 		}
L_end_system_setup:
	POP        R3
	POP        R2
	RET
; end of _system_setup
