# Install script for directory: D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/libPNG/libPNG-1.5.27

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/libpng")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/libpng15.bc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/libpng.bc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/libPNG/libPNG-1.5.27/png.h"
    "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/libPNG/libPNG-1.5.27/pngconf.h"
    "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/pnglibconf.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libpng15" TYPE FILE FILES
    "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/libPNG/libPNG-1.5.27/png.h"
    "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/libPNG/libPNG-1.5.27/pngconf.h"
    "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/pnglibconf.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/libpng-config")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/libpng15-config")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man3" TYPE FILE FILES
    "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/libPNG/libPNG-1.5.27/libpng.3"
    "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/libPNG/libPNG-1.5.27/libpngpf.3"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man5" TYPE FILE FILES "D:/TPS_SSD/UE4-HTML5-TPS/UE4_ThirdParty/libPNG/libPNG-1.5.27/png.5")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/libpng.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/libpng-config")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/libpng15.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/libpng15-config")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpng/libpng15.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpng/libpng15.cmake"
         "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/CMakeFiles/Export/lib/libpng/libpng15.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpng/libpng15-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpng/libpng15.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/libpng" TYPE FILE FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/CMakeFiles/Export/lib/libpng/libpng15.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/libpng" TYPE FILE FILES "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/CMakeFiles/Export/lib/libpng/libpng15-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "D:/TPS_SSD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_O3/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
