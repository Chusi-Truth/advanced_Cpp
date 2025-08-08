cmake_minimum_required(VERSION 3.12)
project(DemoProject LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 这里改为相对路径指向 hw_proj 里的 include 和 src
include_directories(../hw_proj/include)

file(GLOB_RECURSE SOURCES ../hw_proj/src/*.cpp)

add_executable(run ${SOURCES})

target_compile_options(run PRIVATE
    -ftemplate-depth=11000
    -ftemplate-backtrace-limit=0
)

# ----------todo: 调试模式以及编译提示
option(DEBUG_MODE "Enable debug output for analyze.cpp" OFF)

if(DEBUG_MODE)
    # Debug 模式：定义 DEBUG_OUTPUT 宏并禁用优化
    target_compile_definitions(run PRIVATE DEBUG_OUTPUT)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -g")
    message(STATUS "Build type: DEBUG - Debug output enabled")
else()
    # Release 模式：启用优化并移除调试符号
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
    message(STATUS "Build type: RELEASE - Optimized for performance")
endif()

if(WIN32)
  message(STATUS "Building on windows")
elseif(UNIX)
  message(STATUS "Building on Unix/Linux")
endif()


# ----------


set_target_properties(run PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)


message(STATUS "源文件数量: ${SOURCES}")
message(STATUS "生成可执行文件: run")
