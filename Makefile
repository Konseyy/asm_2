TARGET:= md2

$(TARGET):
	arm-linux-gnueabi-gcc $(TARGET).s $(TARGET)_main.c -o $(TARGET)
