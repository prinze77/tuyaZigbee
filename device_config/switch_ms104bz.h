#pragma once

/* Enable C linkage for C++ Compilers: */
#if defined(__cplusplus)
extern "C" {
#endif

//zigbee model id
#define ZCL_BASIC_MODEL_ID          {20,'F','i','x','e','d','_','M','S','1','0','4','B','Z','_','T','S','0','1','1','F'}

//
#define HARDWARE_REV                0x01

// Now we need to define your device's GPIO pins:
// BUTTONS definition
// Net Key button
#define BUTTON1                     GPIO_PXX  // We'll fill in actual pin
#define PXX_FUNC                    AS_GPIO
#define PXX_OUTPUT_ENABLE           0
#define PXX_INPUT_ENABLE            1
#define PULL_WAKEUP_SRC_PXX         PM_PIN_PULLDOWN_100K

// LED definition
#define LED1                        GPIO_PXX  // We'll fill in actual pin
#define PXX_FUNC                    AS_GPIO
#define PXX_OUTPUT_ENABLE           1
#define PXX_INPUT_ENABLE            0
#define PXX_DATA_OUT                1

#if defined(__cplusplus)
}
#endif

#define BOARD_8258_TUYA_SWITCH_MS104BZ      15  // Next available board number

#define IMAGE_TYPE_SWITCH_MS104BZ           (0x21 | (IMAGE_TYPE_BOOT_FLAG << 7))

.h