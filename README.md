![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

![Color 3 Click](http://cdn.mikroe.com/img/click/color-3/color-3-click.png)

---
[Product Page](http://www.mikroe.com/click/color-3/)

[Manual Page](http://docs.mikroe.com/Color_3_click)

---

### General Description
Color 3 click is a mikroBUS add-on board with a TCS3771 color sensor (also known as a light-to-digital converter) and a narrow beam Infrared LED. The circuit can also function as a proximity sensor. 

TCS3771 is a RGBC sensor: it can detect Red, Green, Blue and clear light. The IC performs well under a variety of lighting conditions. For example, it can be covered with different attenuation materials.

As a proximity sensor it has a large dynamic range of operation. It can take short distance measurements behind dark glass; or it can be configured for longer distance measurement, for example, human presence detection in front of monitors or laptops.

For power-saving, TCS3771 has an internal state machine that can put the device into a low power mode between successive RGBC and proximity measurements.

TCS3771 is also fast enough to give off proximity information at a high rate of repetition. This makes it useful for proximity detection in portable devices (such as a phone coming near to a speaker’s ear).

Color 3 click communicates with the target MCU through the mikroBUS I2C interface, with additional functionality provided by an INT pin. Designed to use a 3.3 power supply only.

Applications
RGBC color sensing and proximity sensing (suitable for portable devices)

Key features
- TCS3771 IC and IR Diode
- RGBC color sensing and proximity detection
- I2C, INT
- 3.3V power supply

Key benefits
- Power-saving options
- Fast operation (suitable for proximity detection in portable devices)
- Proximity detection for short or longer ranges (up to half a meter)
- Ready-to-use examples save development time

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

```
