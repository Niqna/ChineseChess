cmake_minimum_required(VERSION 3.14)

project(ChineseChess VERSION 0.1 LANGUAGES CXX)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appChineseChess)

target_sources(appChineseChess
    PRIVATE
        main.cpp
        qml.qrc
        resource.qrc
    PUBLIC

)

qt_add_qml_module(appChineseChess
    URI ChineseChess
    VERSION 1.0
    SOURCES

    QML_FILES
)

target_compile_features(appChineseChess PRIVATE cxx_std_20)

set_target_properties(appChineseChess PROPERTIES
    AUTORCC TRUE
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appChineseChess
    PRIVATE
        Qt6::Quick
)

install(TARGETS appChineseChess
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

find_package(Qt6 REQUIRED COMPONENTS SpatialAudio)
target_link_libraries(appChineseChess PRIVATE Qt6::SpatialAudio)
