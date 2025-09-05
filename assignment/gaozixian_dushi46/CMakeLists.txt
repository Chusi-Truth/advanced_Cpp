cmake_minimum_required(VERSION 3.12)
project(DemoProject LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 添加构建模式选项
option(DEBUG_MODE "Enable debug mode with verbose output" OFF)

# 检测并打印编译平台信息
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    message(STATUS "Building on Windows platform")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    message(STATUS "Building on Linux platform")
else()
    message(STATUS "Building on unknown platform: ${CMAKE_SYSTEM_NAME}")
endif()

# 设置编译模式对应的编译选项
if(DEBUG_MODE)
    message(STATUS "Building in DEBUG mode")
    add_compile_definitions(DEBUG)
else()
    message(STATUS "Building in RELEASE mode")
endif()

# 这里改为相对路径指向 hw_proj 里的 include 和 src
include_directories(${CMAKE_SOURCE_DIR}/../hw_proj/include)

file(GLOB_RECURSE SOURCES ${CMAKE_SOURCE_DIR}/../hw_proj/src/*.cpp)

add_executable(run ${SOURCES})

target_compile_options(run PRIVATE
    -ftemplate-depth=11000
    -ftemplate-backtrace-limit=0
)

# 根据调试模式设置不同的编译选项
if(DEBUG_MODE)
    target_compile_options(run PRIVATE -g -O0)
else()
    target_compile_options(run PRIVATE -O3 -DNDEBUG)
endif()

set_target_properties(run PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

message(STATUS "源文件数量: ${SOURCES}")
message(STATUS "生成可执行文件: run")