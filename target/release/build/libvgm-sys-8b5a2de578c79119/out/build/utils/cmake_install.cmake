# Install script for directory: /home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/utils

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE STATIC_LIBRARY FILES "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/build/bin/libvgm-utils.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vgm/utils" TYPE FILE FILES
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/utils/DataLoader.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/utils/FileLoader.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/utils/MemoryLoader.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/utils/OSMutex.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/utils/OSSignal.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/utils/OSThread.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/utils/StrUtils.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/pkgconfig" TYPE FILE FILES "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/build/utils/vgm-utils.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/build/utils/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
