# URL:
# https://gitlab.kitware.com/cmake/community/-/wikis/doc/cmake/cross_compiling/Sdcc

# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Generic)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER sdcc)

# here is the target environment is located
SET(CMAKE_FIND_ROOT_PATH  /usr/share/sdcc $ENV{HOME}/Downloads/sdcc-4.4.0/share/sdcc)

find_program (SDCC NAMES sdcc)
get_filename_component(SDCC_BIN_DIR ${SDCC} DIRECTORY)
get_filename_component(SDCC_PATH_DIR ${SDCC_BIN_DIR} DIRECTORY)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Some Default Options
add_compile_options(-mmcs51 --model-large)

set(CMAKE_C_OUTPUT_EXTENSION .rel)
set(CMAKE_ASM_OUTPUT_EXTENSION .rel)