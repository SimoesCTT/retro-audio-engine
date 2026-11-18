#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libvgm::vgm-utils" for configuration "Release"
set_property(TARGET libvgm::vgm-utils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libvgm::vgm-utils PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libvgm-utils.a"
  )

list(APPEND _cmake_import_check_targets libvgm::vgm-utils )
list(APPEND _cmake_import_check_files_for_libvgm::vgm-utils "${_IMPORT_PREFIX}/lib64/libvgm-utils.a" )

# Import target "libvgm::vgm-audio" for configuration "Release"
set_property(TARGET libvgm::vgm-audio APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libvgm::vgm-audio PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libvgm-audio.a"
  )

list(APPEND _cmake_import_check_targets libvgm::vgm-audio )
list(APPEND _cmake_import_check_files_for_libvgm::vgm-audio "${_IMPORT_PREFIX}/lib64/libvgm-audio.a" )

# Import target "libvgm::vgm-emu" for configuration "Release"
set_property(TARGET libvgm::vgm-emu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libvgm::vgm-emu PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libvgm-emu.a"
  )

list(APPEND _cmake_import_check_targets libvgm::vgm-emu )
list(APPEND _cmake_import_check_files_for_libvgm::vgm-emu "${_IMPORT_PREFIX}/lib64/libvgm-emu.a" )

# Import target "libvgm::vgm-player" for configuration "Release"
set_property(TARGET libvgm::vgm-player APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libvgm::vgm-player PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libvgm-player.a"
  )

list(APPEND _cmake_import_check_targets libvgm::vgm-player )
list(APPEND _cmake_import_check_files_for_libvgm::vgm-player "${_IMPORT_PREFIX}/lib64/libvgm-player.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
