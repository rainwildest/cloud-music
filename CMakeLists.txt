cmake_minimum_required(VERSION 3.16)

project(cloud-music VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)

qt_add_executable(cloud-music
    main.cpp resource.qrc
)

#遍历所有qml文件
file(GLOB_RECURSE QML_PATHS *.qml)
foreach(filepath ${QML_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND qml_files ${filename})
endforeach(filepath)

qt_add_qml_module(cloud-music
    URI cloud-music
    VERSION 1.0
    QML_FILES ${qml_files}
    RESOURCE_PREFIX "/"
    SOURCES myimageproviter.h myimageproviter.cpp
    SOURCES httputils.h httputils.cpp
    SOURCES qreplytimeout.h qreplytimeout.cpp
)

set_target_properties(cloud-music PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(cloud-music
    PRIVATE Qt6::Quick
)

#导入exmaple的QML位置，不然import example有时候会爆红
set(QML_IMPORT_PATH ${CMAKE_BINARY_DIR}/cloud-music/qml)

install(TARGETS cloud-music
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
