
_color_3_init:
	LNK	#26

;color_3.c,94 :: 		void color_3_init( uint8_t address )
;color_3.c,96 :: 		uint8_t buffer[ 20 ]    = { TCS3771_CONTROL_PDIODE_IR };
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 52
	MOV	#lo_addr(?ICScolor_3_init_buffer_L0), W0
	REPEAT	#20
	MOV.B	[W0++], [W1++]
;color_3.c,97 :: 		cmd_type_t type = NORMAL_TYPE;
;color_3.c,99 :: 		color_3_hal_init( address, 1 );
	MOV.B	#1, W11
	CALL	_color_3_hal_init
;color_3.c,101 :: 		color_3_hal_write( buffer, TCS3771_CONTROL, 1, type );
	ADD	W14, #0, W0
	MOV	W0, [W14+24]
	MOV.B	[W14+20], W13
	MOV	#1, W12
	MOV.B	#15, W11
	MOV	W0, W10
	CALL	_color_3_hal_write
;color_3.c,103 :: 		buffer[0] = 0x00;
	ADD	W14, #0, W1
	CLR	W0
	MOV.B	W0, [W1]
;color_3.c,104 :: 		color_3_hal_write( buffer, TCS3771_PPULSE, 1, type );
	MOV	[W14+24], W0
	MOV.B	[W14+20], W13
	MOV	#1, W12
	MOV.B	#14, W11
	MOV	W0, W10
	CALL	_color_3_hal_write
;color_3.c,106 :: 		buffer[0] = 216;
	ADD	W14, #0, W1
	MOV.B	#216, W0
	MOV.B	W0, [W1]
;color_3.c,107 :: 		color_3_hal_write( buffer, TCS3771_WTIME, 1, type );
	MOV	[W14+24], W0
	MOV.B	[W14+20], W13
	MOV	#1, W12
	MOV.B	#3, W11
	MOV	W0, W10
	CALL	_color_3_hal_write
;color_3.c,109 :: 		buffer[0] = 0x01;
	ADD	W14, #0, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;color_3.c,110 :: 		buffer[1] = 0x30;
	MOV	[W14+24], W2
	ADD	W2, #1, W1
	MOV.B	#48, W0
	MOV.B	W0, [W1]
;color_3.c,111 :: 		buffer[2] = 0x01;
	ADD	W2, #2, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;color_3.c,112 :: 		buffer[3] = 0x70;
	ADD	W2, #3, W1
	MOV.B	#112, W0
	MOV.B	W0, [W1]
;color_3.c,113 :: 		color_3_hal_write( buffer, TCS3771_PILT, 4, type );
	MOV.B	[W14+20], W13
	MOV	#4, W12
	MOV.B	#8, W11
	MOV	W2, W10
	CALL	_color_3_hal_write
;color_3.c,115 :: 		buffer[0] = 0x01;
	ADD	W14, #0, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;color_3.c,116 :: 		buffer[1] = 0x30;
	MOV	[W14+24], W2
	ADD	W2, #1, W1
	MOV.B	#48, W0
	MOV.B	W0, [W1]
;color_3.c,117 :: 		buffer[2] = 0x01;
	ADD	W2, #2, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;color_3.c,118 :: 		buffer[3] = 0x70;
	ADD	W2, #3, W1
	MOV.B	#112, W0
	MOV.B	W0, [W1]
;color_3.c,119 :: 		color_3_hal_write( buffer, TCS3771_AILT, 4, type );
	MOV.B	[W14+20], W13
	MOV	#4, W12
	MOV.B	#4, W11
	MOV	W2, W10
	CALL	_color_3_hal_write
;color_3.c,121 :: 		buffer[0] = TCS3771_PERS_PPERS(10);
	ADD	W14, #0, W1
	MOV.B	#160, W0
	MOV.B	W0, [W1]
;color_3.c,122 :: 		color_3_hal_write( buffer, TCS3771_PERS, 1, type );
	MOV	[W14+24], W0
	MOV.B	[W14+20], W13
	MOV	#1, W12
	MOV.B	#12, W11
	MOV	W0, W10
	CALL	_color_3_hal_write
;color_3.c,124 :: 		buffer[0] = TCS3771_ENABLE_PON | TCS3771_ENABLE_PEN | TCS3771_ENABLE_WEN | TCS3771_ENABLE_AEN | TCS3771_ENABLE_PIEN | TCS3771_ENABLE_AIEN;
	ADD	W14, #0, W1
	MOV.B	#63, W0
	MOV.B	W0, [W1]
;color_3.c,125 :: 		color_3_hal_write( buffer, TCS3771_ENABLE, 1, type );
	MOV	[W14+24], W0
	MOV.B	[W14+20], W13
	MOV	#1, W12
	CLR	W11
	MOV	W0, W10
	CALL	_color_3_hal_write
;color_3.c,128 :: 		color_3_hal_write( buffer, 0, 0, type );
	ADD	W14, #0, W0
	CLR	W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_color_3_hal_write
;color_3.c,130 :: 		type = NORMAL_TYPE;
	MOV.B	#1, W0
	MOV.B	W0, [W14+20]
;color_3.c,131 :: 		buffer[0] = 252;
	ADD	W14, #0, W1
	MOV.B	#252, W0
	MOV.B	W0, [W1]
;color_3.c,132 :: 		color_3_hal_write( buffer, TCS3771_ATIME, 1, type );
	MOV	[W14+24], W0
	MOV.B	[W14+20], W13
	MOV	#1, W12
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_color_3_hal_write
;color_3.c,134 :: 		buffer[0] = 254;
	ADD	W14, #0, W1
	MOV.B	#254, W0
	MOV.B	W0, [W1]
;color_3.c,135 :: 		color_3_hal_write( buffer, TCS3771_PTIME, 1, type );
	MOV	[W14+24], W0
	MOV.B	[W14+20], W13
	MOV	#1, W12
	MOV.B	#2, W11
	MOV	W0, W10
	CALL	_color_3_hal_write
;color_3.c,136 :: 		}
L_end_color_3_init:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _color_3_init

_color_3_get_rgb_data:
	LNK	#22

;color_3.c,139 :: 		void color_3_get_rgb_data( color_t* color )
;color_3.c,141 :: 		uint8_t buffer[ 20 ] = { 0 };
	PUSH	W11
	PUSH	W12
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 52
	MOV	#lo_addr(?ICScolor_3_get_rgb_data_buffer_L0), W0
	REPEAT	#19
	MOV.B	[W0++], [W1++]
;color_3.c,142 :: 		uint8_t uart_text[ 20 ] = { 0 };
;color_3.c,145 :: 		uint8_t count = 8;
;color_3.c,147 :: 		color_3_hal_read( buffer, TCS3771_CDATA, 8 );
	ADD	W14, #0, W0
	MOV	W0, [W14+20]
	PUSH	W10
	MOV.B	#8, W12
	MOV.B	#20, W11
	MOV	W0, W10
	CALL	_color_3_hal_read
	POP	W10
;color_3.c,149 :: 		l_byte = buffer[0];
	ADD	W14, #0, W1
;color_3.c,150 :: 		h_byte = buffer[1];
	ADD	W1, #1, W0
;color_3.c,151 :: 		big_byte =  l_byte;
; big_byte start address is: 2 (W1)
	ZE	[W1], W1
;color_3.c,152 :: 		big_byte |= (uint16_t)h_byte << 8;
	ZE	[W0], W0
	SL	W0, #8, W0
	IOR	W1, W0, [W10]
; big_byte end address is: 2 (W1)
;color_3.c,153 :: 		color->clear_data = big_byte;
;color_3.c,155 :: 		l_byte = buffer[2];
	MOV	[W14+20], W2
	ADD	W2, #2, W1
;color_3.c,156 :: 		h_byte = buffer[3];
	ADD	W2, #3, W0
;color_3.c,157 :: 		big_byte =  l_byte;
; big_byte start address is: 6 (W3)
	ZE	[W1], W3
;color_3.c,158 :: 		big_byte |= (uint16_t)h_byte << 8;
	ZE	[W0], W0
	SL	W0, #8, W0
	IOR	W3, W0, W1
; big_byte end address is: 6 (W3)
;color_3.c,159 :: 		color->red_data = big_byte;
	ADD	W10, #2, W0
	MOV	W1, [W0]
;color_3.c,161 :: 		l_byte = buffer[4];
	ADD	W2, #4, W1
;color_3.c,162 :: 		h_byte = buffer[5];
	ADD	W2, #5, W0
;color_3.c,163 :: 		big_byte =  l_byte;
; big_byte start address is: 6 (W3)
	ZE	[W1], W3
;color_3.c,164 :: 		big_byte |= (uint16_t)h_byte << 8;
	ZE	[W0], W0
	SL	W0, #8, W0
	IOR	W3, W0, W1
; big_byte end address is: 6 (W3)
;color_3.c,165 :: 		color->green_data = big_byte;
	ADD	W10, #4, W0
	MOV	W1, [W0]
;color_3.c,167 :: 		l_byte = buffer[6];
	ADD	W2, #6, W1
;color_3.c,168 :: 		h_byte = buffer[7];
	ADD	W2, #7, W0
;color_3.c,169 :: 		big_byte =  l_byte;
; big_byte start address is: 4 (W2)
	ZE	[W1], W2
;color_3.c,170 :: 		big_byte |= (uint16_t)h_byte << 8;
	ZE	[W0], W0
	SL	W0, #8, W0
	IOR	W2, W0, W1
; big_byte end address is: 4 (W2)
;color_3.c,171 :: 		color->blue_data = big_byte;
	ADD	W10, #6, W0
	MOV	W1, [W0]
;color_3.c,173 :: 		}
L_end_color_3_get_rgb_data:
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _color_3_get_rgb_data
