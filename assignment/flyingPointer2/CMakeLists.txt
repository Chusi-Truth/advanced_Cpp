cmake_minimum_required(VERSION 3.10)
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
# done
# 定义option用于选择构建模式
option(DEBUG_MODE "Build in debug mode with debug prints" OFF)

# 打印当前编译环境
if(WIN32)
    message(STATUS "Building on Windows platform")
elseif(UNIX)
    message(STATUS "Building on Linux platform")
else()
    message(STATUS "Building on unknown platform")
endif()

# 根据选项设置预处理器定义
if(DEBUG_MODE)
    add_definitions(-DDEBUG_MODEL)
    message(STATUS "Building in DEBUG mode - debug prints enabled")
else()
    message(STATUS "Building in RELEASE mode - debug prints disabled")
endif()
# ----------


set_target_properties(run PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)


message(STATUS "源文件数量: ${SOURCES}")
message(STATUS "生成可执行文件: run")
