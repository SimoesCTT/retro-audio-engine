# Install script for directory: /home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE STATIC_LIBRARY FILES "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/build/bin/libvgm-emu.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vgm/emu" TYPE FILE FILES
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/snddef.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/EmuStructs.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/SoundEmu.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/SoundDevs.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/EmuCores.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/Resampler.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/logging.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/dac_control.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vgm/emu/cores" TYPE FILE FILES
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/sn764intf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/2413intf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/2612intf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/ym2151.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/2151intf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/segapcm.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/rf5cintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/opnintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/opnintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/oplintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/oplintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/oplintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/262intf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/ymf278b.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/ymz280b.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/ymf271.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/ayintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/pwm.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/gbintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/nesintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/multipcm.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/upd7759.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/okim6258.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/okim6295.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/k051649.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/k054539.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/c6280intf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/c140.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/c219.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/k053260.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/pokey.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/qsoundintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/scsp.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/ws_audio.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/vsu.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/saaintf.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/es5503.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/es5506.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/x1_010.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/c352.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/iremga20.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/mikey.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/k007232.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/k005289.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/msm5205.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/msm5232.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/bsmt2000.h"
    "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/libvgm/emu/cores/ics2115.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/pkgconfig" TYPE FILE FILES "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/build/emu/vgm-emu.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/americosimoes/Desktop/retro-audio-workspace/target/release/build/libvgm-sys-8b5a2de578c79119/out/build/emu/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
