################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cspec/cspec.c \
../src/cspec/describe.c \
../src/cspec/it.c 

OBJS += \
./src/cspec/cspec.o \
./src/cspec/describe.o \
./src/cspec/it.o 

C_DEPS += \
./src/cspec/cspec.d \
./src/cspec/describe.d \
./src/cspec/it.d 


# Each subdirectory must supply rules for building sources it contributes
src/cspec/%.o: ../src/cspec/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


