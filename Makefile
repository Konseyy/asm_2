TARGET:= md2

$(TARGET): $(TARGET)_s.o $(TARGET)_c.o
	arm-linux-gnueabi-gcc $(TARGET)_s.o $(TARGET)_c.o -o $(TARGET)

$(TARGET)_s.o: $(TARGET).s
	arm-linux-gnueabi-as $(TARGET).s -o $(TARGET)_s.o

$(TARGET)_c.o: $(TARGET)_main.c
	arm-linux-gnueabi-gcc -static -c $(TARGET)_main.c -o $(TARGET)_c.o
