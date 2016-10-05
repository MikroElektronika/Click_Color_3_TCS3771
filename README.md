![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

![Color 3 Click](http://cdn.mikroe.com/img/click/color_3/img.png)

---
[Product Page](http://www.mikroe.com/click/color_3)

[Manual Page](http://docs.mikroe.com/Color-3-click)

---

### General Description
 Desc. Coming Soon...

---

### Example

#### Configuration
* MCU:             STM32F107VC
* Dev.Board:       EasyMx Pro v7
* Oscillator:      72 Mhz internal
* Ext. Modules:    Color 3 click
* SW:              MikroC PRO for ARM 4.7.4

```

/*      Functions
 ****************************/
#include <stdint.h>
#include "color_3.h"
#include "color_3_hal.h"

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

    //Get Device ID
    UART1_Write_Text( "Device ID:  " );
    color_3_hal_read( id_buffer, id_reg, 1 );
    IntToHex( id_buffer[0], uart_text );
    UART1_Write_Text( uart_text );
    UART1_Write_Text( "\r\n\r\n\r\n" );
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

```
