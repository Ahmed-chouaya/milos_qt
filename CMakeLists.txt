cmake_minimum_required(VERSION 3.16)
project(milos-qt VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick Core5Compat Gui Widgets)

qt_add_executable(milos-qt
    src/main.cpp
    src/style/ThemeManager.cpp
    src/services/AudioService.cpp
    src/services/SystemMonitor.cpp
    src/services/NetworkService.cpp
    src/services/MprisService.cpp
)

install(TARGETS milos-qt)
