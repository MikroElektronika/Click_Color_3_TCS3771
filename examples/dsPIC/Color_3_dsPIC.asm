
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68
	LNK	#40

;Color_3_dsPIC.c,9 :: 		void main()
;Color_3_dsPIC.c,12 :: 		uint8_t id_buffer[6] = { 0 };
	PUSH	W10
	PUSH	W11
	PUSH	W12
	ADD	W14, #8, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 52
	MOV	#lo_addr(?ICSmain_id_buffer_L0), W0
	REPEAT	#5
	MOV.B	[W0++], [W1++]
;Color_3_dsPIC.c,13 :: 		uint8_t id_reg = 0x12;
; id_reg start address is: 4 (W2)
	MOV.B	#18, W2
;Color_3_dsPIC.c,14 :: 		uint8_t uart_text[25] = { 0 };
	ADD	W14, #14, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 52
	MOV	#lo_addr(?ICSmain_uart_text_L0), W0
	REPEAT	#24
	MOV.B	[W0++], [W1++]
;Color_3_dsPIC.c,18 :: 		system_setup();
	PUSH	W2
	CALL	_system_setup
	POP	W2
;Color_3_dsPIC.c,21 :: 		UART2_Write_Text( "Device ID:  " );
	MOV	#lo_addr(?lstr1_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,22 :: 		color_3_hal_read( id_buffer, id_reg, 1 );
	ADD	W14, #8, W0
	MOV.B	#1, W12
	MOV.B	W2, W11
; id_reg end address is: 4 (W2)
	MOV	W0, W10
	CALL	_color_3_hal_read
;Color_3_dsPIC.c,23 :: 		IntToHex( id_buffer[0], uart_text );
	ADD	W14, #14, W1
	ADD	W14, #8, W0
	MOV	W1, W11
	ZE	[W0], W10
	CALL	_IntToHex
;Color_3_dsPIC.c,24 :: 		UART2_Write_Text( uart_text );
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,25 :: 		UART2_Write_Text( "\r\n\r\n\r\n" );
	MOV	#lo_addr(?lstr2_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,26 :: 		Delay_ms(1000);
	MOV	#21, W8
	MOV	#22619, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
;Color_3_dsPIC.c,28 :: 		while(1)
L_main2:
;Color_3_dsPIC.c,30 :: 		color_3_get_rgb_data( &my_color );
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_color_3_get_rgb_data
;Color_3_dsPIC.c,32 :: 		UART2_Write_Text( "Clear Data: " );
	MOV	#lo_addr(?lstr3_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,33 :: 		IntToStr( my_color.clear_data, uart_text );
	ADD	W14, #14, W0
	MOV	W0, W11
	MOV	[W14+0], W10
	CALL	_IntToStr
;Color_3_dsPIC.c,34 :: 		UART2_Write_Text( uart_text );
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,35 :: 		UART2_Write_Text( "\r\n" );
	MOV	#lo_addr(?lstr4_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,37 :: 		UART2_Write_Text( "Red Data:   " );
	MOV	#lo_addr(?lstr5_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,38 :: 		IntToStr( my_color.red_data, uart_text );
	ADD	W14, #14, W0
	MOV	W0, W11
	MOV	[W14+2], W10
	CALL	_IntToStr
;Color_3_dsPIC.c,39 :: 		UART2_Write_Text( uart_text );
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,40 :: 		UART2_Write_Text( "\r\n" );
	MOV	#lo_addr(?lstr6_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,42 :: 		UART2_Write_Text( "Green Data: " );
	MOV	#lo_addr(?lstr7_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,43 :: 		IntToStr( my_color.green_data, uart_text );
	ADD	W14, #14, W0
	MOV	W0, W11
	MOV	[W14+4], W10
	CALL	_IntToStr
;Color_3_dsPIC.c,44 :: 		UART2_Write_Text( uart_text );
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,45 :: 		UART2_Write_Text( "\r\n" );
	MOV	#lo_addr(?lstr8_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,47 :: 		UART2_Write_Text( "Blue Data:  " );
	MOV	#lo_addr(?lstr9_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,48 :: 		IntToStr( my_color.blue_data, uart_text );
	ADD	W14, #14, W0
	MOV	W0, W11
	MOV	[W14+6], W10
	CALL	_IntToStr
;Color_3_dsPIC.c,49 :: 		UART2_Write_Text( uart_text );
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,50 :: 		UART2_Write_Text( "\r\n" );
	MOV	#lo_addr(?lstr10_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,52 :: 		Delay_ms(1000);
	MOV	#21, W8
	MOV	#22619, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
;Color_3_dsPIC.c,53 :: 		}
	GOTO	L_main2
;Color_3_dsPIC.c,54 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main

_system_setup:

;Color_3_dsPIC.c,56 :: 		void system_setup( void )
;Color_3_dsPIC.c,70 :: 		UART2_Init( 9600 );
	PUSH	W10
	PUSH	W11
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART2_Init
;Color_3_dsPIC.c,71 :: 		Delay_ms(300);
	MOV	#7, W8
	MOV	#6785, W7
L_system_setup6:
	DEC	W7
	BRA NZ	L_system_setup6
	DEC	W8
	BRA NZ	L_system_setup6
;Color_3_dsPIC.c,72 :: 		UART2_Write_Text( "UART Initialized\r\n" );
	MOV	#lo_addr(?lstr11_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,75 :: 		I2C2_Init( 100000 );
	MOV	#34464, W10
	MOV	#1, W11
	CALL	_I2C2_Init
;Color_3_dsPIC.c,76 :: 		Delay_ms(500);
	MOV	#11, W8
	MOV	#11309, W7
L_system_setup8:
	DEC	W7
	BRA NZ	L_system_setup8
	DEC	W8
	BRA NZ	L_system_setup8
;Color_3_dsPIC.c,77 :: 		UART2_Write_Text( "I2C Initialized\r\n" );
	MOV	#lo_addr(?lstr12_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,79 :: 		color_3_init( _i2c_address );
	MOV	#lo_addr(__i2c_address), W0
	MOV.B	[W0], W10
	CALL	_color_3_init
;Color_3_dsPIC.c,80 :: 		Delay_ms(300);
	MOV	#7, W8
	MOV	#6785, W7
L_system_setup10:
	DEC	W7
	BRA NZ	L_system_setup10
	DEC	W8
	BRA NZ	L_system_setup10
;Color_3_dsPIC.c,82 :: 		UART2_Write_Text( "Color 3 Initialized\r\n" );
	MOV	#lo_addr(?lstr13_Color_3_dsPIC), W10
	CALL	_UART2_Write_Text
;Color_3_dsPIC.c,83 :: 		}
L_end_system_setup:
	POP	W11
	POP	W10
	RETURN
; end of _system_setup
