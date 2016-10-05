#line 1 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
#line 1 "c:/users/corey/documents/projects/color_3/library/include/color_3_hal.h"
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
#line 35 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
static uint8_t _i2c_hw_address;
static uint8_t _cmd_size = 1;
#line 40 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
static uint8_t NACK_BIT = 0x01;
static uint8_t ACK_BIT = 0x00;
#line 97 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
static unsigned int ( *is_idle_i2c_p ) ( void );
static unsigned int ( *start_i2c_p ) ( void );
static void ( *stop_i2c_p ) ( void );
static void ( *restart_i2c_p ) ( void );
static unsigned int ( *write_i2c_p ) ( unsigned char data_out );
static unsigned char( *read_i2c_p ) ( unsigned int ack );
#line 128 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
extern sfr sbit COLOR_3_RST_PIN;
#line 135 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
void color_3_hal_init( uint8_t address_id, uint8_t command_size )
{
#line 190 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
 is_idle_i2c_p = I2C2_Is_Idle;
 start_i2c_p = I2C2_Start;
 stop_i2c_p = I2C2_Stop;
 restart_i2c_p = I2C2_Restart;
 write_i2c_p = I2C2_Write;
 read_i2c_p = I2C2_Read;
#line 216 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
 _i2c_hw_address = ( address_id << 1 );


 _cmd_size = command_size;
}

void color_3_hal_write( uint8_t *buffer, uint8_t reg, uint16_t count, cmd_type_t type )
{
 uint8_t ptr[20] = { 0 };
 uint8_t i = 0;

 if ( type == NORMAL_TYPE )
 ptr[0] =  (1 << 7)  |  (0b01 << 5)  | reg;
 else if ( type == SPECIAL_TYPE )
 ptr[0] =  (1 << 7)  |  (3 << 5)  | 0x07;

 memcpy( &ptr[ 1 ], buffer, count );

 count += 1;
#line 274 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
 i = 0;
 start_i2c_p();
 write_i2c_p( _i2c_hw_address |  0  );
 if ( count > 1 )
 {
 while ( count-- )
 write_i2c_p( ptr[i++] );

 }
 else if ( count == 1 )
 write_i2c_p( ptr[0] );

 stop_i2c_p();

}

void color_3_hal_read( uint8_t *buffer, uint8_t reg, uint8_t count )
{
 uint8_t cnt = _cmd_size;
 uint8_t *ptr = buffer;
 uint8_t read_reg_cmd[10] = { 0 };

 read_reg_cmd[0] =  (1 << 7)  |  (0b01 << 5)  | reg;
#line 335 "C:/Users/Corey/Documents/Projects/Color_3/library/src/color_3_hal.c"
 start_i2c_p();
 write_i2c_p( _i2c_hw_address |  0  );

 while ( cnt-- )
 write_i2c_p( read_reg_cmd[0] );

 stop_i2c_p();

 ptr = buffer;

 start_i2c_p();
 write_i2c_p( _i2c_hw_address |  1  );

 while ( --count )
 {
 *ptr++ = read_i2c_p( ACK_BIT );
 }

 *ptr = read_i2c_p( NACK_BIT );

 stop_i2c_p();

}
