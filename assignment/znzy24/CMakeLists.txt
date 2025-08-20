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


if(DEBUG_MODEL)
    message(STATUS "[模式] 当前为 Debug 模式 (DEBUG_MODEL=ON)")
    target_compile_definitions(run PRIVATE DEBUG_MODEL)
else()
    message(STATUS "[模式] 当前为 Release 模式 (DEBUG_MODEL=OFF)")
endif()

if(WIN32)
    message(STATUS "[平台] 正在 Windows 上编译")
elseif(UNIX)
    message(STATUS "[平台] 正在 Linux/Unix 上编译")
endif()

set_target_properties(run PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)


message(STATUS "源文件数量: ${SOURCES}")
message(STATUS "生成可执行文件: run")
