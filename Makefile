CC = g++

SRCDIR = src
BUILDDIR = build
TESTDIR = tests
GTESTLDIR = $(TESTDIR)
GTESTIDIR = googletest/googletest/include
TARGET = bin/helloworld

CFLAGS = -g -Wall -c
LDFLAGS = 

SOURCES = $(shell find $(SRCDIR) -type f -name *.cpp)
TESTSOURCES = $(shell find $(TESTDIR) -type f -name *.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.cpp=.o))

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $(TARGET)

$(OBJECTS): test 
	$(CC) $(CFLAGS) $(SOURCES) -o $@

test:
	$(CC) -I$(GTESTIDIR) -I$(SRCDIR) -pthread $(GTESTLDIR)/gtest_main.a $(TESTSOURCES) -o $(TESTDIR)/testrun
	$(TESTDIR)/testrun 

clean:
	rm $(TARGET) $(OBJECTS)

