cmake_minimum_required(VERSION 3.12)
project(DemoProject LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 这里改为相对路径指向 hw_proj 里的 include 和 src
include_directories(${CMAKE_SOURCE_DIR}/../hw_proj/include)

include_directories(${CMAKE_SOURCE_DIR}/../hw_proj/include/dummies)

file(GLOB_RECURSE SOURCES ${CMAKE_SOURCE_DIR}/../hw_proj/src/*.cpp)

add_executable(run ${SOURCES})

target_compile_options(run PRIVATE
    -ftemplate-depth=11000
    -ftemplate-backtrace-limit=0
)

# ----------todo: 调试模式以及编译提示
# 功能 2: 在构建过程中打印正在进行编译的环境是 Win 还是 Linux
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    message(STATUS "======= Compiling on Windows =======")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    message(STATUS "======= Compiling on Linux =======")
else()
    message(STATUS "======= Compiling on an OS other than Windows/Linux: ${CMAKE_SYSTEM_NAME} =======")
endif()

# 功能 1: 在构建项目的时候通过命令行参数实现 debug 模式和 release 模式
option(ENABLE_DEBUG "Enable debug mode with diagnostic messages" OFF)

if(ENABLE_DEBUG)
    # 如果命令行传入 -DENABLE_DEBUG=ON
    message(STATUS "Debug mode is ON. Debug messages will be printed.")
    # 为 "run" 目标添加一个私有的编译定义 DEBUG_MODE
    target_compile_definitions(run PRIVATE DEBUG_MODE)
else()
    # 默认情况或 -DENABLE_DEBUG=OFF
    message(STATUS "Release mode is ON. No debug messages.")
endif()
# ----------


set_target_properties(run PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)


message(STATUS "源文件数量: ${SOURCES}")
message(STATUS "生成可执行文件: run")