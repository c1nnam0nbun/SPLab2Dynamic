CC = g++
CFLAGS = -c -Wall

all: clean lab2

lab2: main.o database.so
	$(CC) -lm -o lab2 main.o -L -l: database.so -Wl,--rpath -Wl,.

main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp

employee.o: employee.cpp
	$(CC) -c -fPIC employee.cpp

database.o: database.cpp
	$(CC) -c -fPIC database.cpp

database.so: employee.o database.o
	$(CC) -shared -o database.so employee.o database.o

clean: 
	rm -rf *.o *.so lab2
