#line 1 "C:/Users/Corey/Documents/Projects/Color_3/ARM/Test/Color_3_click_ARM.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 41 "C:/Users/Corey/Documents/Projects/Color_3/ARM/Test/Color_3_click_ARM.c"
sbit INT at GPIOD_IDR.B10;

void system_setup( void );
void color_3_init( void );
void color_3_read( uint8_t *buffer, uint8_t reg, uint8_t count );
void color_3_write( uint8_t *buffer, uint8_t reg, uint8_t count );
void color_3_start( void );

uint8_t _i2c_address = 0x29;

typedef struct
{
 uint16_t red;
 uint16_t green;
 uint16_t blue;
} color_t;

void main()
{

 uint8_t id_buffer[20] = { 0 };
 uint8_t id_reg = 0x12;
 uint8_t uart_text[25] = { 0 };
 uint8_t l_byte = 0;
 uint8_t h_byte = 0;
 uint16_t big_byte = 0;
 color_t color;


 system_setup();


 UART1_Write_Text( "Device ID:  " );
 color_3_read( id_buffer, 0x12, 1 );
 IntToHex( id_buffer[0], uart_text );
 UART1_Write_Text( uart_text );
 UART1_Write_Text( "\r\n\r\n\r\n" );
 Delay_ms(1000);

 while(1)
 {
 while( INT == 1 );

 color_3_read( id_buffer,  0x14 , 8 );

 l_byte = id_buffer[0];
 h_byte = id_buffer[1];
 big_byte = l_byte;
 big_byte |= (uint16_t)h_byte << 8;

 UART1_Write_Text( "Clear Data: " );
 IntToStr( big_byte, uart_text );
 UART1_Write_Text( uart_text );
 UART1_Write_Text( "\r\n" );

 l_byte = id_buffer[2];
 h_byte = id_buffer[3];
 big_byte = l_byte;
 big_byte |= (uint16_t)h_byte << 8;

 UART1_Write_Text( "Red Data:   " );
 IntToStr( big_byte, uart_text );
 UART1_Write_Text( uart_text );
 UART1_Write_Text( "\r\n" );

 l_byte = id_buffer[4];
 h_byte = id_buffer[5];
 big_byte = l_byte;
 big_byte |= (uint16_t)h_byte << 8;

 UART1_Write_Text( "Green Data: " );
 IntToStr( big_byte, uart_text );
 UART1_Write_Text( uart_text );
 UART1_Write_Text( "\r\n" );

 l_byte = id_buffer[6];
 h_byte = id_buffer[7];
 big_byte = l_byte;
 big_byte |= (uint16_t)h_byte << 8;

 UART1_Write_Text( "Blue Data:  " );
 IntToStr( big_byte, uart_text );
 UART1_Write_Text( uart_text );
 UART1_Write_Text( "\r\n\r\n\r\n" );

 Delay_ms(1000);
 }
}

void system_setup( void )
{


 GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10 );
 Delay_ms(300);


 UART1_Init( 115200 );
 Delay_ms(300);
 UART1_Write_Text( "UART Initialized\r\n" );


 I2C1_Init_Advanced( 100000, &_GPIO_MODULE_I2C1_PB67 );
 Delay_ms(500);
 UART1_Write_Text( "I2C Initialized\r\n" );
#line 149 "C:/Users/Corey/Documents/Projects/Color_3/ARM/Test/Color_3_click_ARM.c"
 _i2c_address = _i2c_address;
#line 154 "C:/Users/Corey/Documents/Projects/Color_3/ARM/Test/Color_3_click_ARM.c"
 color_3_init();
 Delay_ms(300);

 UART1_Write_Text( "Color 3 Initialized\r\n" );
}

void color_3_read( uint8_t *buffer, uint8_t reg, uint8_t count )
{
 uint8_t read_reg_cmd[ 20 ] = { 0 };
 uint8_t *tmp_buffer = buffer;

 read_reg_cmd[0] =  (1 << 7)  |  (0b01 << 5)  | reg;

 I2C1_Start();
 I2C1_Write( _i2c_address, read_reg_cmd, 1, END_MODE_STOP );
 I2C1_Start();
 I2C1_Read( _i2c_address, tmp_buffer, count, END_MODE_STOP );

}

void color_3_write( uint8_t *buffer, uint8_t reg, uint8_t count )
{
 uint8_t temp[ 20 ];

 uint16_t i = 0;
 uint8_t *temp_ptr = temp;
 uint8_t *buff_ptr = buffer;


 temp[ i++ ] =  (1 << 7)  |  (0b01 << 5)  | reg;

 while ( count-- )
 temp[ i++ ] = *( buff_ptr++ );

 I2C1_Start();
 I2C1_Write( _i2c_address, temp, i, END_MODE_STOP );

}

void color_3_init( void )
{
 uint8_t buffer[ 20 ] = {  (0b10 << 4)  };




 color_3_write( buffer,  0x0f , 1 );

 buffer[0] = 0x00;
 color_3_write( buffer,  0x0e , 1 );

 buffer[0] = 216;
 color_3_write( buffer,  0x03 , 1 );

 buffer[0] = 0x01;
 buffer[1] = 0x30;
 buffer[2] = 0x01;
 buffer[3] = 0x70;
 color_3_write( buffer,  0x08 , 4 );

 buffer[0] = 0x01;
 buffer[1] = 0x30;
 buffer[2] = 0x01;
 buffer[3] = 0x70;
 color_3_write( buffer,  0x04 , 4 );

 buffer[0] =  ((10) << 4) ;
 color_3_write( buffer,  0x0c , 1 );

 buffer[0] =  (1 << 0)  |  (1 << 2)  |  (1 << 3)  |  (1 << 1)  |  (1 << 5)  |  (1 << 4) ;
 color_3_write( buffer,  0x00 , 1 );

 buffer[0] =  (1 << 7)  |  (3 << 5)  | 0x07;
 I2C_Start();
 I2C_Write( _i2c_address, buffer, 1, END_MODE_STOP );


 buffer[0] = 252;
 color_3_write( buffer,  0x01 , 1 );

 buffer[0] = 254;
 color_3_write( buffer,  0x02 , 1 );

}
