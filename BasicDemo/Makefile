# ------------------------------------------------
# Basic Demo Makefile (based on gcc)
# ------------------------------------------------

######################################
# target
######################################
TARGET = BasicDemo

######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization
OPT = -O0

#######################################
# paths
#######################################
# Build path
BUILD_DIR = build
# arm-none-eabi-gcc path evironnement variable
GCC_PATH  = $(GCC_V9_PATH)

SRC = Src
INC = Inc

HAL_SRC_PATH 			= ../Drivers/STM32L5xx_HAL_Driver/Src
HAL_INC_PATH 			= ../Drivers/STM32L5xx_HAL_Driver/Inc
HAL_INC_LEGACY_PATH 	= ../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy
CMSIS_INC_PATH 			= ../Drivers/CMSIS/Include
CMSIS_DEVICE_INC_PATH 	= ../Drivers/CMSIS/Device/ST/STM32L5xx/Include
######################################
# HAL_sources
######################################
HAL_SOURCES = 	$(HAL_SRC_PATH)/stm32l5xx_ll_utils.c \
				$(HAL_SRC_PATH)/stm32l5xx_ll_exti.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_adc.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_adc_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_i2c.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_i2c_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_rcc.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_rcc_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_flash.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_flash_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_flash_ramfunc.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_gpio.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_dma.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_dma_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_exti.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_pwr.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_pwr_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_cortex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_gtzc.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_icache.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_comp.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_fdcan.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_smbus.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_uart.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_uart_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_ospi.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_rtc.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_rtc_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_sai.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_sai_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_ll_sdmmc.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_sd.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_sd_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_spi.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_spi_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_tim.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_tim_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_ll_gpio.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_pcd.c \
				$(HAL_SRC_PATH)/stm32l5xx_hal_pcd_ex.c \
				$(HAL_SRC_PATH)/stm32l5xx_ll_usb.c \

######################################
# C Sources
######################################
C_SOURCES = $(SRC)/main.c \
			$(SRC)/stm32l5xx_it.c \
			$(SRC)/stm32l5xx_hal_msp.c \
			$(SRC)/system_stm32l5xx.c \
			$(HAL_SOURCES)

# ASM sources
ASM_SOURCES = startup_stm32l552xx.s

#######################################
# C_includes
#######################################
C_INCLUDES = 	-I$(INC) \
				-I$(HAL_INC_PATH) \
				-I$(HAL_INC_LEGACY_PATH) \
				-I$(CMSIS_DEVICE_INC_PATH) \
				-I$(CMSIS_INC_PATH) \


#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S

#######################################
# CFLAGS
#######################################
# CPU
CPU = -mcpu=cortex-m33

# fpu
FPU = -mfpu=fpv4-sp-d16

# float-abi
FLOAT-ABI = -mfloat-abi=hard

# mcu
MCU =  $(CPU) $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS =

# C defines
C_DEFS =  	-DUSE_FULL_LL_DRIVER \
			-DUSE_HAL_DRIVER \
			-DSTM32L552xx

# AS includes
AS_INCLUDES =

# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections -ffreestanding

CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall  -fdata-sections -ffunction-sections -ffreestanding

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif

# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"

#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = STM32L552ZETxQ_FLASH.ld

# libraries
LIBS = -lc -lm -lnosys
LIBDIR =
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR)
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@

$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@

$(BUILD_DIR):
	mkdir $@

#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)

#######################################
# program
#######################################
export OPENOCD_BIN = openocd
export OPEN_OCD_SCRIPTS_PATH = /usr/share/openocd/scripts
export OPENOCD_INTERFACE = $(OPEN_OCD_SCRIPTS_PATH)/interface/stlink-v2-1.cfg
export OPENOCD_TARGET = nucleo-l522.cfg

erase:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "init; reset halt; flash erase_sector 0 0 last; exit;"

upload:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "program $(BUILD_DIR)/$(TARGET).elf verify reset" -c "shutdown"

debug:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "halt; sleep 1;"

run:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "shutdown"

#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***