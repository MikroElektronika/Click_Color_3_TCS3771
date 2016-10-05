> ![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)
> #Color 3 Click#
> ##By [MikroElektronika](http://www.mikroe.com)
---

## Installation
Use the package manager to install the library for your architecture.

###Example on FT900
```
#include <stdint.h>
#include "color_3.h"

void system_setup( void );

uint8_t _i2c_address = 0x29;

void system_setup( void )
{

     //UART
    UART1_Init( 9600 );
    Delay_ms(300);
    UART1_Write_Text( "UART Initialized\r\n" );

    // TWI
    I2CM1_Init( _I2CM_SPEED_MODE_STANDARD, _I2CM_SWAP_DISABLE );
    Delay_ms(300);
    UART1_Write_Text( "I2C Initialized\r\n" );

    color_3_init( _i2c_address );
    Delay_ms(300);

    UART1_Write_Text( "Color 3 Initialized\r\n" );
}
```

```
void main()
{
    //Local Declarations
    uint8_t id_buffer[6] = { 0 };
    uint8_t id_reg = 0x12;
    uint8_t uart_text[25] = { 0 };
    color_t my_color;

    //Setup
    system_setup();

    Delay_ms(1000);

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
        UART1_Write_Text( "\r\n\r\n\r\n" );
        //Delay
        Delay_ms(1000);
    }

}


```

