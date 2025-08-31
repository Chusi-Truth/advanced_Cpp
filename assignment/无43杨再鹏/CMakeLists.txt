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
option(ENABLE_DEBUG "Enable debug mode for the project" OFF)

if(ENABLE_DEBUG)
    add_definitions(-DDEBUG_MODE)
    message(STATUS "Build mode: Debug")
else()
    message(STATUS "Build mode: Release")
endif()

if(WIN32)
    message(STATUS "当前编译环境: Windows")
elseif(UNIX)
    message(STATUS "当前编译环境: Linux")
else()
    message(STATUS "当前编译环境: Other")
endif()
# ----------


set_target_properties(run PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)


message(STATUS "源文件数量: ${SOURCES}")
message(STATUS "生成可执行文件: run")
