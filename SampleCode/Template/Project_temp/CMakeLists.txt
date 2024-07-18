
cmake_minimum_required(VERSION 3.25)

# Setup 
include(${CMAKE_SOURCE_DIR}/toolchain-sdcc.cmake)

# Build the executable based on the source files
project(Project_temp C)

set(CMAKE_C_OUTPUT_EXTENSION .rel)

# Standard Libarary
add_library(std
    ${CMAKE_SOURCE_DIR}/../../../Library/StdDriver/src/common.c
    ${CMAKE_SOURCE_DIR}/../../../Library/StdDriver/src/uart.c
    ${CMAKE_SOURCE_DIR}/../../../Library/StdDriver/src/sys.c
)

target_include_directories(std PUBLIC
    ${CMAKE_SOURCE_DIR}/../../../Library/StdDriver/inc
    ${CMAKE_SOURCE_DIR}/../../../Library/Device/Include
    )

target_compile_definitions(std PUBLIC
    F_CPU=16000000UL
)

set_target_properties(std PROPERTIES
    COMPILE_FLAGS "-mmcs51 --model-large -D__SDCC__"
    LINK_FLAGS "-mmcs51"
    FAMILY mmcs51
    PART N76E003
)


# Add the Project Soruce files in this directory
add_executable(${PROJECT_NAME}
    ${CMAKE_SOURCE_DIR}/main.c
    )

# For all the .h files in this directory
target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/../../../Library/StdDriver/inc
    ${CMAKE_SOURCE_DIR}/../../../Library/Device/Include
    )

target_link_libraries(${PROJECT_NAME}
    std
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    COMPILE_FLAGS "-mmcs51 --model-large -D__SDCC__"
    LINK_FLAGS "-mmcs51"
    FAMILY mmcs51
    PART N76E003
)
