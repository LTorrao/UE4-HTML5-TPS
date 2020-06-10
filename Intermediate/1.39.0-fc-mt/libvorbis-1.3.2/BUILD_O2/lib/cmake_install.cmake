# Install script for directory: D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/Vorbis/libvorbis-1.3.2/lib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/vorbis")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files (x86)/vorbis/include/vorbis/codec.h;C:/Program Files (x86)/vorbis/include/vorbis/vorbisenc.h;C:/Program Files (x86)/vorbis/include/vorbis/vorbisfile.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Program Files (x86)/vorbis/include/vorbis" TYPE FILE FILES
    "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/Vorbis/libvorbis-1.3.2/lib/../include/vorbis/codec.h"
    "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/Vorbis/libvorbis-1.3.2/lib/../include/vorbis/vorbisenc.h"
    "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/Vorbis/libvorbis-1.3.2/lib/../include/vorbis/vorbisfile.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc-mt/libvorbis-1.3.2/BUILD_O2/lib/libvorbis.bc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc-mt/libvorbis-1.3.2/BUILD_O2/lib/libvorbisenc.bc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc-mt/libvorbis-1.3.2/BUILD_O2/lib/libvorbisfile.bc")
endif()

