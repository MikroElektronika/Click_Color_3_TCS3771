/*******************************************************************************
* Title                 :   color_3 click
* Filename              :   color_3_hal.c
* Author                :   CAL
* Origin Date           :   04/10/2016
* Notes                 :   None
*******************************************************************************/
/*************** MODULE REVISION LOG ******************************************
*
*    Date    Software Version    Initials   Description
*  04/10/2016    XXXXXXXXXXX         CAL      Interface Created.
*
*******************************************************************************/
/**
 * @file color_3_hal.c
 * @brief <h2> HAL layer </h2>
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include "color_3_hal.h"

/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/
#define READ_BIT                1
#define WRITE_BIT               0
/******************************************************************************
* Module Variable Definitions
*******************************************************************************/

static uint8_t _i2c_hw_address;
static uint8_t _cmd_size = 1;

#if defined( __MIKROC_PRO_FOR_PIC32__ ) || \
    defined( __MIKROC_PRO_FOR_DSPIC__ )
static uint8_t NACK_BIT   = 0x01;
static uint8_t ACK_BIT    = 0x00;
#elif defined( __MIKROC_PRO_FOR_PIC__ ) || \
      defined( __MIKROC_PRO_FOR_AVR__ )
static uint8_t NACK_BIT   = 0x00;
static uint8_t ACK_BIT    = 0x01;
#endif

#if defined( __MIKROC_PRO_FOR_ARM__ )
#if defined( __STM32__ )
static unsigned int ( *start_i2c_p )            ( void );
static unsigned int ( *write_i2c_p )            ( unsigned char slave_address,
        unsigned char *buffer,
        unsigned long count,
        unsigned long end_mode );
static void         ( *read_i2c_p )             ( unsigned char slave_address,
        unsigned char *buffer,
        unsigned long count,
        unsigned long end_mode );

#elif defined( __TM__ )
static void         ( *enable_i2c_p )           ( void );
static void         ( *disable_i2c_p )          ( void );
static void         ( *set_slave_address_i2c_p )( unsigned char slave_address,
        unsigned char dir );
static void         ( *write_i2c_p )            ( unsigned char data_out,
        unsigned char mode );
static void         ( *read_i2c_p )             ( unsigned char *data,
        unsigned char mode );
#endif

#elif  defined( __MIKROC_PRO_FOR_AVR__ )
static unsigned char( *busy_i2c_p )             ( void );
static unsigned char( *status_i2c_p )           ( void );
static unsigned char( *start_i2c_p )            ( void );
static void         ( *stop_i2c_p )             ( void );
static void         ( *close_i2c_p )            ( void );
static void         ( *write_i2c_p )            ( unsigned char data_out );
static unsigned char( *read_i2c_p )             ( unsigned char ack );

#elif  defined( __MIKROC_PRO_FOR_PIC__ )
static unsigned char( *is_idle_i2c_p )          ( void );
static unsigned char( *start_i2c_p )            ( void );
static void         ( *stop_i2c_p )             ( void );
static void         ( *restart_i2c_p )          ( void );
static unsigned char( *write_i2c_p )            ( unsigned char data_out );
static unsigned char( *read_i2c_p )             ( unsigned char ack );

#elif defined( __MIKROC_PRO_FOR_PIC32__ )
static unsigned int ( *is_idle_i2c_p )          ( void );
static unsigned int ( *start_i2c_p )            ( void );
static void         ( *stop_i2c_p )             ( void );
static unsigned int ( *restart_i2c_p )          ( void );
static unsigned int ( *write_i2c_p )            ( unsigned char data_out );
static unsigned char( *read_i2c_p )             ( unsigned int ack );

#elif defined( __MIKROC_PRO_FOR_DSPIC__ )
static unsigned int ( *is_idle_i2c_p )          ( void );
static unsigned int ( *start_i2c_p )            ( void );
static void         ( *stop_i2c_p )             ( void );
static void         ( *restart_i2c_p )          ( void );
static unsigned int ( *write_i2c_p )            ( unsigned char data_out );
static unsigned char( *read_i2c_p )             ( unsigned int ack );

#elif defined( __MIKROC_PRO_FOR_8051__ )
static unsigned char( *status_i2c_p )           ( void );
static unsigned char( *start_i2c_p )            ( void );
static void         ( *stop_i2c_p )             ( void );
static void         ( *close_i2c_p )            ( void );
static void         ( *write_i2c_p )            ( unsigned char data_out );
static unsigned char( *read_i2c_p )             ( unsigned char ack );

#elif defined( __MIKROC_PRO_FOR_FT90x__ )
static void         ( *soft_reset_i2c_p )       ( void );
static void         ( *set_slave_address_i2c_p )( unsigned char slave_address );
static unsigned char( *write_i2c_p )            ( unsigned char *buffer,
        unsigned int count );
static unsigned char( *read_i2c_p )         ( unsigned char *buffer,
        unsigned int count );
#endif

#if defined( __MIKROC_PRO_FOR_ARM__ )   || \
    defined( __MIKROC_PRO_FOR_AVR__ )   || \
    defined( __MIKROC_PRO_FOR_PIC__ )   || \
    defined( __MIKROC_PRO_FOR_PIC32__ ) || \
    defined( __MIKROC_PRO_FOR_DSPIC__ ) || \
    defined( __MIKROC_PRO_FOR_8051__ )  || \
    defined( __MIKROC_PRO_FOR_FT90x__ )
extern sfr sbit COLOR_3_RST_PIN;
#endif

/******************************************************************************
* Function Definitions
*******************************************************************************/

void color_3_hal_init( uint8_t address_id, uint8_t command_size )
{
#if defined( __MIKROC_PRO_FOR_ARM__ )
#if defined( __STM32__ )
    start_i2c_p                 = I2C_Start_Ptr;
    write_i2c_p                 = I2C_Write_Ptr;
    read_i2c_p                  = I2C_Read_Ptr;

#elif defined( __TM__ )
    enable_i2c_p                = I2C_Enable_Ptr;
    disable_i2c_p               = I2C_Disable_Ptr;
    set_slave_address_i2c_p     = I2C_Master_Slave_Addr_Set_Ptr;
    write_i2c_p                 = I2C_Write_Ptr;
    read_i2c_p                  = I2C_Read_Ptr;

#endif

#elif defined( __MIKROC_PRO_FOR_AVR__ )
#if defined( __ATMEGA__ )
    busy_i2c_p                  = TWI_Busy;
    status_i2c_p                = TWI_Status;
    close_i2c_p                 = TWI_Close;
    start_i2c_p                 = TWI_Start;
    stop_i2c_p                  = TWI_Stop;
    write_i2c_p                 = TWI_Write;
    read_i2c_p                  = TWI_Read;

#elif defined( __ATXMEGA__ )
    busy_i2c_p                  = TWIC_Busy;
    status_i2c_p                = TWIC_Status;
    close_i2c_p                 = TWIC_Close;
    start_i2c_p                 = TWIC_Start;
    stop_i2c_p                  = TWIC_Stop;
    write_i2c_p                 = TWIC_Write;
    read_i2c_p                  = TWIC_Read;

#endif

#elif defined( __MIKROC_PRO_FOR_PIC__ )
    is_idle_i2c_p               = I2C1_Is_Idle;
    start_i2c_p                 = I2C1_Start;
    stop_i2c_p                  = I2C1_Stop;
    restart_i2c_p               = I2C1_Repeated_Start;
    write_i2c_p                 = I2C1_Wr;
    read_i2c_p                  = I2C1_Rd;

#elif defined( __MIKROC_PRO_FOR_PIC32__ )
    is_idle_i2c_p               = I2C_Is_Idle_Ptr;
    start_i2c_p                 = I2C_Start_Ptr;
    stop_i2c_p                  = I2C_Stop_Ptr;
    restart_i2c_p               = I2C_Restart_Ptr;
    write_i2c_p                 = I2C_Write_Ptr;
    read_i2c_p                  = I2C_Read_Ptr;

#elif defined( __MIKROC_PRO_FOR_DSPIC__ )
    is_idle_i2c_p               = I2C2_Is_Idle;
    start_i2c_p                 = I2C2_Start;
    stop_i2c_p                  = I2C2_Stop;
    restart_i2c_p               = I2C2_Restart;
    write_i2c_p                 = I2C2_Write;
    read_i2c_p                  = I2C2_Read;

#elif defined( __MIKROC_PRO_FOR_8051__ )
    status_i2c_p                = TWI_Status;
    close_i2c_p                 = TWI_Close;
    start_i2c_p                 = TWI_Start;
    stop_i2c_p                  = TWI_Stop;
    write_i2c_p                 = TWI_Write;
    read_i2c_p                  = TWI_Read;

#elif defined( __MIKROC_PRO_FOR_FT90x__ )
    soft_reset_i2c_p            = I2CM_Soft_Reset_Ptr;
    set_slave_address_i2c_p     = I2CM_Set_Slave_Address_Ptr;
    write_i2c_p                 = I2CM_Write_Bytes_Ptr;
    read_i2c_p                  = I2CM_Read_Bytes_Ptr;
#endif

#if defined( __MIKROC_PRO_FOR_ARM__ )   ||  \
    defined( __MIKROC_PRO_FOR_FT90x__ )
    _i2c_hw_address             = address_id;
#else
    _i2c_hw_address             = ( address_id << 1 );
#endif

    _cmd_size = command_size;
}

void color_3_hal_write( uint8_t *buffer, uint8_t reg, uint16_t count, cmd_type_t type )
{
    uint8_t ptr[20] = { 0 };
    uint8_t i = 0;

    if ( type == NORMAL_TYPE )
        ptr[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_AUTOINC | reg;
    else if ( type == SPECIAL_TYPE )
        ptr[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_SPECIAL | 0x07;

    memcpy( &ptr[ 1 ], buffer, count );

    count += 1;
#if defined(__MIKROC_PRO_FOR_ARM__)
#if defined( __STM32__ )
    start_i2c_p();
    write_i2c_p( _i2c_hw_address, ptr, count, END_MODE_STOP );

#elif defined( __TM__ )
    set_slave_address_i2c_p( _i2c_hw_address, _I2C_DIR_MASTER_TRANSMIT );

    if ( count == 2 )
    {
        write_i2c_p( *ptr++, _I2C_MASTER_MODE_BURST_SEND_START );
        write_i2c_p( *ptr, _I2C_MASTER_MODE_BURST_SEND_STOP );

    }
    else if ( count == 0 )
    {
        write_i2c_p( *ptr, _I2C_MASTER_MODE_BURST_SEND_STOP );
    } else {

        write_i2c_p( *ptr++, _I2C_MASTER_MODE_BURST_SEND_START );

        while ( count-- > 1 )
            write_i2c_p( *ptr++, _I2C_MASTER_MODE_BURST_SEND_CONT );

        write_i2c_p( *ptr, _I2C_MASTER_MODE_BURST_SEND_FINISH );
    }
#endif

#elif defined( __MIKROC_PRO_FOR_FT90x__ )
    set_slave_address_i2c_p( _i2c_hw_address );
    if( count == 1 )
        I2CM1_Write( ptr[0] );
    else
        write_i2c_p( ptr, count );
#elif defined( __MIKROC_PRO_FOR_AVR__ )   || \
      defined( __MIKROC_PRO_FOR_8051__ )  || \
      defined( __MIKROC_PRO_FOR_DSPIC__ ) || \
      defined( __MIKROC_PRO_FOR_PIC32__ ) || \
      defined( __MIKROC_PRO_FOR_PIC__ )
    i = 0;
    start_i2c_p();
    write_i2c_p( _i2c_hw_address | WRITE_BIT );
    if ( count > 1 )
    {
        while ( count-- )
            write_i2c_p( ptr[i++] );

    }
    else if ( count == 1 )
        write_i2c_p( ptr[0] );

    stop_i2c_p();
#endif
}

void color_3_hal_read( uint8_t *buffer, uint8_t reg, uint8_t count )
{
    uint8_t cnt  = _cmd_size;
    uint8_t *ptr = buffer;
    uint8_t read_reg_cmd[10] = { 0 };

    read_reg_cmd[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_AUTOINC | reg;
    //read_reg_cmd[0] = 0xD4;
#if defined(__MIKROC_PRO_FOR_ARM__)
#if defined( __STM32__ )
    start_i2c_p();
    write_i2c_p( _i2c_hw_address, read_reg_cmd, _cmd_size, END_MODE_RESTART );
    read_i2c_p( _i2c_hw_address, ptr, count, END_MODE_STOP );

#elif defined( __TM__ )
    set_slave_address_i2c_p( _i2c_hw_address, _I2C_DIR_MASTER_TRANSMIT );
    write_i2c_p( read_reg_cmd[0], _I2C_MASTER_MODE_SINGLE_SEND );
    ptr = buffer;
    set_slave_address_i2c_p( _i2c_hw_address, _I2C_DIR_MASTER_RECEIVE );

    if ( count == 1 )
    {
        read_i2c_p( ptr, _I2C_MASTER_MODE_BURST_SINGLE_RECEIVE );

    }
    else {

        read_i2c_p( ptr++ , _I2C_MASTER_MODE_BURST_RECEIVE_START ) )

        while ( --count > 1 )
        read_i2c_p( ptr++ , _I2C_MASTER_MODE_BURST_SEND_CONT );

        read_i2c_p( ptr, _I2C_MASTER_MODE_BURST_SEND_FINISH );
    }
#endif

#elif defined( __MIKROC_PRO_FOR_FT90x__ )
    set_slave_address_i2c_p( _i2c_hw_address );
    write_i2c_p( read_reg_cmd, 1 );
    read_i2c_p( ptr, count );
#elif defined( __MIKROC_PRO_FOR_AVR__ )    || \
      defined( __MIKROC_PRO_FOR_PIC32__ )  || \
      defined( __MIKROC_PRO_FOR_8051__ )   || \
      defined( __MIKROC_PRO_FOR_PIC__ )    || \
      defined( __MIKROC_PRO_FOR_DSPIC__ )
    start_i2c_p();
    write_i2c_p( _i2c_hw_address | WRITE_BIT );

    while ( cnt-- )
        write_i2c_p( read_reg_cmd[0] );

    stop_i2c_p();

    ptr = buffer;

    start_i2c_p();
    write_i2c_p( _i2c_hw_address | READ_BIT );

    while ( --count )
    {
        *ptr++ = read_i2c_p( ACK_BIT );
    }

    *ptr = read_i2c_p( NACK_BIT );

    stop_i2c_p();
#endif
}

/*************** END OF FUNCTIONS *********************************************/