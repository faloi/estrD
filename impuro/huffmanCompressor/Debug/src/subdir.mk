################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/BitChainTest.cpp \
../src/CharBag.cpp \
../src/CharBagTest.cpp \
../src/HuffmanCompressor.cpp \
../src/HuffmanTree.cpp \
../src/HuffmanTreeTest.cpp \
../src/PriorityQueue.cpp \
../src/PriorityQueueTest.cpp \
../src/Tests.cpp \
../src/ZipTable.cpp 

OBJS += \
./src/BitChainTest.o \
./src/CharBag.o \
./src/CharBagTest.o \
./src/HuffmanCompressor.o \
./src/HuffmanTree.o \
./src/HuffmanTreeTest.o \
./src/PriorityQueue.o \
./src/PriorityQueueTest.o \
./src/Tests.o \
./src/ZipTable.o 

CPP_DEPS += \
./src/BitChainTest.d \
./src/CharBag.d \
./src/CharBagTest.d \
./src/HuffmanCompressor.d \
./src/HuffmanTree.d \
./src/HuffmanTreeTest.d \
./src/PriorityQueue.d \
./src/PriorityQueueTest.d \
./src/Tests.d \
./src/ZipTable.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


