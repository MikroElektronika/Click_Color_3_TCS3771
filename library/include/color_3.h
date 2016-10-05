/**
 * @file                                               color_3.h
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

#ifndef COLOR_3_H
#define COLOR_3_H

/******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>
/******************************************************************************
* Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Configuration Constants
*******************************************************************************/

/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/
typedef struct
{
	uint16_t clear_data;
	uint16_t red_data;
	uint16_t green_data;
	uint16_t blue_data;
} color_t;
/******************************************************************************
* Variables
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief <h3> Color 3 Initialization </h3>
 *
 * @par
 * Initializes Color 3
 *
 * @note
 * This function must be called first.
 *
 */
void color_3_init( uint8_t address );

/**
 * @brief <h3> Color 3 Get RGB Data </h3>
 *
 * @par
 *  Gets clear, red, green, and blue data from click.
 *
 * @param[in] color - color_t struct for returning clear and rgb data.
 */
void color_3_get_rgb_data( color_t* color );

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* XXX_H */

/*******************************************************************************
*                                                                 End of File
*******************************************************************************/