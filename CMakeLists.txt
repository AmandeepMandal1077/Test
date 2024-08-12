cmake_minimum_required(VERSION 3.10)
project(MyCrowApp)

# Add the path to the Crow framework
include_directories(/opt/crow/include)

# Add executable target
add_executable(my_crow_app main.cpp)

# Link necessary libraries
target_link_libraries(my_crow_app PRIVATE boost_system pthread ssl crypto)
