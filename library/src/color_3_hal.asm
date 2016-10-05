
_color_3_hal_init:

;color_3_hal.c,135 :: 		void color_3_hal_init( uint8_t address_id, uint8_t command_size )
;color_3_hal.c,190 :: 		is_idle_i2c_p               = I2C2_Is_Idle;
	MOV	#lo_addr(_I2C2_Is_Idle), W0
	MOV	W0, color_3_hal_is_idle_i2c_p
;color_3_hal.c,191 :: 		start_i2c_p                 = I2C2_Start;
	MOV	#lo_addr(_I2C2_Start), W0
	MOV	W0, color_3_hal_start_i2c_p
;color_3_hal.c,192 :: 		stop_i2c_p                  = I2C2_Stop;
	MOV	#lo_addr(_I2C2_Stop), W0
	MOV	W0, color_3_hal_stop_i2c_p
;color_3_hal.c,193 :: 		restart_i2c_p               = I2C2_Restart;
	MOV	#lo_addr(_I2C2_Restart), W0
	MOV	W0, color_3_hal_restart_i2c_p
;color_3_hal.c,194 :: 		write_i2c_p                 = I2C2_Write;
	MOV	#lo_addr(_I2C2_Write), W0
	MOV	W0, color_3_hal_write_i2c_p
;color_3_hal.c,195 :: 		read_i2c_p                  = I2C2_Read;
	MOV	#lo_addr(_I2C2_Read), W0
	MOV	W0, color_3_hal_read_i2c_p
;color_3_hal.c,216 :: 		_i2c_hw_address             = ( address_id << 1 );
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(color_3_hal__i2c_hw_address), W0
	MOV.B	W1, [W0]
;color_3_hal.c,219 :: 		_cmd_size = command_size;
	MOV	#lo_addr(color_3_hal__cmd_size), W0
	MOV.B	W11, [W0]
;color_3_hal.c,220 :: 		}
L_end_color_3_hal_init:
	RETURN
; end of _color_3_hal_init

_color_3_hal_write:
	LNK	#22

;color_3_hal.c,222 :: 		void color_3_hal_write( uint8_t *buffer, uint8_t reg, uint16_t count, cmd_type_t type )
;color_3_hal.c,224 :: 		uint8_t ptr[20] = { 0 };
	PUSH	W10
	PUSH	W11
	ADD	W14, #0, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 52
	MOV	#lo_addr(?ICScolor_3_hal_write_ptr_L0), W0
	REPEAT	#19
	MOV.B	[W0++], [W1++]
;color_3_hal.c,225 :: 		uint8_t i = 0;
;color_3_hal.c,227 :: 		if ( type == NORMAL_TYPE )
	CP.B	W13, #1
	BRA Z	L__color_3_hal_write14
	GOTO	L_color_3_hal_write0
L__color_3_hal_write14:
;color_3_hal.c,228 :: 		ptr[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_AUTOINC | reg;
	ADD	W14, #0, W2
	MOV	#160, W1
	ZE	W11, W0
	IOR	W1, W0, W0
	MOV.B	W0, [W2]
	GOTO	L_color_3_hal_write1
L_color_3_hal_write0:
;color_3_hal.c,229 :: 		else if ( type == SPECIAL_TYPE )
	CP.B	W13, #0
	BRA Z	L__color_3_hal_write15
	GOTO	L_color_3_hal_write2
L__color_3_hal_write15:
;color_3_hal.c,230 :: 		ptr[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_SPECIAL | 0x07;
	ADD	W14, #0, W1
	MOV.B	#231, W0
	MOV.B	W0, [W1]
L_color_3_hal_write2:
L_color_3_hal_write1:
;color_3_hal.c,232 :: 		memcpy( &ptr[ 1 ], buffer, count );
	ADD	W14, #0, W0
	INC	W0
	PUSH	W12
	MOV	W10, W11
	MOV	W0, W10
	CALL	_memcpy
	POP	W12
;color_3_hal.c,234 :: 		count += 1;
	ADD	W12, #1, W0
	MOV	W0, W12
;color_3_hal.c,274 :: 		i = 0;
	CLR	W0
	MOV.B	W0, [W14+20]
;color_3_hal.c,275 :: 		start_i2c_p();
	MOV	color_3_hal_start_i2c_p, W0
	PUSH	W12
	CALL	W0
;color_3_hal.c,276 :: 		write_i2c_p( _i2c_hw_address | WRITE_BIT );
	MOV	#lo_addr(color_3_hal__i2c_hw_address), W0
	ZE	[W0], W0
	MOV.B	W0, W10
	MOV	color_3_hal_write_i2c_p, W0
	CALL	W0
	POP	W12
;color_3_hal.c,277 :: 		if ( count > 1 )
	CP	W12, #1
	BRA GTU	L__color_3_hal_write16
	GOTO	L_color_3_hal_write3
L__color_3_hal_write16:
;color_3_hal.c,279 :: 		while ( count-- )
L_color_3_hal_write4:
	MOV	W12, W1
	SUB	W12, #1, W0
	MOV	W0, W12
	CP0	W1
	BRA NZ	L__color_3_hal_write17
	GOTO	L_color_3_hal_write5
L__color_3_hal_write17:
;color_3_hal.c,280 :: 		write_i2c_p( ptr[i++] );
	ADD	W14, #0, W1
	ADD	W14, #20, W0
	ZE	[W0], W0
	ADD	W1, W0, W0
	PUSH.D	W12
	PUSH.D	W10
	MOV.B	[W0], W10
	MOV	color_3_hal_write_i2c_p, W0
	CALL	W0
	POP.D	W10
	POP.D	W12
	MOV.B	[W14+20], W1
	ADD	W14, #20, W0
	ADD.B	W1, #1, [W0]
	GOTO	L_color_3_hal_write4
L_color_3_hal_write5:
;color_3_hal.c,282 :: 		}
	GOTO	L_color_3_hal_write6
L_color_3_hal_write3:
;color_3_hal.c,283 :: 		else if ( count == 1 )
	CP	W12, #1
	BRA Z	L__color_3_hal_write18
	GOTO	L_color_3_hal_write7
L__color_3_hal_write18:
;color_3_hal.c,284 :: 		write_i2c_p( ptr[0] );
	ADD	W14, #0, W0
	MOV.B	[W0], W10
	MOV	color_3_hal_write_i2c_p, W0
	CALL	W0
L_color_3_hal_write7:
L_color_3_hal_write6:
;color_3_hal.c,286 :: 		stop_i2c_p();
	MOV	color_3_hal_stop_i2c_p, W0
	PUSH.D	W12
	PUSH.D	W10
	CALL	W0
	POP.D	W10
	POP.D	W12
;color_3_hal.c,288 :: 		}
L_end_color_3_hal_write:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _color_3_hal_write

_color_3_hal_read:
	LNK	#14

;color_3_hal.c,290 :: 		void color_3_hal_read( uint8_t *buffer, uint8_t reg, uint8_t count )
;color_3_hal.c,292 :: 		uint8_t cnt  = _cmd_size;
	MOV	#lo_addr(color_3_hal__cmd_size), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+0]
;color_3_hal.c,294 :: 		uint8_t read_reg_cmd[10] = { 0 };
	ADD	W14, #4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 52
	MOV	#lo_addr(?ICScolor_3_hal_read_read_reg_cmd_L0), W0
	REPEAT	#9
	MOV.B	[W0++], [W1++]
;color_3_hal.c,296 :: 		read_reg_cmd[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_AUTOINC | reg;
	ADD	W14, #4, W2
	MOV	#160, W1
	ZE	W11, W0
	IOR	W1, W0, W0
	MOV.B	W0, [W2]
;color_3_hal.c,335 :: 		start_i2c_p();
	MOV	color_3_hal_start_i2c_p, W0
	PUSH	W12
	PUSH	W10
	CALL	W0
;color_3_hal.c,336 :: 		write_i2c_p( _i2c_hw_address | WRITE_BIT );
	MOV	#lo_addr(color_3_hal__i2c_hw_address), W0
	ZE	[W0], W0
	MOV.B	W0, W10
	MOV	color_3_hal_write_i2c_p, W0
	CALL	W0
	POP	W10
	POP	W12
;color_3_hal.c,338 :: 		while ( cnt-- )
L_color_3_hal_read8:
	MOV.B	[W14+0], W2
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	SUB.B	W1, #1, [W0]
	CP0.B	W2
	BRA NZ	L__color_3_hal_read20
	GOTO	L_color_3_hal_read9
L__color_3_hal_read20:
;color_3_hal.c,339 :: 		write_i2c_p( read_reg_cmd[0] );
	ADD	W14, #4, W0
	PUSH	W12
	PUSH.D	W10
	MOV.B	[W0], W10
	MOV	color_3_hal_write_i2c_p, W0
	CALL	W0
	POP.D	W10
	POP	W12
	GOTO	L_color_3_hal_read8
L_color_3_hal_read9:
;color_3_hal.c,341 :: 		stop_i2c_p();
	MOV	color_3_hal_stop_i2c_p, W0
	PUSH	W12
	PUSH.D	W10
	CALL	W0
	POP.D	W10
;color_3_hal.c,343 :: 		ptr = buffer;
	MOV	W10, [W14+2]
;color_3_hal.c,345 :: 		start_i2c_p();
	MOV	color_3_hal_start_i2c_p, W0
	PUSH.D	W10
	CALL	W0
;color_3_hal.c,346 :: 		write_i2c_p( _i2c_hw_address | READ_BIT );
	MOV	#lo_addr(color_3_hal__i2c_hw_address), W0
	ZE	[W0], W0
	IOR	W0, #1, W0
	MOV.B	W0, W10
	MOV	color_3_hal_write_i2c_p, W0
	CALL	W0
	POP.D	W10
	POP	W12
;color_3_hal.c,348 :: 		while ( --count )
L_color_3_hal_read10:
	SUB.B	W12, #1, W0
	MOV.B	W0, W12
	CP0.B	W12
	BRA NZ	L__color_3_hal_read21
	GOTO	L_color_3_hal_read11
L__color_3_hal_read21:
;color_3_hal.c,350 :: 		*ptr++ = read_i2c_p( ACK_BIT );
	MOV	#lo_addr(color_3_hal_ACK_BIT), W0
	PUSH	W12
	PUSH.D	W10
	ZE	[W0], W10
	MOV	color_3_hal_read_i2c_p, W1
	CALL	W1
	POP.D	W10
	POP	W12
	MOV	[W14+2], W1
	MOV.B	W0, [W1]
	MOV	[W14+2], W1
	ADD	W14, #2, W0
	ADD	W1, #1, [W0]
;color_3_hal.c,351 :: 		}
	GOTO	L_color_3_hal_read10
L_color_3_hal_read11:
;color_3_hal.c,353 :: 		*ptr = read_i2c_p( NACK_BIT );
	MOV	#lo_addr(color_3_hal_NACK_BIT), W0
	PUSH	W12
	PUSH.D	W10
	ZE	[W0], W10
	MOV	color_3_hal_read_i2c_p, W1
	CALL	W1
	MOV	[W14+2], W1
	MOV.B	W0, [W1]
;color_3_hal.c,355 :: 		stop_i2c_p();
	MOV	color_3_hal_stop_i2c_p, W0
	CALL	W0
	POP.D	W10
	POP	W12
;color_3_hal.c,357 :: 		}
L_end_color_3_hal_read:
	ULNK
	RETURN
; end of _color_3_hal_read
