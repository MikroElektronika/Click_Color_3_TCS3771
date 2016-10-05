/****************************************************************************
* Title                 :   color_3 click
* Filename              :   color_3_hal.h
* Author                :   CAL
* Origin Date           :   04/10/2016
* Notes                 :   None
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date    Software Version    Initials   Description
*  04/10/2016    XXXXXXXXXXX         CAL      Interface Created.
*
*****************************************************************************/
/**
 * @file color_3_hal.h
 * @brief <h2> HAL layer </h2>
 */

#ifndef COLOR_3_HAL_H_
#define COLOR_3_HAL_H_

/******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>

#define TCS3771_COMMAND_TYPE_SPECIAL (3 << 5)
#define TCS3771_COMMAND_TYPE_AUTOINC (0b01 << 5)
#define TCS3771_COMMAND_SELECT (1 << 7)
/******************************************************************************
* Function Prototypes
*******************************************************************************/

typedef enum
{
	SPECIAL_TYPE = 0,
	NORMAL_TYPE  = 1
} cmd_type_t;


#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief <h3>HAL Initialization</h3>
 *
 * @par
 * Initialization of HAL layer used to initialize I2C bus and pins needed
 * for proper usage of click board.
 *
 * @param[in] address_id - hardware address
 */
void color_3_hal_init(  uint8_t address_id, uint8_t command_size );

/**
 * @brief <h3>HAL Write</h3>
 *
 * @par
 * Generic write function adapted for color_3 click.
 *
 * @param[in] buffer - data buffer
 * @param[in] count - data size in bytes
 */
void color_3_hal_write( uint8_t *buffer, uint8_t reg, uint16_t count, cmd_type_t type );

/**
 * @brief <h3>HAL Read</h3>
 *
 * @par
 * Generic read function adapted for color_3 click.
 *
 * @note
 * Buffer caries command which will be rewritten after reading.
 *
 * @param[in/out] buffer - data buffer
 * @param[in] count - data size in bytes
 */
void color_3_hal_read( uint8_t *buffer, uint8_t reg, uint8_t count );

#ifdef __cplusplus
} // extern "C"
#endif

#endif

/*** End of File **************************************************************/