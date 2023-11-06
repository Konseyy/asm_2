TARGET:= md2

$(TARGET): $(TARGET)_s.o $(TARGET)_c.o
	arm-linux-gnueabi-gcc $(TARGET).s $(TARGET)_main.c -o $(TARGET)
