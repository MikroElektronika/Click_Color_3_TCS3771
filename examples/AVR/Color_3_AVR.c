#include <stdint.h>
#include "color_3.h"

void system_setup( void );

uint8_t _i2c_address = 0x29;

void main()
{
    //Local Declarations
    uint8_t id_buffer[6] = { 0 };
    uint8_t id_reg = 0x12;
    uint8_t uart_text[25] = { 0 };
    color_t my_color;

    //Setup
    system_setup();

    while(1)
    {
        color_3_get_rgb_data( &my_color );
        //Clear Data
        UART1_Write_Text( "Clear Data: " );
        IntToStr( my_color.clear_data, uart_text );
        UART1_Write_Text( uart_text );
        UART1_Write_Text( "\r\n" );
        //Red Data
        UART1_Write_Text( "Red Data:   " );
        IntToStr( my_color.red_data, uart_text );
        UART1_Write_Text( uart_text );
        UART1_Write_Text( "\r\n" );
        //Green Data
        UART1_Write_Text( "Green Data: " );
        IntToStr( my_color.green_data, uart_text );
        UART1_Write_Text( uart_text );
        UART1_Write_Text( "\r\n" );
        //Blue Data
        UART1_Write_Text( "Blue Data:  " );
        IntToStr( my_color.blue_data, uart_text );
        UART1_Write_Text( uart_text );
        UART1_Write_Text( "\r\n" );
        //Delay
        Delay_ms(1000);
    }
}

void system_setup( void )
{

     //UART
    UART1_Init( 9600 );
    Delay_ms(300);
    UART1_Write_Text( "UART Initialized\r\n" );

    // TWI
    TWI_Init( 100000 );
    Delay_ms(500);
    UART1_Write_Text( "I2C Initialized\r\n" );

    color_3_init( _i2c_address );
    Delay_ms(300);

    UART1_Write_Text( "Color 3 Initialized\r\n" );
}