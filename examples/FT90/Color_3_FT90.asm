_main:
;Color_3_FT90.c,9 :: 		void main()
LDK.L	SP, #43605
LINK	LR, #44
;Color_3_FT90.c,12 :: 		uint8_t id_buffer[6] = { 0 };
LDK.L	R0, #0
STI.B	SP, #12, R0
LDK.L	R0, #0
STI.B	SP, #13, R0
STI.B	SP, #14, R0
STI.B	SP, #15, R0
STI.B	SP, #16, R0
STI.B	SP, #17, R0
;Color_3_FT90.c,13 :: 		uint8_t id_reg = 0x12;
; id_reg start address is: 4 (R1)
LDK.L	R1, #18
;Color_3_FT90.c,14 :: 		uint8_t uart_text[25] = { 0 };
ADD.L	R27, SP, #18
ADD.L	R26, R27, #25
LDK.L	R28, #?ICSmain_uart_text_L0+0
CALL	___CC2DB+0
;Color_3_FT90.c,18 :: 		system_setup();
STI.B	SP, #0, R1
CALL	_system_setup+0
;Color_3_FT90.c,21 :: 		UART1_Write_Text( "Device ID:  " );
LDK.L	R0, #?lstr1_Color_3_FT90+0
CALL	_UART1_Write_Text+0
LDI.B	R1, SP, #0
;Color_3_FT90.c,22 :: 		color_3_hal_read( id_buffer, id_reg, 1 );
ADD.L	R0, SP, #12
LDK.L	R2, #1
; id_reg end address is: 4 (R1)
CALL	_color_3_hal_read+0
;Color_3_FT90.c,23 :: 		IntToHex( id_buffer[0], uart_text );
ADD.L	R1, SP, #18
ADD.L	R0, SP, #12
LDI.B	R0, R0, #0
CALL	_IntToHex+0
;Color_3_FT90.c,24 :: 		UART1_Write_Text( uart_text );
ADD.L	R0, SP, #18
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,25 :: 		UART1_Write_Text( "\r\n\r\n\r\n" );
LDK.L	R0, #?lstr2_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,27 :: 		Delay_ms(1000);
LPM.L	R28, #33333331
NOP	
L_main0:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main0
JMP	$+8
	#33333331
NOP	
NOP	
;Color_3_FT90.c,29 :: 		while(1)
L_main2:
;Color_3_FT90.c,31 :: 		color_3_get_rgb_data( &my_color );
ADD.L	R0, SP, #4
CALL	_color_3_get_rgb_data+0
;Color_3_FT90.c,33 :: 		UART1_Write_Text( "Clear Data: " );
LDK.L	R0, #?lstr3_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,34 :: 		IntToStr( my_color.clear_data, uart_text );
ADD.L	R0, SP, #18
MOVE.L	R1, R0
LDI.S	R0, SP, #4
BEXTS.L	R0, R0, #0
CALL	_IntToStr+0
;Color_3_FT90.c,35 :: 		UART1_Write_Text( uart_text );
ADD.L	R0, SP, #18
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,36 :: 		UART1_Write_Text( "\r\n" );
LDK.L	R0, #?lstr4_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,38 :: 		UART1_Write_Text( "Red Data:   " );
LDK.L	R0, #?lstr5_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,39 :: 		IntToStr( my_color.red_data, uart_text );
ADD.L	R0, SP, #18
MOVE.L	R1, R0
LDI.S	R0, SP, #6
BEXTS.L	R0, R0, #0
CALL	_IntToStr+0
;Color_3_FT90.c,40 :: 		UART1_Write_Text( uart_text );
ADD.L	R0, SP, #18
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,41 :: 		UART1_Write_Text( "\r\n" );
LDK.L	R0, #?lstr6_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,43 :: 		UART1_Write_Text( "Green Data: " );
LDK.L	R0, #?lstr7_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,44 :: 		IntToStr( my_color.green_data, uart_text );
ADD.L	R0, SP, #18
MOVE.L	R1, R0
LDI.S	R0, SP, #8
BEXTS.L	R0, R0, #0
CALL	_IntToStr+0
;Color_3_FT90.c,45 :: 		UART1_Write_Text( uart_text );
ADD.L	R0, SP, #18
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,46 :: 		UART1_Write_Text( "\r\n" );
LDK.L	R0, #?lstr8_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,48 :: 		UART1_Write_Text( "Blue Data:  " );
LDK.L	R0, #?lstr9_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,49 :: 		IntToStr( my_color.blue_data, uart_text );
ADD.L	R0, SP, #18
MOVE.L	R1, R0
LDI.S	R0, SP, #10
BEXTS.L	R0, R0, #0
CALL	_IntToStr+0
;Color_3_FT90.c,50 :: 		UART1_Write_Text( uart_text );
ADD.L	R0, SP, #18
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,51 :: 		UART1_Write_Text( "\r\n\r\n\r\n" );
LDK.L	R0, #?lstr10_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,53 :: 		Delay_ms(1000);
LPM.L	R28, #33333331
NOP	
L_main4:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main4
JMP	$+8
	#33333331
NOP	
NOP	
;Color_3_FT90.c,54 :: 		}
JMP	L_main2
;Color_3_FT90.c,56 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
_system_setup:
;Color_3_FT90.c,58 :: 		void system_setup( void )
;Color_3_FT90.c,62 :: 		UART1_Init( 9600 );
LDK.L	R0, #9600
CALL	_UART1_Init+0
;Color_3_FT90.c,63 :: 		Delay_ms(300);
LPM.L	R28, #9999998
NOP	
L_system_setup6:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_system_setup6
JMP	$+8
	#9999998
NOP	
;Color_3_FT90.c,64 :: 		UART1_Write_Text( "UART Initialized\r\n" );
LDK.L	R0, #?lstr11_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,67 :: 		I2CM1_Init( _I2CM_SPEED_MODE_STANDARD, _I2CM_SWAP_DISABLE );
LDK.L	R1, #0
LDK.L	R0, #0
CALL	_I2CM1_Init+0
;Color_3_FT90.c,68 :: 		Delay_ms(300);
LPM.L	R28, #9999998
NOP	
L_system_setup8:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_system_setup8
JMP	$+8
	#9999998
NOP	
;Color_3_FT90.c,69 :: 		UART1_Write_Text( "I2C Initialized\r\n" );
LDK.L	R0, #?lstr12_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,71 :: 		color_3_init( _i2c_address );
LDA.B	R0, __i2c_address+0
CALL	_color_3_init+0
;Color_3_FT90.c,72 :: 		Delay_ms(300);
LPM.L	R28, #9999998
NOP	
L_system_setup10:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_system_setup10
JMP	$+8
	#9999998
NOP	
;Color_3_FT90.c,74 :: 		UART1_Write_Text( "Color 3 Initialized\r\n" );
LDK.L	R0, #?lstr13_Color_3_FT90+0
CALL	_UART1_Write_Text+0
;Color_3_FT90.c,75 :: 		}
L_end_system_setup:
RETURN	
; end of _system_setup
