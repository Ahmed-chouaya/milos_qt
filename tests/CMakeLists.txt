enable_testing()

add_executable(test_theme test_theme.cpp ../src/style/ThemeManager.cpp)
target_link_libraries(test_theme Qt6::Core Qt6::Test)
add_test(NAME test_theme COMMAND test_theme)
