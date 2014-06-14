################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../cspec/utils/list/list.c 

OBJS += \
./cspec/utils/list/list.o 

C_DEPS += \
./cspec/utils/list/list.d 


# Each subdirectory must supply rules for building sources it contributes
cspec/utils/list/%.o: ../cspec/utils/list/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -fPIC -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


