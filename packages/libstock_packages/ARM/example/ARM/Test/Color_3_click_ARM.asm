_main:
;Color_3_click_ARM.c,58 :: 		void main()
SUB	SP, SP, #48
;Color_3_click_ARM.c,61 :: 		uint8_t id_buffer[20] = { 0 };
ADD	R11, SP, #0
ADD	R10, R11, #45
MOVW	R12, #lo_addr(?ICSmain_id_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmain_id_buffer_L0+0)
BL	___CC2DW+0
;Color_3_click_ARM.c,62 :: 		uint8_t id_reg = 0x12;
;Color_3_click_ARM.c,63 :: 		uint8_t uart_text[25] = { 0 };
;Color_3_click_ARM.c,64 :: 		uint8_t l_byte = 0;
;Color_3_click_ARM.c,65 :: 		uint8_t h_byte = 0;
;Color_3_click_ARM.c,66 :: 		uint16_t big_byte = 0;
;Color_3_click_ARM.c,70 :: 		system_setup();
BL	_system_setup+0
;Color_3_click_ARM.c,73 :: 		UART1_Write_Text( "Device ID:  " );
MOVW	R0, #lo_addr(?lstr1_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr1_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,74 :: 		color_3_read( id_buffer, 0x12, 1 );
ADD	R0, SP, #0
MOVS	R2, #1
MOVS	R1, #18
BL	_color_3_read+0
;Color_3_click_ARM.c,75 :: 		IntToHex( id_buffer[0], uart_text );
ADD	R1, SP, #20
ADD	R0, SP, #0
LDRB	R0, [R0, #0]
BL	_IntToHex+0
;Color_3_click_ARM.c,76 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #20
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,77 :: 		UART1_Write_Text( "\r\n\r\n\r\n" );
MOVW	R0, #lo_addr(?lstr2_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr2_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,78 :: 		Delay_ms(1000);
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
;Color_3_click_ARM.c,80 :: 		while(1)
L_main2:
;Color_3_click_ARM.c,82 :: 		while( INT == 1 );   //Wait for new data
L_main4:
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
IT	AL
BAL	L_main4
L_main5:
;Color_3_click_ARM.c,84 :: 		color_3_read( id_buffer, TCS3771_CDATA, 8 );
ADD	R0, SP, #0
MOVS	R2, #8
MOVS	R1, #20
BL	_color_3_read+0
;Color_3_click_ARM.c,86 :: 		l_byte = id_buffer[0];
ADD	R0, SP, #0
LDRB	R1, [R0, #0]
;Color_3_click_ARM.c,87 :: 		h_byte = id_buffer[1];
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
;Color_3_click_ARM.c,88 :: 		big_byte =  l_byte;
; big_byte start address is: 4 (R1)
UXTB	R1, R1
;Color_3_click_ARM.c,89 :: 		big_byte |= (uint16_t)h_byte << 8;
LSLS	R0, R0, #8
UXTH	R0, R0
ORR	R7, R1, R0, LSL #0
UXTH	R7, R7
; big_byte end address is: 4 (R1)
; big_byte start address is: 28 (R7)
;Color_3_click_ARM.c,91 :: 		UART1_Write_Text( "Clear Data: " );
MOVW	R0, #lo_addr(?lstr3_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr3_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,92 :: 		IntToStr( big_byte, uart_text );
ADD	R0, SP, #20
MOV	R1, R0
SXTH	R0, R7
; big_byte end address is: 28 (R7)
BL	_IntToStr+0
;Color_3_click_ARM.c,93 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #20
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,94 :: 		UART1_Write_Text( "\r\n" );
MOVW	R0, #lo_addr(?lstr4_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr4_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,96 :: 		l_byte = id_buffer[2];
ADD	R2, SP, #0
ADDS	R0, R2, #2
LDRB	R1, [R0, #0]
;Color_3_click_ARM.c,97 :: 		h_byte = id_buffer[3];
ADDS	R0, R2, #3
LDRB	R0, [R0, #0]
;Color_3_click_ARM.c,98 :: 		big_byte =  l_byte;
; big_byte start address is: 4 (R1)
UXTB	R1, R1
;Color_3_click_ARM.c,99 :: 		big_byte |= (uint16_t)h_byte << 8;
LSLS	R0, R0, #8
UXTH	R0, R0
ORR	R7, R1, R0, LSL #0
UXTH	R7, R7
; big_byte end address is: 4 (R1)
; big_byte start address is: 28 (R7)
;Color_3_click_ARM.c,101 :: 		UART1_Write_Text( "Red Data:   " );
MOVW	R0, #lo_addr(?lstr5_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr5_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,102 :: 		IntToStr( big_byte, uart_text );
ADD	R0, SP, #20
MOV	R1, R0
SXTH	R0, R7
; big_byte end address is: 28 (R7)
BL	_IntToStr+0
;Color_3_click_ARM.c,103 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #20
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,104 :: 		UART1_Write_Text( "\r\n" );
MOVW	R0, #lo_addr(?lstr6_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr6_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,106 :: 		l_byte = id_buffer[4];
ADD	R2, SP, #0
ADDS	R0, R2, #4
LDRB	R1, [R0, #0]
;Color_3_click_ARM.c,107 :: 		h_byte = id_buffer[5];
ADDS	R0, R2, #5
LDRB	R0, [R0, #0]
;Color_3_click_ARM.c,108 :: 		big_byte =  l_byte;
; big_byte start address is: 4 (R1)
UXTB	R1, R1
;Color_3_click_ARM.c,109 :: 		big_byte |= (uint16_t)h_byte << 8;
LSLS	R0, R0, #8
UXTH	R0, R0
ORR	R7, R1, R0, LSL #0
UXTH	R7, R7
; big_byte end address is: 4 (R1)
; big_byte start address is: 28 (R7)
;Color_3_click_ARM.c,111 :: 		UART1_Write_Text( "Green Data: " );
MOVW	R0, #lo_addr(?lstr7_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr7_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,112 :: 		IntToStr( big_byte, uart_text );
ADD	R0, SP, #20
MOV	R1, R0
SXTH	R0, R7
; big_byte end address is: 28 (R7)
BL	_IntToStr+0
;Color_3_click_ARM.c,113 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #20
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,114 :: 		UART1_Write_Text( "\r\n" );
MOVW	R0, #lo_addr(?lstr8_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr8_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,116 :: 		l_byte = id_buffer[6];
ADD	R2, SP, #0
ADDS	R0, R2, #6
LDRB	R1, [R0, #0]
;Color_3_click_ARM.c,117 :: 		h_byte = id_buffer[7];
ADDS	R0, R2, #7
LDRB	R0, [R0, #0]
;Color_3_click_ARM.c,118 :: 		big_byte =  l_byte;
; big_byte start address is: 4 (R1)
;Color_3_click_ARM.c,119 :: 		big_byte |= (uint16_t)h_byte << 8;
LSLS	R0, R0, #8
UXTH	R0, R0
ORR	R0, R1, R0, LSL #0
; big_byte end address is: 4 (R1)
; big_byte start address is: 28 (R7)
UXTH	R7, R0
;Color_3_click_ARM.c,121 :: 		UART1_Write_Text( "Blue Data:  " );
MOVW	R0, #lo_addr(?lstr9_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr9_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,122 :: 		IntToStr( big_byte, uart_text );
ADD	R0, SP, #20
MOV	R1, R0
SXTH	R0, R7
; big_byte end address is: 28 (R7)
BL	_IntToStr+0
;Color_3_click_ARM.c,123 :: 		UART1_Write_Text( uart_text );
ADD	R0, SP, #20
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,124 :: 		UART1_Write_Text( "\r\n\r\n\r\n" );
MOVW	R0, #lo_addr(?lstr10_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr10_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,126 :: 		Delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;Color_3_click_ARM.c,127 :: 		}
IT	AL
BAL	L_main2
;Color_3_click_ARM.c,128 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_system_setup:
;Color_3_click_ARM.c,130 :: 		void system_setup( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Color_3_click_ARM.c,134 :: 		GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10 );
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;Color_3_click_ARM.c,135 :: 		Delay_ms(300);
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
;Color_3_click_ARM.c,138 :: 		UART1_Init( 115200 );
MOV	R0, #115200
BL	_UART1_Init+0
;Color_3_click_ARM.c,139 :: 		Delay_ms(300);
MOVW	R7, #61055
MOVT	R7, #54
NOP
NOP
L_system_setup10:
SUBS	R7, R7, #1
BNE	L_system_setup10
NOP
NOP
NOP
;Color_3_click_ARM.c,140 :: 		UART1_Write_Text( "UART Initialized\r\n" );
MOVW	R0, #lo_addr(?lstr11_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr11_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,143 :: 		I2C1_Init_Advanced( 100000, &_GPIO_MODULE_I2C1_PB67 );
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #34464
MOVT	R0, #1
BL	_I2C1_Init_Advanced+0
;Color_3_click_ARM.c,144 :: 		Delay_ms(500);
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_system_setup12:
SUBS	R7, R7, #1
BNE	L_system_setup12
NOP
NOP
NOP
;Color_3_click_ARM.c,145 :: 		UART1_Write_Text( "I2C Initialized\r\n" );
MOVW	R0, #lo_addr(?lstr12_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr12_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,149 :: 		_i2c_address             = _i2c_address;
;Color_3_click_ARM.c,154 :: 		color_3_init();
BL	_color_3_init+0
;Color_3_click_ARM.c,155 :: 		Delay_ms(300);
MOVW	R7, #61055
MOVT	R7, #54
NOP
NOP
L_system_setup14:
SUBS	R7, R7, #1
BNE	L_system_setup14
NOP
NOP
NOP
;Color_3_click_ARM.c,157 :: 		UART1_Write_Text( "Color 3 Initialized\r\n" );
MOVW	R0, #lo_addr(?lstr13_Color_3_click_ARM+0)
MOVT	R0, #hi_addr(?lstr13_Color_3_click_ARM+0)
BL	_UART1_Write_Text+0
;Color_3_click_ARM.c,158 :: 		}
L_end_system_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_setup
_color_3_read:
;Color_3_click_ARM.c,160 :: 		void color_3_read( uint8_t *buffer, uint8_t reg, uint8_t count )
; tmp_buffer start address is: 40 (R10)
; reg start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
;Color_3_click_ARM.c,163 :: 		uint8_t *tmp_buffer = buffer;
;Color_3_click_ARM.c,160 :: 		void color_3_read( uint8_t *buffer, uint8_t reg, uint8_t count )
;Color_3_click_ARM.c,163 :: 		uint8_t *tmp_buffer = buffer;
;Color_3_click_ARM.c,160 :: 		void color_3_read( uint8_t *buffer, uint8_t reg, uint8_t count )
STRB	R2, [SP, #24]
; tmp_buffer end address is: 40 (R10)
; reg end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; reg start address is: 4 (R1)
;Color_3_click_ARM.c,162 :: 		uint8_t read_reg_cmd[ 20 ] = { 0 };
ADD	R11, SP, #4
ADD	R10, R11, #20
MOVW	R12, #lo_addr(?ICScolor_3_read_read_reg_cmd_L0+0)
MOVT	R12, #hi_addr(?ICScolor_3_read_read_reg_cmd_L0+0)
BL	___CC2DW+0
;Color_3_click_ARM.c,163 :: 		uint8_t *tmp_buffer = buffer;
; tmp_buffer start address is: 40 (R10)
MOV	R10, R0
; buffer end address is: 0 (R0)
;Color_3_click_ARM.c,165 :: 		read_reg_cmd[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_AUTOINC | reg;
ADD	R4, SP, #4
ORR	R3, R1, #160
; reg end address is: 4 (R1)
STRB	R3, [R4, #0]
;Color_3_click_ARM.c,167 :: 		I2C1_Start();
BL	_I2C1_Start+0
;Color_3_click_ARM.c,168 :: 		I2C1_Write( _i2c_address, read_reg_cmd, 1, END_MODE_STOP );
ADD	R4, SP, #4
MOVW	R3, #lo_addr(__i2c_address+0)
MOVT	R3, #hi_addr(__i2c_address+0)
LDRB	R3, [R3, #0]
MOVS	R2, #1
MOV	R1, R4
UXTB	R0, R3
MOVW	R3, #1
BL	_I2C1_Write+0
;Color_3_click_ARM.c,169 :: 		I2C1_Start();
BL	_I2C1_Start+0
;Color_3_click_ARM.c,170 :: 		I2C1_Read( _i2c_address, tmp_buffer, count, END_MODE_STOP );
MOVW	R3, #lo_addr(__i2c_address+0)
MOVT	R3, #hi_addr(__i2c_address+0)
LDRB	R3, [R3, #0]
LDRB	R2, [SP, #24]
MOV	R1, R10
UXTB	R0, R3
; tmp_buffer end address is: 40 (R10)
MOVW	R3, #1
BL	_I2C1_Read+0
;Color_3_click_ARM.c,172 :: 		}
L_end_color_3_read:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _color_3_read
_color_3_write:
;Color_3_click_ARM.c,174 :: 		void color_3_write( uint8_t *buffer, uint8_t reg, uint8_t count )
; count start address is: 8 (R2)
; reg start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
MOV	R4, R0
; count end address is: 8 (R2)
; reg end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 16 (R4)
; reg start address is: 4 (R1)
; count start address is: 8 (R2)
;Color_3_click_ARM.c,178 :: 		uint16_t i          = 0;
; i start address is: 20 (R5)
MOVW	R5, #0
;Color_3_click_ARM.c,179 :: 		uint8_t *temp_ptr   = temp;
ADD	R3, SP, #4
;Color_3_click_ARM.c,180 :: 		uint8_t *buff_ptr   = buffer;
; buff_ptr start address is: 0 (R0)
MOV	R0, R4
; buffer end address is: 16 (R4)
;Color_3_click_ARM.c,183 :: 		temp[ i++ ] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_AUTOINC | reg;
ADDS	R4, R3, R5
ORR	R3, R1, #160
; reg end address is: 4 (R1)
STRB	R3, [R4, #0]
ADD	R10, R5, #1
UXTH	R10, R10
; i end address is: 20 (R5)
; i start address is: 40 (R10)
; count end address is: 8 (R2)
; buff_ptr end address is: 0 (R0)
; i end address is: 40 (R10)
MOV	R1, R0
UXTB	R0, R2
;Color_3_click_ARM.c,185 :: 		while ( count-- )
L_color_3_write16:
; i start address is: 40 (R10)
; count start address is: 0 (R0)
; buff_ptr start address is: 4 (R1)
; count start address is: 0 (R0)
UXTB	R4, R0
SUBS	R3, R0, #1
UXTB	R0, R3
; count end address is: 0 (R0)
CMP	R4, #0
IT	EQ
BEQ	L_color_3_write17
; count end address is: 0 (R0)
;Color_3_click_ARM.c,186 :: 		temp[ i++ ] = *( buff_ptr++ );
; count start address is: 0 (R0)
ADD	R3, SP, #4
ADD	R4, R3, R10, LSL #0
LDRB	R3, [R1, #0]
STRB	R3, [R4, #0]
ADD	R10, R10, #1
UXTH	R10, R10
ADDS	R1, R1, #1
; count end address is: 0 (R0)
; buff_ptr end address is: 4 (R1)
IT	AL
BAL	L_color_3_write16
L_color_3_write17:
;Color_3_click_ARM.c,188 :: 		I2C1_Start();
BL	_I2C1_Start+0
;Color_3_click_ARM.c,189 :: 		I2C1_Write( _i2c_address, temp, i, END_MODE_STOP );
ADD	R4, SP, #4
MOVW	R3, #lo_addr(__i2c_address+0)
MOVT	R3, #hi_addr(__i2c_address+0)
LDRB	R3, [R3, #0]
UXTH	R2, R10
MOV	R1, R4
; i end address is: 40 (R10)
UXTB	R0, R3
MOVW	R3, #1
BL	_I2C1_Write+0
;Color_3_click_ARM.c,191 :: 		}
L_end_color_3_write:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _color_3_write
_color_3_init:
;Color_3_click_ARM.c,193 :: 		void color_3_init( void )
SUB	SP, SP, #28
STR	LR, [SP, #0]
;Color_3_click_ARM.c,195 :: 		uint8_t buffer[ 20 ]    = { TCS3771_CONTROL_PDIODE_IR };
ADD	R11, SP, #4
ADD	R10, R11, #20
MOVW	R12, #lo_addr(?ICScolor_3_init_buffer_L0+0)
MOVT	R12, #hi_addr(?ICScolor_3_init_buffer_L0+0)
BL	___CC2DW+0
;Color_3_click_ARM.c,200 :: 		color_3_write( buffer, TCS3771_CONTROL, 1 );
ADD	R0, SP, #4
STR	R0, [SP, #24]
MOVS	R2, #1
MOVS	R1, #15
BL	_color_3_write+0
;Color_3_click_ARM.c,202 :: 		buffer[0] = 0x00;
ADD	R1, SP, #4
MOVS	R0, #0
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,203 :: 		color_3_write( buffer, TCS3771_PPULSE, 1 );
LDR	R0, [SP, #24]
MOVS	R2, #1
MOVS	R1, #14
BL	_color_3_write+0
;Color_3_click_ARM.c,205 :: 		buffer[0] = 216;
ADD	R1, SP, #4
MOVS	R0, #216
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,206 :: 		color_3_write( buffer, TCS3771_WTIME, 1 );
LDR	R0, [SP, #24]
MOVS	R2, #1
MOVS	R1, #3
BL	_color_3_write+0
;Color_3_click_ARM.c,208 :: 		buffer[0] = 0x01;
ADD	R1, SP, #4
MOVS	R0, #1
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,209 :: 		buffer[1] = 0x30;
LDR	R2, [SP, #24]
ADDS	R1, R2, #1
MOVS	R0, #48
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,210 :: 		buffer[2] = 0x01;
ADDS	R1, R2, #2
MOVS	R0, #1
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,211 :: 		buffer[3] = 0x70;
ADDS	R1, R2, #3
MOVS	R0, #112
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,212 :: 		color_3_write( buffer, TCS3771_PILT, 4 );
MOVS	R1, #8
MOV	R0, R2
MOVS	R2, #4
BL	_color_3_write+0
;Color_3_click_ARM.c,214 :: 		buffer[0] = 0x01;
ADD	R1, SP, #4
MOVS	R0, #1
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,215 :: 		buffer[1] = 0x30;
LDR	R2, [SP, #24]
ADDS	R1, R2, #1
MOVS	R0, #48
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,216 :: 		buffer[2] = 0x01;
ADDS	R1, R2, #2
MOVS	R0, #1
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,217 :: 		buffer[3] = 0x70;
ADDS	R1, R2, #3
MOVS	R0, #112
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,218 :: 		color_3_write( buffer, TCS3771_AILT, 4 );
MOVS	R1, #4
MOV	R0, R2
MOVS	R2, #4
BL	_color_3_write+0
;Color_3_click_ARM.c,220 :: 		buffer[0] = TCS3771_PERS_PPERS(10);
ADD	R1, SP, #4
MOVS	R0, #160
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,221 :: 		color_3_write( buffer, TCS3771_PERS, 1 );
LDR	R0, [SP, #24]
MOVS	R2, #1
MOVS	R1, #12
BL	_color_3_write+0
;Color_3_click_ARM.c,223 :: 		buffer[0] = TCS3771_ENABLE_PON | TCS3771_ENABLE_PEN | TCS3771_ENABLE_WEN | TCS3771_ENABLE_AEN | TCS3771_ENABLE_PIEN | TCS3771_ENABLE_AIEN;
ADD	R1, SP, #4
MOVS	R0, #63
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,224 :: 		color_3_write( buffer, TCS3771_ENABLE, 1 );
LDR	R0, [SP, #24]
MOVS	R2, #1
MOVS	R1, #0
BL	_color_3_write+0
;Color_3_click_ARM.c,226 :: 		buffer[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_SPECIAL | 0x07;
ADD	R1, SP, #4
MOVS	R0, #231
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,227 :: 		I2C_Start();
BL	_I2C_Start+0
;Color_3_click_ARM.c,228 :: 		I2C_Write( _i2c_address, buffer, 1, END_MODE_STOP );
ADD	R1, SP, #4
MOVW	R0, #lo_addr(__i2c_address+0)
MOVT	R0, #hi_addr(__i2c_address+0)
LDRB	R0, [R0, #0]
MOVW	R3, #1
MOVS	R2, #1
BL	_I2C_Write+0
;Color_3_click_ARM.c,231 :: 		buffer[0] = 252;
ADD	R1, SP, #4
MOVS	R0, #252
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,232 :: 		color_3_write( buffer, TCS3771_ATIME, 1 );
LDR	R0, [SP, #24]
MOVS	R2, #1
MOVS	R1, #1
BL	_color_3_write+0
;Color_3_click_ARM.c,234 :: 		buffer[0] = 254;
ADD	R1, SP, #4
MOVS	R0, #254
STRB	R0, [R1, #0]
;Color_3_click_ARM.c,235 :: 		color_3_write( buffer, TCS3771_PTIME, 1 );
LDR	R0, [SP, #24]
MOVS	R2, #1
MOVS	R1, #2
BL	_color_3_write+0
;Color_3_click_ARM.c,237 :: 		}
L_end_color_3_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _color_3_init
