################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../cspec/cspec/cspec.c \
../cspec/cspec/describe.c \
../cspec/cspec/it.c 

OBJS += \
./cspec/cspec/cspec.o \
./cspec/cspec/describe.o \
./cspec/cspec/it.o 

C_DEPS += \
./cspec/cspec/cspec.d \
./cspec/cspec/describe.d \
./cspec/cspec/it.d 


# Each subdirectory must supply rules for building sources it contributes
cspec/cspec/%.o: ../cspec/cspec/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -fPIC -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


