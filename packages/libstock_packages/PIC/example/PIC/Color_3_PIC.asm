
_main:

;Color_3_PIC.c,9 :: 		void main()
;Color_3_PIC.c,12 :: 		uint8_t id_buffer[6] = { 0 };
	CLRF        main_id_buffer_L0+0 
	CLRF        main_id_buffer_L0+1 
	CLRF        main_id_buffer_L0+2 
	CLRF        main_id_buffer_L0+3 
	CLRF        main_id_buffer_L0+4 
	CLRF        main_id_buffer_L0+5 
	MOVLW       18
	MOVWF       main_id_reg_L0+0 
	CLRF        main_uart_text_L0+0 
	CLRF        main_uart_text_L0+1 
	CLRF        main_uart_text_L0+2 
	CLRF        main_uart_text_L0+3 
	CLRF        main_uart_text_L0+4 
	CLRF        main_uart_text_L0+5 
	CLRF        main_uart_text_L0+6 
	CLRF        main_uart_text_L0+7 
	CLRF        main_uart_text_L0+8 
	CLRF        main_uart_text_L0+9 
	CLRF        main_uart_text_L0+10 
	CLRF        main_uart_text_L0+11 
	CLRF        main_uart_text_L0+12 
	CLRF        main_uart_text_L0+13 
	CLRF        main_uart_text_L0+14 
	CLRF        main_uart_text_L0+15 
	CLRF        main_uart_text_L0+16 
	CLRF        main_uart_text_L0+17 
	CLRF        main_uart_text_L0+18 
	CLRF        main_uart_text_L0+19 
	CLRF        main_uart_text_L0+20 
	CLRF        main_uart_text_L0+21 
	CLRF        main_uart_text_L0+22 
	CLRF        main_uart_text_L0+23 
	CLRF        main_uart_text_L0+24 
;Color_3_PIC.c,18 :: 		system_setup();
	CALL        _system_setup+0, 0
;Color_3_PIC.c,21 :: 		UART1_Write_Text( "Device ID:  " );
	MOVLW       ?lstr1_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,22 :: 		color_3_hal_read( id_buffer, id_reg, 1 );
	MOVLW       main_id_buffer_L0+0
	MOVWF       FARG_color_3_hal_read_buffer+0 
	MOVLW       hi_addr(main_id_buffer_L0+0)
	MOVWF       FARG_color_3_hal_read_buffer+1 
	MOVF        main_id_reg_L0+0, 0 
	MOVWF       FARG_color_3_hal_read_reg+0 
	MOVLW       1
	MOVWF       FARG_color_3_hal_read_count+0 
	CALL        _color_3_hal_read+0, 0
;Color_3_PIC.c,23 :: 		IntToHex( id_buffer[0], uart_text );
	MOVF        main_id_buffer_L0+0, 0 
	MOVWF       FARG_IntToHex_input+0 
	MOVLW       0
	MOVWF       FARG_IntToHex_input+1 
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_IntToHex_output+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_IntToHex_output+1 
	CALL        _IntToHex+0, 0
;Color_3_PIC.c,24 :: 		UART1_Write_Text( uart_text );
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,25 :: 		UART1_Write_Text( "\r\n\r\n\r\n" );
	MOVLW       ?lstr2_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,26 :: 		Delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;Color_3_PIC.c,28 :: 		while(1)
L_main1:
;Color_3_PIC.c,30 :: 		color_3_get_rgb_data( &my_color );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_color_3_get_rgb_data_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_color_3_get_rgb_data_color+1 
	CALL        _color_3_get_rgb_data+0, 0
;Color_3_PIC.c,32 :: 		UART1_Write_Text( "Clear Data: " );
	MOVLW       ?lstr3_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,33 :: 		IntToStr( my_color.clear_data, uart_text );
	MOVF        main_my_color_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_my_color_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Color_3_PIC.c,34 :: 		UART1_Write_Text( uart_text );
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,35 :: 		UART1_Write_Text( "\r\n" );
	MOVLW       ?lstr4_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,37 :: 		UART1_Write_Text( "Red Data:   " );
	MOVLW       ?lstr5_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,38 :: 		IntToStr( my_color.red_data, uart_text );
	MOVF        main_my_color_L0+2, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_my_color_L0+3, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Color_3_PIC.c,39 :: 		UART1_Write_Text( uart_text );
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,40 :: 		UART1_Write_Text( "\r\n" );
	MOVLW       ?lstr6_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,42 :: 		UART1_Write_Text( "Green Data: " );
	MOVLW       ?lstr7_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,43 :: 		IntToStr( my_color.green_data, uart_text );
	MOVF        main_my_color_L0+4, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_my_color_L0+5, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Color_3_PIC.c,44 :: 		UART1_Write_Text( uart_text );
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,45 :: 		UART1_Write_Text( "\r\n" );
	MOVLW       ?lstr8_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,47 :: 		UART1_Write_Text( "Blue Data:  " );
	MOVLW       ?lstr9_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,48 :: 		IntToStr( my_color.blue_data, uart_text );
	MOVF        main_my_color_L0+6, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_my_color_L0+7, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Color_3_PIC.c,49 :: 		UART1_Write_Text( uart_text );
	MOVLW       main_uart_text_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_uart_text_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,50 :: 		UART1_Write_Text( "\r\n" );
	MOVLW       ?lstr10_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,52 :: 		Delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;Color_3_PIC.c,53 :: 		}
	GOTO        L_main1
;Color_3_PIC.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_system_setup:

;Color_3_PIC.c,56 :: 		void system_setup( void )
;Color_3_PIC.c,59 :: 		UART1_Init( 9600 );
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Color_3_PIC.c,60 :: 		Delay_ms(300);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_system_setup4:
	DECFSZ      R13, 1, 1
	BRA         L_system_setup4
	DECFSZ      R12, 1, 1
	BRA         L_system_setup4
	DECFSZ      R11, 1, 1
	BRA         L_system_setup4
	NOP
;Color_3_PIC.c,61 :: 		UART1_Write_Text( "UART Initialized\r\n" );
	MOVLW       ?lstr11_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,64 :: 		I2C1_Init( 100000 );
	MOVLW       40
	MOVWF       SSP1ADD+0 
	CALL        _I2C1_Init+0, 0
;Color_3_PIC.c,65 :: 		Delay_ms(500);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_system_setup5:
	DECFSZ      R13, 1, 1
	BRA         L_system_setup5
	DECFSZ      R12, 1, 1
	BRA         L_system_setup5
	DECFSZ      R11, 1, 1
	BRA         L_system_setup5
	NOP
	NOP
;Color_3_PIC.c,66 :: 		UART1_Write_Text( "I2C Initialized\r\n" );
	MOVLW       ?lstr12_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,68 :: 		color_3_init( _i2c_address );
	MOVF        __i2c_address+0, 0 
	MOVWF       FARG_color_3_init_address+0 
	CALL        _color_3_init+0, 0
;Color_3_PIC.c,69 :: 		Delay_ms(300);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_system_setup6:
	DECFSZ      R13, 1, 1
	BRA         L_system_setup6
	DECFSZ      R12, 1, 1
	BRA         L_system_setup6
	DECFSZ      R11, 1, 1
	BRA         L_system_setup6
	NOP
;Color_3_PIC.c,71 :: 		UART1_Write_Text( "Color 3 Initialized\r\n" );
	MOVLW       ?lstr13_Color_3_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_Color_3_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Color_3_PIC.c,72 :: 		}
L_end_system_setup:
	RETURN      0
; end of _system_setup
