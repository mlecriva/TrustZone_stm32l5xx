######################################
# NS_target
######################################
NS_TARGET = TrustZoneDemoNS

#######################################
# NS paths
#######################################
NS						    = NonSecure

NS_SRC 						= NonSecure/Src
NS_INC 						= NonSecure/Inc

NS_NSC_INC_PATH 			= Secure_nsclib

NS_HAL_SRC_PATH 			= ../Drivers/STM32L5xx_HAL_Driver/Src
NS_HAL_INC_PATH 			= ../Drivers/STM32L5xx_HAL_Driver/Inc
NS_HAL_INC_LEGACY_PATH 	    = ../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy

NS_CMSIS_INC_PATH 			= ../Drivers/CMSIS
NS_CMSIS_DEVICE_INC_PATH 	= ../Drivers/CMSIS/Device/ST/STM32L5xx/Include

######################################
# NS HAL_sources
######################################
NS_HAL_SOURCES = 	$(NS_HAL_SRC_PATH)/stm32l5xx_ll_utils.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_ll_exti.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_adc.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_adc_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_i2c.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_i2c_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_rcc.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_rcc_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_flash.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_flash_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_flash_ramfunc.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_gpio.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_dma.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_dma_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_exti.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_pwr.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_pwr_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_cortex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_gtzc.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_icache.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_comp.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_fdcan.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_smbus.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_uart.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_uart_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_ospi.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_rtc.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_rtc_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_sai.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_sai_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_ll_sdmmc.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_sd.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_sd_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_spi.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_spi_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_tim.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_tim_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_ll_gpio.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_pcd.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_hal_pcd_ex.c \
					$(NS_HAL_SRC_PATH)/stm32l5xx_ll_usb.c \

#######################################
# NS C includes
#######################################
NS_C_SOURCES = 	$(NS_SRC)/main.c \
				$(NS_SRC)/stm32l5xx_it.c \
				$(NS_SRC)/stm32l5xx_hal_msp.c \
				$(NS_SRC)/system_stm32l5xx_ns.c \
				$(NS_HAL_SOURCES)

#######################################
# NS C includes
#######################################
NS_C_INCLUDES = -I$(NS_INC) \
				-I$(NS_HAL_INC_PATH) \
				-I$(NS_HAL_INC_LEGACY_PATH) \
				-I$(NS_CMSIS_DEVICE_INC_PATH) \
				-I$(NS_CMSIS_INC_PATH) \
				-I$(NS_NSC_INC_PATH)