#line 1 "C:/Users/Corey/Documents/Projects/Color_3/PIC32/Color_3_PIC32.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"




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
#line 1 "c:/users/corey/documents/projects/color_3/library/include/color_3.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 45 "c:/users/corey/documents/projects/color_3/library/include/color_3.h"
typedef struct
{
 uint16_t clear_data;
 uint16_t red_data;
 uint16_t green_data;
 uint16_t blue_data;
} color_t;
#line 79 "c:/users/corey/documents/projects/color_3/library/include/color_3.h"
void color_3_init( uint8_t address );

void color_3_get_rgb_data( color_t* color );
#line 1 "c:/users/corey/documents/projects/color_3/library/include/color_3_hal.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 34 "c:/users/corey/documents/projects/color_3/library/include/color_3_hal.h"
typedef enum
{
 SPECIAL_TYPE = 0,
 NORMAL_TYPE = 1
} cmd_type_t;
#line 54 "c:/users/corey/documents/projects/color_3/library/include/color_3_hal.h"
void color_3_hal_init( uint8_t address_id, uint8_t command_size );
#line 65 "c:/users/corey/documents/projects/color_3/library/include/color_3_hal.h"
void color_3_hal_write( uint8_t *buffer, uint8_t reg, uint16_t count, cmd_type_t type );
#line 79 "c:/users/corey/documents/projects/color_3/library/include/color_3_hal.h"
void color_3_hal_read( uint8_t *buffer, uint8_t reg, uint8_t count );
#line 5 "C:/Users/Corey/Documents/Projects/Color_3/PIC32/Color_3_PIC32.c"
void system_setup( void );

uint8_t _i2c_address = 0x29;

void main()
{

 uint8_t id_buffer[6] = { 0 };
 uint8_t id_reg = 0x12;
 uint8_t uart_text[25] = { 0 };
 color_t my_color;


 system_setup();


 UART2_Write_Text( "Device ID:  " );
 color_3_hal_read( id_buffer, id_reg, 1 );
 IntToHex( id_buffer[0], uart_text );
 UART2_Write_Text( uart_text );
 UART2_Write_Text( "\r\n\r\n\r\n" );
 Delay_ms(1000);

 while(1)
 {
 color_3_get_rgb_data( &my_color );

 UART2_Write_Text( "Clear Data: " );
 IntToStr( my_color.clear_data, uart_text );
 UART2_Write_Text( uart_text );
 UART2_Write_Text( "\r\n" );

 UART2_Write_Text( "Red Data:   " );
 IntToStr( my_color.red_data, uart_text );
 UART2_Write_Text( uart_text );
 UART2_Write_Text( "\r\n" );

 UART2_Write_Text( "Green Data: " );
 IntToStr( my_color.green_data, uart_text );
 UART2_Write_Text( uart_text );
 UART2_Write_Text( "\r\n" );

 UART2_Write_Text( "Blue Data:  " );
 IntToStr( my_color.blue_data, uart_text );
 UART2_Write_Text( uart_text );
 UART2_Write_Text( "\r\n" );

 Delay_ms(1000);
 }
}

void system_setup( void )
{


 UART2_Init( 9600 );
 Delay_ms(300);
 UART2_Write_Text( "UART Initialized\r\n" );


 I2C1_Init( 100000 );
 Delay_ms(500);
 UART2_Write_Text( "I2C Initialized\r\n" );

 color_3_init( _i2c_address );
 Delay_ms(300);

 UART2_Write_Text( "Color 3 Initialized\r\n" );
}
