#include <stdint.h>
#include "color_3.h"

sbit INT at GPIOD_IDR.B10;

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

    color_3_init( _i2c_address );
    Delay_ms(300);

    UART1_Write_Text( "Color 3 Initialized\r\n" );
}