_main:
;Color_3_ARM.c,11 :: 		void main()
SUB	SP, SP, #44
;Color_3_ARM.c,14 :: 		uint8_t id_buffer[6] = { 0 };
MOVS	R0, #0
STRB	R0, [SP, #12]
MOVS	R0, #0
STRB	R0, [SP, #13]
STRB	R0, [SP, #14]
STRB	R0, [SP, #15]
STRB	R0, [SP, #16]
STRB	R0, [SP, #17]
;Color_3_ARM.c,15 :: 		uint8_t id_reg = 0x12;
; id_reg start address is: 4 (R1)
MOVS	R1, #18
;Color_3_ARM.c,16 :: 		uint8_t uart_text[25] = { 0 };
ADD	R11, SP, #18
ADD	R10, R11, #25
MOVW	R12, #lo_addr(?ICSmain_uart_text_L0+0)
MOVT	R12, #hi_addr(?ICSmain_uart_text_L0+0)
BL	___CC2DW+0
;Color_3_ARM.c,20 :: 		system_setup();
STRB	R1, [SP, #0]
BL	_system_setup+0
;Color_3_ARM.c,23 :: 		UART1_Write_Text( "Device ID:  " );
MOVW	R0, #lo_addr(?lstr1_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr1_Color_3_ARM+0)
BL	_UART1_Write_Text+0
LDRB	R1, [SP, #0]
;Color_3_ARM.c,24 :: 		color_3_hal_read( id_buffer, id_reg, 1 );
ADD	R0, SP, #12
MOVS	R2, #1
; id_reg end address is: 4 (R1)
BL	_color_3_hal_read+0
;Color_3_ARM.c,25 :: 		IntToHex( id_buffer[0], uart_text );
ADD	R1, SP, #18
ADD	R0, SP, #12
LDRB	R0, [R0, #0]
BL	_IntToHex+0
;Color_3_ARM.c,26 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #18
BL	_UART1_Write_Text+0
;Color_3_ARM.c,27 :: 		UART1_Write_Text( "\r\n\r\n\r\n" );
MOVW	R0, #lo_addr(?lstr2_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr2_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,28 :: 		Delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;Color_3_ARM.c,30 :: 		while(1)
L_main2:
;Color_3_ARM.c,32 :: 		color_3_get_rgb_data( &my_color );
ADD	R0, SP, #4
BL	_color_3_get_rgb_data+0
;Color_3_ARM.c,34 :: 		UART1_Write_Text( "Clear Data: " );
MOVW	R0, #lo_addr(?lstr3_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr3_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,35 :: 		IntToStr( my_color.clear_data, uart_text );
ADD	R0, SP, #18
MOV	R1, R0
LDRH	R0, [SP, #4]
BL	_IntToStr+0
;Color_3_ARM.c,36 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #18
BL	_UART1_Write_Text+0
;Color_3_ARM.c,37 :: 		UART1_Write_Text( "\r\n" );
MOVW	R0, #lo_addr(?lstr4_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr4_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,39 :: 		UART1_Write_Text( "Red Data:   " );
MOVW	R0, #lo_addr(?lstr5_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr5_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,40 :: 		IntToStr( my_color.red_data, uart_text );
ADD	R0, SP, #18
MOV	R1, R0
LDRH	R0, [SP, #6]
BL	_IntToStr+0
;Color_3_ARM.c,41 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #18
BL	_UART1_Write_Text+0
;Color_3_ARM.c,42 :: 		UART1_Write_Text( "\r\n" );
MOVW	R0, #lo_addr(?lstr6_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr6_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,44 :: 		UART1_Write_Text( "Green Data: " );
MOVW	R0, #lo_addr(?lstr7_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr7_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,45 :: 		IntToStr( my_color.green_data, uart_text );
ADD	R0, SP, #18
MOV	R1, R0
LDRH	R0, [SP, #8]
BL	_IntToStr+0
;Color_3_ARM.c,46 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #18
BL	_UART1_Write_Text+0
;Color_3_ARM.c,47 :: 		UART1_Write_Text( "\r\n" );
MOVW	R0, #lo_addr(?lstr8_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr8_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,49 :: 		UART1_Write_Text( "Blue Data:  " );
MOVW	R0, #lo_addr(?lstr9_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr9_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,50 :: 		IntToStr( my_color.blue_data, uart_text );
ADD	R0, SP, #18
MOV	R1, R0
LDRH	R0, [SP, #10]
BL	_IntToStr+0
;Color_3_ARM.c,51 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #18
BL	_UART1_Write_Text+0
;Color_3_ARM.c,52 :: 		UART1_Write_Text( "\r\n" );
MOVW	R0, #lo_addr(?lstr10_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr10_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,54 :: 		Delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;Color_3_ARM.c,55 :: 		}
IT	AL
BAL	L_main2
;Color_3_ARM.c,56 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_system_setup:
;Color_3_ARM.c,58 :: 		void system_setup( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Color_3_ARM.c,62 :: 		GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10 );
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;Color_3_ARM.c,63 :: 		Delay_ms(300);
MOVW	R7, #61055
MOVT	R7, #54
NOP
NOP
L_system_setup6:
SUBS	R7, R7, #1
BNE	L_system_setup6
NOP
NOP
NOP
;Color_3_ARM.c,66 :: 		UART1_Init( 115200 );
MOV	R0, #115200
BL	_UART1_Init+0
;Color_3_ARM.c,67 :: 		Delay_ms(300);
MOVW	R7, #61055
MOVT	R7, #54
NOP
NOP
L_system_setup8:
SUBS	R7, R7, #1
BNE	L_system_setup8
NOP
NOP
NOP
;Color_3_ARM.c,68 :: 		UART1_Write_Text( "UART Initialized\r\n" );
MOVW	R0, #lo_addr(?lstr11_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr11_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,71 :: 		I2C1_Init_Advanced( 100000, &_GPIO_MODULE_I2C1_PB67 );
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #34464
MOVT	R0, #1
BL	_I2C1_Init_Advanced+0
;Color_3_ARM.c,72 :: 		Delay_ms(500);
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_system_setup10:
SUBS	R7, R7, #1
BNE	L_system_setup10
NOP
NOP
NOP
;Color_3_ARM.c,73 :: 		UART1_Write_Text( "I2C Initialized\r\n" );
MOVW	R0, #lo_addr(?lstr12_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr12_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,75 :: 		color_3_init( _i2c_address );
MOVW	R0, #lo_addr(__i2c_address+0)
MOVT	R0, #hi_addr(__i2c_address+0)
LDRB	R0, [R0, #0]
BL	_color_3_init+0
;Color_3_ARM.c,76 :: 		Delay_ms(300);
MOVW	R7, #61055
MOVT	R7, #54
NOP
NOP
L_system_setup12:
SUBS	R7, R7, #1
BNE	L_system_setup12
NOP
NOP
NOP
;Color_3_ARM.c,78 :: 		UART1_Write_Text( "Color 3 Initialized\r\n" );
MOVW	R0, #lo_addr(?lstr13_Color_3_ARM+0)
MOVT	R0, #hi_addr(?lstr13_Color_3_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_ARM.c,79 :: 		}
L_end_system_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_setup
