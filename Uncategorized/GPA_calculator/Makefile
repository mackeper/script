COMPILER = g++
FLAGS = --std=c++11

all: main

tinyxml2.o: tinyxml2.cpp
	$(COMPILER) $(FLAGS) -c tinyxml2.cpp

main: main.cpp tinyxml2.o
	$(COMPILER) $(FLAGS) main.cpp tinyxml2.o -o main

clean:
	rm main *.o
