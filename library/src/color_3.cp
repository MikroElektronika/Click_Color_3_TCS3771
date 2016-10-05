#line 1 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3.c"
#line 1 "c:/users/corey/documents/projects/color_3/library/include/color_3.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for dspic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
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
#line 1 "c:/c4w/mikroelektronika/mikroc pro for dspic/include/stdint.h"
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
#line 94 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3.c"
void color_3_init( uint8_t address )
{
 uint8_t buffer[ 20 ] = {  (0b10 << 4)  };
 cmd_type_t type = NORMAL_TYPE;

 color_3_hal_init( address, 1 );

 color_3_hal_write( buffer,  0x0f , 1, type );

 buffer[0] = 0x00;
 color_3_hal_write( buffer,  0x0e , 1, type );

 buffer[0] = 216;
 color_3_hal_write( buffer,  0x03 , 1, type );

 buffer[0] = 0x01;
 buffer[1] = 0x30;
 buffer[2] = 0x01;
 buffer[3] = 0x70;
 color_3_hal_write( buffer,  0x08 , 4, type );

 buffer[0] = 0x01;
 buffer[1] = 0x30;
 buffer[2] = 0x01;
 buffer[3] = 0x70;
 color_3_hal_write( buffer,  0x04 , 4, type );

 buffer[0] =  ((10) << 4) ;
 color_3_hal_write( buffer,  0x0c , 1, type );

 buffer[0] =  (1 << 0)  |  (1 << 2)  |  (1 << 3)  |  (1 << 1)  |  (1 << 5)  |  (1 << 4) ;
 color_3_hal_write( buffer,  0x00 , 1, type );

 type = SPECIAL_TYPE;
 color_3_hal_write( buffer, 0, 0, type );

 type = NORMAL_TYPE;
 buffer[0] = 252;
 color_3_hal_write( buffer,  0x01 , 1, type );

 buffer[0] = 254;
 color_3_hal_write( buffer,  0x02 , 1, type );
}


void color_3_get_rgb_data( color_t* color )
{
 uint8_t buffer[ 20 ] = { 0 };
 uint8_t uart_text[ 20 ] = { 0 };
 uint8_t l_byte, h_byte;
 uint16_t big_byte;
 uint8_t count = 8;

 color_3_hal_read( buffer,  0x14 , 8 );

 l_byte = buffer[0];
 h_byte = buffer[1];
 big_byte = l_byte;
 big_byte |= (uint16_t)h_byte << 8;
 color->clear_data = big_byte;

 l_byte = buffer[2];
 h_byte = buffer[3];
 big_byte = l_byte;
 big_byte |= (uint16_t)h_byte << 8;
 color->red_data = big_byte;

 l_byte = buffer[4];
 h_byte = buffer[5];
 big_byte = l_byte;
 big_byte |= (uint16_t)h_byte << 8;
 color->green_data = big_byte;

 l_byte = buffer[6];
 h_byte = buffer[7];
 big_byte = l_byte;
 big_byte |= (uint16_t)h_byte << 8;
 color->blue_data = big_byte;

}
