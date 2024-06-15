cmake_minimum_required(VERSION 3.5)
project(conv CXX)

# Include directories
include_directories(include)

# Find all source files
file(GLOB SOURCES "src/*.cpp")

# Print all source files
foreach(file ${SOURCES})
  message(STATUS "Source file: ${file}")
endforeach()

# Find all include files
file(GLOB INCLUDE_FILES "include/*")
foreach(file ${INCLUDE_FILES})
  message(STATUS "Include file: ${file}")
endforeach()

# Set compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")

# Add executable
add_executable(conv main.cpp ${SOURCES})

# Link libraries (if needed)
target_link_libraries(conv m)

# Set C++ standard
set_target_properties(conv PROPERTIES CXX_STANDARD 11)
