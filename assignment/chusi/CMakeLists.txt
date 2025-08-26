cmake_minimum_required(VERSION 3.12)
project(DemoProject LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 这里改为相对路径指向 hw_proj 里的 include 和 src
include_directories(${CMAKE_SOURCE_DIR}/../hw_proj/include)

file(GLOB_RECURSE SOURCES ${CMAKE_SOURCE_DIR}/../hw_proj/src/*.cpp)

add_executable(run ${SOURCES})

target_compile_options(run PRIVATE
    -ftemplate-depth=11000
    -ftemplate-backtrace-limit=0
)

# ----------todo: 调试模式以及编译提示
option(BUILD_DEBUG "Build in debug mode with debug information" OFF)

if(CMAKE_SYSTEM-NAME STREQUAL "Windows")
    message(STATUS "编译环境: Windows")
    set(PLATFORM "WIN")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    message(STATUS "编译环境: Linux")
    set(PLATFORM "LINUX")
else()
    message(STATUS "编译环境: ${CMAKE_SYSTEM_NAME}")
    set(PLATFORM "OTHER")
endif()

if(BUILD_DEBUG)
    message(STATUS "构建模式：Debug")
    add_compile_definitions(DEBUG_MODE)
else()
    message(STATUS "构建模式：Release")
endif()
# ----------


set_target_properties(run PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)


message(STATUS "源文件数量: ${SOURCES}")
message(STATUS "生成可执行文件: run")
