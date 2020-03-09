# ------------------------------------------------
# Basic Demo Makefile (based on gcc)
# ------------------------------------------------

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

# ASM sources
ASM_SOURCES = startup_stm32l552xx.s

#######################################
# Specific makefiles
#######################################
include NonSecure.mk
include Secure.mk
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
#CMSE
CMSE = -mcmse
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

NS_CFLAGS = $(MCU) $(C_DEFS) $(NS_C_INCLUDES) $(OPT) -Wall  -fdata-sections -ffunction-sections -ffreestanding
S_CFLAGS = $(MCU) $(C_DEFS) $(S_C_INCLUDES) $(OPT) -Wall  -fdata-sections -ffunction-sections -ffreestanding

ifeq ($(DEBUG), 1)
NS_CFLAGS += -g -gdwarf-2
S_CFLAGS += -g -gdwarf-2
endif

# Generate dependency information
NS_CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"
S_CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
NS_LDSCRIPT = $(NS)/NonSecure.ld
S_LDSCRIPT = $(S)/Secure.ld

# libraries
LIBS = -lc -lm -lnosys
LIBDIR =
NS_LDFLAGS = $(MCU) -specs=nano.specs -T$(NS_LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(NS)/$(NS_TARGET).map,--cref -Wl,--gc-sections
S_LDFLAGS = $(MCU) -specs=nano.specs -T$(S_LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(S)/$(S_TARGET).map,--cref -Wl,--gc-sections
# default action: build all
all: non_secure secure

non_secure : $(BUILD_DIR)/$(NS)/$(NS_TARGET).elf $(BUILD_DIR)/$(NS)/$(NS_TARGET).hex $(BUILD_DIR)/$(NS)/$(NS_TARGET).bin

secure     : $(BUILD_DIR)/$(S)/$(S_TARGET).elf $(BUILD_DIR)/$(S)/$(S_TARGET).hex $(BUILD_DIR)/$(S)/$(S_TARGET).bin

#######################################
# build the application
#######################################
# list of objects
NS_OBJECTS = $(addprefix $(BUILD_DIR)/$(NS)/,$(notdir $(NS_C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(NS_C_SOURCES)))
# list of ASM program NS_OBJECTS
NS_OBJECTS += $(addprefix $(BUILD_DIR)/$(NS)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

# list of objects
S_OBJECTS = $(addprefix $(BUILD_DIR)/$(S)/,$(notdir $(S_C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(S_C_SOURCES)))
# list of ASM program NS_OBJECTS
S_OBJECTS += $(addprefix $(BUILD_DIR)/$(S)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))


$(BUILD_DIR)/$(NS)/%.o: %.c Makefile | $(BUILD_DIR)/$(NS)
	$(CC) -c $(NS_CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(NS)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/$(S)/%.o: %.c Makefile | $(BUILD_DIR)/$(S)
	$(CC) -c $(S_CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(S)/$(notdir $(<:.c=.lst)) $(CMSE) $< -o $@

$(BUILD_DIR)/$(NS)/%.o: %.s Makefile | $(BUILD_DIR)/$(NS)
	$(AS) -c $(NS_CFLAGS) $< -o $@

$(BUILD_DIR)/$(S)/%.o: %.s Makefile | $(BUILD_DIR)/$(S)
	$(AS) -c $(S_CFLAGS) $< -o $@

$(BUILD_DIR)/$(NS)/$(NS_TARGET).elf: $(NS_OBJECTS) Makefile
	$(CC) $(NS_OBJECTS) $(NS_LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/$(S)/$(S_TARGET).elf: $(S_OBJECTS) Makefile
	$(CC) $(S_OBJECTS) $(S_LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/$(NS)/%.hex: $(BUILD_DIR)/$(NS)/%.elf | $(BUILD_DIR)/$(NS)
	$(HEX) $< $@

$(BUILD_DIR)/$(S)/%.hex: $(BUILD_DIR)/$(S)/%.elf | $(BUILD_DIR)/$(S)
	$(HEX) $< $@

$(BUILD_DIR)/$(NS)/%.bin: $(BUILD_DIR)/$(NS)/%.elf | $(BUILD_DIR)/$(NS)
	$(BIN) $< $@

$(BUILD_DIR)/$(S)/%.bin: $(BUILD_DIR)/$(S)/%.elf | $(BUILD_DIR)/$(S)
	$(BIN) $< $@

$(BUILD_DIR)/$(NS):
	mkdir -vp $@

$(BUILD_DIR)/$(S):
	mkdir -vp $@


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
export OPENOCD_CHECK = check.cfg

erase:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "init; reset halt; flash erase_sector 0 0 last; exit;"

upload:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "program $(BUILD_DIR)/$(NS)/$(NS_TARGET).elf verify reset " -c "shutdown"
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "program $(BUILD_DIR)/$(S)/$(S_TARGET).elf verify reset " -c "shutdown"

debug:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "halt; sleep 1;"

run:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "shutdown"

flash_banks:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "flash banks"

flash_list:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "flash list"

unlock:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_TARGET) -c "init; reset halt; stm32l5x unlock 1; reset halt; exit;"

check:
	$(OPENOCD_BIN) -s $(OPEN_OCD_SCRIPTS_PATH) -f $(OPENOCD_CHECK)
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***