TARGET:= md2

all:
	arm-linux-gnueabi-gcc $(TARGET).s $(TARGET)_main.c -o $(TARGET)	
