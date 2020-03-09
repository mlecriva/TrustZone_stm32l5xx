######################################
# S_target
######################################
S_TARGET = TrustZoneDemoS

#######################################
# NS paths
#######################################
S						= Secure

S_SRC 					= Secure/Src
S_INC 					= Secure/Inc

S_NSC_INC_PATH 			= Secure_nsclib

S_HAL_SRC_PATH 			= ../Drivers/STM32L5xx_HAL_Driver/Src
S_HAL_INC_PATH 			= ../Drivers/STM32L5xx_HAL_Driver/Inc
S_HAL_INC_LEGACY_PATH 	= ../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy

S_CMSIS_INC_PATH 		= ../Drivers/CMSIS/Core/Include
S_CMSIS_DEVICE_INC_PATH = ../Drivers/CMSIS/Device/ST/STM32L5xx/Include

######################################
# S HAL_sources
######################################
S_HAL_SOURCES = 	$(S_HAL_SRC_PATH)/stm32l5xx_ll_utils.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_ll_exti.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_adc.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_adc_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_i2c.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_i2c_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_rcc.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_rcc_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_flash.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_flash_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_flash_ramfunc.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_gpio.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_dma.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_dma_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_exti.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_pwr.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_pwr_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_cortex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_gtzc.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_icache.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_comp.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_fdcan.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_smbus.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_uart.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_uart_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_ospi.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_rtc.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_rtc_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_sai.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_sai_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_ll_sdmmc.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_sd.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_sd_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_spi.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_spi_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_tim.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_tim_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_ll_gpio.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_pcd.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_hal_pcd_ex.c \
					$(S_HAL_SRC_PATH)/stm32l5xx_ll_usb.c \

#######################################
# S C includes
#######################################
S_C_SOURCES = 	$(S_SRC)/main.c \
				$(S_SRC)/stm32l5xx_it.c \
				$(S_SRC)/stm32l5xx_hal_msp.c \
				$(S_SRC)/system_stm32l5xx_s.c \
				$(S_SRC)/secure_nsc.c \
				$(S_HAL_SOURCES)

#######################################
# S C includes
#######################################
S_C_INCLUDES =  -I$(S_INC) \
				-I$(S_HAL_INC_PATH) \
				-I$(S_HAL_INC_LEGACY_PATH) \
				-I$(S_CMSIS_DEVICE_INC_PATH) \
				-I$(S_CMSIS_INC_PATH) \
				-I$(S_NSC_INC_PATH)