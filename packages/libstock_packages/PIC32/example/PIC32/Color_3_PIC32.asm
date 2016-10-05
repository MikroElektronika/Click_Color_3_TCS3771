_main:
;Color_3_PIC32.c,9 :: 		void main()
ADDIU	SP, SP, -44
;Color_3_PIC32.c,12 :: 		uint8_t id_buffer[6] = { 0 };
MOVZ	R30, R0, R0
SB	R30, 10(SP)
MOVZ	R30, R0, R0
SB	R30, 11(SP)
SB	R30, 12(SP)
SB	R30, 13(SP)
SB	R30, 14(SP)
SB	R30, 15(SP)
;Color_3_PIC32.c,13 :: 		uint8_t id_reg = 0x12;
; id_reg start address is: 12 (R3)
ORI	R3, R0, 18
;Color_3_PIC32.c,14 :: 		uint8_t uart_text[25] = { 0 };
ADDIU	R23, SP, 16
ADDIU	R22, R23, 25
LUI	R24, hi_addr(?ICSmain_uart_text_L0+0)
ORI	R24, R24, lo_addr(?ICSmain_uart_text_L0+0)
JAL	___CC2DW+0
NOP	
;Color_3_PIC32.c,18 :: 		system_setup();
SB	R3, 0(SP)
JAL	_system_setup+0
NOP	
;Color_3_PIC32.c,21 :: 		UART2_Write_Text( "Device ID:  " );
LUI	R25, hi_addr(?lstr1_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr1_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
LBU	R3, 0(SP)
;Color_3_PIC32.c,22 :: 		color_3_hal_read( id_buffer, id_reg, 1 );
ADDIU	R2, SP, 10
ORI	R27, R0, 1
ANDI	R26, R3, 255
; id_reg end address is: 12 (R3)
MOVZ	R25, R2, R0
JAL	_color_3_hal_read+0
NOP	
;Color_3_PIC32.c,23 :: 		IntToHex( id_buffer[0], uart_text );
ADDIU	R3, SP, 16
ADDIU	R2, SP, 10
LBU	R2, 0(R2)
MOVZ	R26, R3, R0
ANDI	R25, R2, 255
JAL	_IntToHex+0
NOP	
;Color_3_PIC32.c,24 :: 		UART2_Write_Text( uart_text );
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,25 :: 		UART2_Write_Text( "\r\n\r\n\r\n" );
LUI	R25, hi_addr(?lstr2_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr2_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,26 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
;Color_3_PIC32.c,28 :: 		while(1)
L_main2:
;Color_3_PIC32.c,30 :: 		color_3_get_rgb_data( &my_color );
ADDIU	R2, SP, 2
MOVZ	R25, R2, R0
JAL	_color_3_get_rgb_data+0
NOP	
;Color_3_PIC32.c,32 :: 		UART2_Write_Text( "Clear Data: " );
LUI	R25, hi_addr(?lstr3_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr3_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,33 :: 		IntToStr( my_color.clear_data, uart_text );
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
LHU	R25, 2(SP)
JAL	_IntToStr+0
NOP	
;Color_3_PIC32.c,34 :: 		UART2_Write_Text( uart_text );
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,35 :: 		UART2_Write_Text( "\r\n" );
LUI	R25, hi_addr(?lstr4_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr4_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,37 :: 		UART2_Write_Text( "Red Data:   " );
LUI	R25, hi_addr(?lstr5_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr5_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,38 :: 		IntToStr( my_color.red_data, uart_text );
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
LHU	R25, 4(SP)
JAL	_IntToStr+0
NOP	
;Color_3_PIC32.c,39 :: 		UART2_Write_Text( uart_text );
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,40 :: 		UART2_Write_Text( "\r\n" );
LUI	R25, hi_addr(?lstr6_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr6_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,42 :: 		UART2_Write_Text( "Green Data: " );
LUI	R25, hi_addr(?lstr7_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr7_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,43 :: 		IntToStr( my_color.green_data, uart_text );
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
LHU	R25, 6(SP)
JAL	_IntToStr+0
NOP	
;Color_3_PIC32.c,44 :: 		UART2_Write_Text( uart_text );
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,45 :: 		UART2_Write_Text( "\r\n" );
LUI	R25, hi_addr(?lstr8_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr8_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,47 :: 		UART2_Write_Text( "Blue Data:  " );
LUI	R25, hi_addr(?lstr9_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr9_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,48 :: 		IntToStr( my_color.blue_data, uart_text );
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
LHU	R25, 8(SP)
JAL	_IntToStr+0
NOP	
;Color_3_PIC32.c,49 :: 		UART2_Write_Text( uart_text );
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,50 :: 		UART2_Write_Text( "\r\n" );
LUI	R25, hi_addr(?lstr10_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr10_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,52 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main4
NOP	
;Color_3_PIC32.c,53 :: 		}
J	L_main2
NOP	
;Color_3_PIC32.c,54 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_system_setup:
;Color_3_PIC32.c,56 :: 		void system_setup( void )
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Color_3_PIC32.c,60 :: 		UART2_Init( 9600 );
SW	R25, 4(SP)
ORI	R25, R0, 9600
JAL	_UART2_Init+0
NOP	
;Color_3_PIC32.c,61 :: 		Delay_ms(300);
LUI	R24, 122
ORI	R24, R24, 4607
L_system_setup6:
ADDIU	R24, R24, -1
BNE	R24, R0, L_system_setup6
NOP	
NOP	
;Color_3_PIC32.c,62 :: 		UART2_Write_Text( "UART Initialized\r\n" );
LUI	R25, hi_addr(?lstr11_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr11_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,65 :: 		I2C1_Init( 100000 );
LUI	R25, 1
ORI	R25, R25, 34464
JAL	_I2C1_Init+0
NOP	
;Color_3_PIC32.c,66 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_system_setup8:
ADDIU	R24, R24, -1
BNE	R24, R0, L_system_setup8
NOP	
NOP	
NOP	
;Color_3_PIC32.c,67 :: 		UART2_Write_Text( "I2C Initialized\r\n" );
LUI	R25, hi_addr(?lstr12_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr12_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,69 :: 		color_3_init( _i2c_address );
LBU	R25, Offset(__i2c_address+0)(GP)
JAL	_color_3_init+0
NOP	
;Color_3_PIC32.c,70 :: 		Delay_ms(300);
LUI	R24, 122
ORI	R24, R24, 4607
L_system_setup10:
ADDIU	R24, R24, -1
BNE	R24, R0, L_system_setup10
NOP	
NOP	
;Color_3_PIC32.c,72 :: 		UART2_Write_Text( "Color 3 Initialized\r\n" );
LUI	R25, hi_addr(?lstr13_Color_3_PIC32+0)
ORI	R25, R25, lo_addr(?lstr13_Color_3_PIC32+0)
JAL	_UART2_Write_Text+0
NOP	
;Color_3_PIC32.c,73 :: 		}
L_end_system_setup:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _system_setup
