CXX = clang++
CXXFLAGS = -Wall -std=c++14 -target x86_64-pc-windows-gnu
LDFLAGS = -target x86_64-pc-windows-gnu
TARGET = BasicExample.exe

HEADER_DIR =./include
LIB_SRC_DIR =./src
EXAMPLE_SRC_DIR =./examples/src
BIN_DIR=./examples/bin
BUILD_DIR=./examples/build

LIB_DIRS =
INC_DIRS =-Iinclude

HEADER_FILES := $(wildcard $(HEADER_DIR)/*.hpp) $(wildcard $(HEADER_DIR)/*.h)
SRC_FILES := $(wildcard $(LIB_SRC_DIR)/*.cpp) $(wildcard $(LIB_SRC_DIR)/*.c)
SRC_FILES := $(wildcard $(EXAMPLE_SRC_DIR)/*.cpp) $(wildcard $(EXAMPLE_SRC_DIR)/*.c) $(SRC_FILES)
O_FILES := $(patsubst $(LIB_SRC_DIR)/%.cpp, $(BIN_DIR)/%.o, $(SRC_FILES))
O_FILES := $(patsubst $(EXAMPLE_SRC_DIR)/%.cpp, $(BIN_DIR)/%.o, $(O_FILES))

all: $(TARGET)

$(TARGET): $(O_FILES)
	$(CXX) $(LIB_DIRS) $(O_FILES) -o $(BUILD_DIR)/$(TARGET) $(LDFLAGS)

$(BIN_DIR)/$(TARGET).o: $(EXAMPLE_SRC_DIR)/$(TARGET).cpp
	$(CXX) $(CXXFLAGS) $(INC_DIRS) -c $< -o $@
	
$(BIN_DIR)/%.o: $(EXAMPLE_SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INC_DIRS) -c $< -o $@
	
$(BIN_DIR)/%.o: $(LIB_SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INC_DIRS) -c $< -o $@

