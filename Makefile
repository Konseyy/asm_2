TARGET:= md2

all:

$(TARGET):
	arm-linux-gnueabi-gcc $(TARGET).s $(TARGET)_main.c -o $(TARGET)
