/**
 * @file                                               color_3.c
 *
 * @brief                                  Color 3 click
 * @author                                                MikroElektronika Team
 * @date                                                 04/10/16
 *
 * @par
 *          Functions set for Color 3.
 *
 * @version
 *          - 1.0.0 Initial version
 *          - 1.0.1 Doxy added ( Color 3 )
 *
 * @par
 *          [Datasheet](../datasheet/color_3.pdf)
 *
 * @copyright
 *          ####[GNU GPL 2](../../COPYING)
 *
 ******************************************************************************/
#include "color_3.h"
#include "color_3_hal.h"

/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/
#define TCS3771_COMMAND_TYPE_SPECIAL (3 << 5)
#define TCS3771_COMMAND_TYPE_AUTOINC (0b01 << 5)
#define TCS3771_COMMAND_SELECT (1 << 7)

#define TCS3771_ENABLE 0x00
#define TCS3771_ENABLE_PON (1 << 0)
#define TCS3771_ENABLE_AEN (1 << 1)
#define TCS3771_ENABLE_PEN (1 << 2)
#define TCS3771_ENABLE_WEN (1 << 3)
#define TCS3771_ENABLE_AIEN (1 << 4)
#define TCS3771_ENABLE_PIEN (1 << 5)

#define TCS3771_ATIME 0x01
#define TCS3771_PTIME 0x02
#define TCS3771_WTIME 0x03
#define TCS3771_AILT 0x04
#define TCS3771_AIHT 0x06
#define TCS3771_PILT 0x08
#define TCS3771_PIHT 0x0a

#define TCS3771_PERS 0x0c
#define TCS3771_PERS_PPERS(x) ((x) << 4)
#define TCS3771_PERS_APERS(x) ((x) & 0xf)

#define TCS3771_CONF 0x0d
#define TCS3771_CONF_WLONG (1 << 1)

#define TCS3771_PPULSE 0x0e

#define TCS3771_CONTROL 0x0f
#define TCS3771_CONTROL_PDIODE_IR (0b10 << 4)

#define TCS3771_ID 0x12
#define TCS3771_STATUS 0x13
#define TCS3771_PDATA 0x1c
#define TCS3771_CDATA 0x14

/******************************************************************************
* Module Preprocessor Macros
*******************************************************************************/

/******************************************************************************
* Module Typedefs
*******************************************************************************/

/******************************************************************************
* Module Variable Definitions
*******************************************************************************/


/******************************************************************************
* Function Prototypes
*******************************************************************************/



/******************************************************************************
* Private Function Definitions
*******************************************************************************/



/******************************************************************************
* Public Function Definitions
*******************************************************************************/

void color_3_init( uint8_t address )
{
        uint8_t buffer[ 20 ]    = { TCS3771_CONTROL_PDIODE_IR };
        cmd_type_t type = NORMAL_TYPE;

        color_3_hal_init( address, 1 );

        color_3_hal_write( buffer, TCS3771_CONTROL, 1, type );

        buffer[0] = 0x00;
        color_3_hal_write( buffer, TCS3771_PPULSE, 1, type );

        buffer[0] = 216;
        color_3_hal_write( buffer, TCS3771_WTIME, 1, type );

        buffer[0] = 0x01;
        buffer[1] = 0x30;
        buffer[2] = 0x01;
        buffer[3] = 0x70;
        color_3_hal_write( buffer, TCS3771_PILT, 4, type );

        buffer[0] = 0x01;
        buffer[1] = 0x30;
        buffer[2] = 0x01;
        buffer[3] = 0x70;
        color_3_hal_write( buffer, TCS3771_AILT, 4, type );

        buffer[0] = TCS3771_PERS_PPERS(10);
        color_3_hal_write( buffer, TCS3771_PERS, 1, type );

        buffer[0] = TCS3771_ENABLE_PON | TCS3771_ENABLE_PEN | TCS3771_ENABLE_WEN | TCS3771_ENABLE_AEN | TCS3771_ENABLE_PIEN | TCS3771_ENABLE_AIEN;
        color_3_hal_write( buffer, TCS3771_ENABLE, 1, type );

        type = SPECIAL_TYPE;
        color_3_hal_write( buffer, 0, 0, type );

        type = NORMAL_TYPE;
        buffer[0] = 252;
        color_3_hal_write( buffer, TCS3771_ATIME, 1, type );

        buffer[0] = 254;
        color_3_hal_write( buffer, TCS3771_PTIME, 1, type );
}


void color_3_get_rgb_data( color_t* color )
{
        uint8_t buffer[ 20 ] = { 0 };
        uint8_t uart_text[ 20 ] = { 0 };
        uint8_t l_byte, h_byte;
        uint16_t big_byte;
        uint8_t count = 8;

        color_3_hal_read( buffer, TCS3771_CDATA, 8 );
        //Clear Data
        l_byte = buffer[0];
        h_byte = buffer[1];
        big_byte =  l_byte;
        big_byte |= (uint16_t)h_byte << 8;
        color->clear_data = big_byte;
        //Red Data
        l_byte = buffer[2];
        h_byte = buffer[3];
        big_byte =  l_byte;
        big_byte |= (uint16_t)h_byte << 8;
        color->red_data = big_byte;
        //Green Data
        l_byte = buffer[4];
        h_byte = buffer[5];
        big_byte =  l_byte;
        big_byte |= (uint16_t)h_byte << 8;
        color->green_data = big_byte;
        //Blue Data
        l_byte = buffer[6];
        h_byte = buffer[7];
        big_byte =  l_byte;
        big_byte |= (uint16_t)h_byte << 8;
        color->blue_data = big_byte;

}
/*******************************************************************************
*                                                                 End of File
*******************************************************************************/