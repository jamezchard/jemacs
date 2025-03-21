CXX := g++

CXXFLAGS := -std=c++17 -Wall -g

SOURCES := $(wildcard *.cc)

TARGETS := $(SOURCES:.cc=)

all: $(TARGETS)

%: %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	rm -f $(TARGETS)

rebuild: clean all

.PHONY: all clean rebuild
