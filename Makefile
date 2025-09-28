# CXX = C++ compiler variable in makefiles.
# -Wall sets on all common compiler warnings, and -Wextra turns on extra warnings.
# -I Tells the compiler where to look for header files.
#  -DGLEW_STATIC is used to tell the glew header files that we intend to link against the static version of the lib.
CXX = clang++
CXXFLAGS = -std=c++17 -Wall -Wextra -DGLEW_STATIC -I/opt/homebrew/Cellar/glfw/3.4/include -I/opt/homebrew/Cellar/glew/2.2.0_1/include

# Source and object files
SRC = $(wildcard src/*.cpp)
OBJ = $(SRC:.cpp=.o)

# Output binary
OUT = app

# Libraries & frameworks (macOS + GLFW + Glew)
LIBS = -L/opt/homebrew/Cellar/glfw/3.4/lib \
       -lglfw \
       -L/opt/homebrew/Cellar/glew/2.2.0_1/lib \
       -lglew \
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
