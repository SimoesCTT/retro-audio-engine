# Install script for directory: /home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/player

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE STATIC_LIBRARY FILES "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/build/bin/libvgm-player.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vgm/player" TYPE FILE FILES
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/player/dblk_compr.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/player/helper.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/player/playerbase.hpp"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/player/droplayer.hpp"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/player/gymplayer.hpp"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/player/s98player.hpp"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/player/vgmplayer.hpp"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/player/playera.hpp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/pkgconfig" TYPE FILE FILES "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/build/player/vgm-player.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/build/player/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
