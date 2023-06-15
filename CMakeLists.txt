cmake_minimum_required(VERSION 3.26)

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
        main.qml
        Help.qml
        Online.qml
        Mainpage.qml
        Setting.qml
        Game.qml
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























































#qt_add_executable(Message)  //Creates and finalizes an application target of a platform-specific type.
#This command performs the following tasks:
#    1. Create a CMake target of the appropriate type for the target platform.
#    2. Link the target to the Qt::Core library.
#    3. Handle finalization of the CMake target.



# qt_standard_project_setup()     #set(CMAKE_AUTOUIC ON)  set(CMAKE_AUTOMOC ON)

# @if %{HasTranslation}
# find_package(Qt6 REQUIRED COMPONENTS Core Quick LinguistTools)
# @else
# find_package(Qt6 REQUIRED COMPONENTS Core Quick)
# @endif

# target_sources(appMessage
#     PRIVATE
#         main.cpp
#         qml.qrc
#     @if %{HasTranslation}
#         %{TsFileName}
#     @endif
#
#     PUBLIC
#
# )

# qt_import_qml_plugins(Message)
