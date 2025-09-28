# CXX = C++ compiler variable in makefiles.
# -Wall sets on all common compiler warnings, and -Wextra turns on extra warnings.
# -I Tells the compiler where to look for header files.
CXX = clang++
CXXFLAGS = -std=c++17 -Wall -Wextra -I/opt/homebrew/Cellar/glfw/3.4/include

# Source and object files
SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)

# Output binary
OUT = app

# Libraries & frameworks (macOS + GLFW)
LIBS = -L/opt/homebrew/Cellar/glfw/3.4/lib \
       -lglfw \
       -framework OpenGL \
       -framework Cocoa \
       -framework IOKit \
       -framework CoreVideo \
       -framework CoreFoundation

# Default target, dependent of app(OUT).
all: $(OUT)

# Link step
$(OUT): $(OBJ)
	$(CXX) $(OBJ) -o $(OUT) $(LIBS)

# Compile step (%.o from %.cpp)
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(OBJ) $(OUT)
