cmake_minimum_required(VERSION 3.23)
set(CMAKE_CXX_STANDARD 17)
project(main)

add_executable(main main.cpp)

target_include_directories(main PUBLIC "include/mysql/include")

add_subdirectory(include/openxlsx)
target_link_libraries(main OpenXLSX::OpenXLSX)

target_link_directories(main PUBLIC "include/mysql/lib")
target_link_libraries(main libmysql)