#include <stdint.h>

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
    //Local Declarations
    uint8_t id_buffer[20] = { 0 };
    uint8_t id_reg = 0x12;
    uint8_t uart_text[25] = { 0 };
    uint8_t l_byte = 0;
    uint8_t h_byte = 0;
    uint16_t big_byte = 0;
    color_t color;
    
    //Setup
    system_setup();
    
    //Get Device ID
    UART1_Write_Text( "Device ID:  " );
    color_3_read( id_buffer, 0x12, 1 );
    IntToHex( id_buffer[0], uart_text );
    UART1_Write_Text( uart_text );
    UART1_Write_Text( "\r\n\r\n\r\n" );
    Delay_ms(1000);

    while(1)
    {
        while( INT == 1 );   //Wait for new data
        
        color_3_read( id_buffer, TCS3771_CDATA, 8 );
        //Clear Data
        l_byte = id_buffer[0];
        h_byte = id_buffer[1];
        big_byte =  l_byte;
        big_byte |= (uint16_t)h_byte << 8;
        //Write to UART
        UART1_Write_Text( "Clear Data: " );
        IntToStr( big_byte, uart_text );
        UART1_Write_Text( uart_text );
        UART1_Write_Text( "\r\n" );
        //Red Data
        l_byte = id_buffer[2];
        h_byte = id_buffer[3];
        big_byte =  l_byte;
        big_byte |= (uint16_t)h_byte << 8;
        //Write to UART
        UART1_Write_Text( "Red Data:   " );
        IntToStr( big_byte, uart_text );
        UART1_Write_Text( uart_text );
        UART1_Write_Text( "\r\n" );
        //Green Data
        l_byte = id_buffer[4];
        h_byte = id_buffer[5];
        big_byte =  l_byte;
        big_byte |= (uint16_t)h_byte << 8;
        //Write to UART
        UART1_Write_Text( "Green Data: " );
        IntToStr( big_byte, uart_text );
        UART1_Write_Text( uart_text );
        UART1_Write_Text( "\r\n" );
        //Blue Data
        l_byte = id_buffer[6];
        h_byte = id_buffer[7];
        big_byte =  l_byte;
        big_byte |= (uint16_t)h_byte << 8;
        //Write to UART
        UART1_Write_Text( "Blue Data:  " );
        IntToStr( big_byte, uart_text );
        UART1_Write_Text( uart_text );
        UART1_Write_Text( "\r\n\r\n\r\n" );
        //Delay
        Delay_ms(1000);
    }
}

void system_setup( void )
{
    
     //GPIOs
    GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10 );
    Delay_ms(300);
    
     //UART
    UART1_Init( 115200 );
    Delay_ms(300);
    UART1_Write_Text( "UART Initialized\r\n" );

     // I2C
    I2C1_Init_Advanced( 100000, &_GPIO_MODULE_I2C1_PB67 );
    Delay_ms(500);
    UART1_Write_Text( "I2C Initialized\r\n" );
    
    #if defined( __MIKROC_PRO_FOR_ARM__ )   ||  \
        defined( __MIKROC_PRO_FOR_FT90x__ )
        _i2c_address             = _i2c_address;
    #else
        _i2c_address             = ( _i2c_address << 1 );
    #endif

    color_3_init();
    Delay_ms(300);
    
    UART1_Write_Text( "Color 3 Initialized\r\n" );
}

void color_3_read( uint8_t *buffer, uint8_t reg, uint8_t count )
{
    uint8_t read_reg_cmd[ 20 ] = { 0 };
    uint8_t *tmp_buffer = buffer;

    read_reg_cmd[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_AUTOINC | reg;
    
    I2C1_Start();
    I2C1_Write( _i2c_address, read_reg_cmd, 1, END_MODE_STOP );
    I2C1_Start();
    I2C1_Read( _i2c_address, tmp_buffer, count, END_MODE_STOP );

}

void color_3_write( uint8_t *buffer, uint8_t reg, uint8_t count )
{
    uint8_t temp[ 20 ];

    uint16_t i          = 0;
    uint8_t *temp_ptr   = temp;
    uint8_t *buff_ptr   = buffer;

    /* Fill the temp buffer with data*/
    temp[ i++ ] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_AUTOINC | reg;

    while ( count-- )
        temp[ i++ ] = *( buff_ptr++ );
    
    I2C1_Start();
    I2C1_Write( _i2c_address, temp, i, END_MODE_STOP );

}

void color_3_init( void )
{
        uint8_t buffer[ 20 ]    = { TCS3771_CONTROL_PDIODE_IR };
        //uint8_t tmp_buffer[ 5 ] = { 0x80 };
        
        //color_3_write( tmp_buffer, 0x29, 1 );
        
        color_3_write( buffer, TCS3771_CONTROL, 1 );

        buffer[0] = 0x00;
        color_3_write( buffer, TCS3771_PPULSE, 1 );

        buffer[0] = 216;
        color_3_write( buffer, TCS3771_WTIME, 1 );

        buffer[0] = 0x01;
        buffer[1] = 0x30;
        buffer[2] = 0x01;
        buffer[3] = 0x70;
        color_3_write( buffer, TCS3771_PILT, 4 );
        
        buffer[0] = 0x01;
        buffer[1] = 0x30;
        buffer[2] = 0x01;
        buffer[3] = 0x70;
        color_3_write( buffer, TCS3771_AILT, 4 );

        buffer[0] = TCS3771_PERS_PPERS(10);
        color_3_write( buffer, TCS3771_PERS, 1 );

        buffer[0] = TCS3771_ENABLE_PON | TCS3771_ENABLE_PEN | TCS3771_ENABLE_WEN | TCS3771_ENABLE_AEN | TCS3771_ENABLE_PIEN | TCS3771_ENABLE_AIEN;
        color_3_write( buffer, TCS3771_ENABLE, 1 );

        buffer[0] = TCS3771_COMMAND_SELECT | TCS3771_COMMAND_TYPE_SPECIAL | 0x07;
        I2C_Start();
        I2C_Write( _i2c_address, buffer, 1, END_MODE_STOP );
        //color_3_write( buffer, 0x29, 1 );

        buffer[0] = 252;
        color_3_write( buffer, TCS3771_ATIME, 1 );

        buffer[0] = 254;
        color_3_write( buffer, TCS3771_PTIME, 1 );

}