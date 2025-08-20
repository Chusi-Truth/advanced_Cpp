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
# 1. 添加调试模式选项
option(DEBUG_MODE "Enable debug mode" OFF)

# 2. 根据调试模式设置编译定义
if(DEBUG_MODE)
    message(STATUS "Debug mode: ON - Enabling debug output")
    target_compile_definitions(run PRIVATE DEBUG)
else()
    message(STATUS "Debug mode: OFF - Disabling debug output")
endif()

# 3. 添加自定义命令在构建时显示平台信息
if(WIN32)
    set(OS_NAME "Windows")
elseif(UNIX AND NOT APPLE)
    set(OS_NAME "Linux")
else()
    set(OS_NAME "${CMAKE_SYSTEM_NAME}")
endif()

add_custom_command(TARGET run PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo "===== Compiling on ${OS_NAME} ====="
    COMMENT "Building for ${OS_NAME}"
)


# ----------


set_target_properties(run PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)


message(STATUS "源文件数量: ${SOURCES}")
message(STATUS "生成可执行文件: run")
