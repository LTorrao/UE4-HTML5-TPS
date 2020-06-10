# genout.cmake.in
# Generate .out from .c with awk (generic), based upon the automake logic.

# Copyright (C) 2016 Glenn Randers-Pehrson
# Written by Roger Leigh, 2016

# This code is released under the libpng license.
# For conditions of distribution and use, see the disclaimer
# and license in png.h

# Variables substituted from CMakeLists.txt
set(SRCDIR "E:/TPS_HDD/UE4-HTML5-TPS/UE4_ThirdParty/libPNG/libPNG-1.5.27")
set(BINDIR "E:/TPS_HDD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_Oz")

set(AWK "AWK-NOTFOUND")
set(CMAKE_C_COMPILER "E:/TPS_HDD/UE4-HTML5-TPS/HTML5_Build/emsdk/emsdk-1.39.0-fastcomp/fastcomp/emscripten/emcc.bat")
set(CMAKE_C_FLAGS "")
set(INCDIR "E:/TPS_HDD/UE4-HTML5-TPS/Intermediate/1.39.0-fc/libPNG-1.5.27/BUILD_Oz")
set(PNG_PREFIX "")
set(PNGLIB_MAJOR "1")
set(PNGLIB_MINOR "5")
set(PNGLIB_VERSION "1.5.27")
set(ZLIBINCDIR "E:/TPS_HDD/UE4-HTML5-TPS/HTML5_ThirdParty/zlib/v1.2.8/include")

get_filename_component(INPUTEXT "${INPUT}" EXT)
get_filename_component(OUTPUTEXT "${OUTPUT}" EXT)
get_filename_component(INPUTBASE "${INPUT}" NAME_WE)
get_filename_component(OUTPUTBASE "${OUTPUT}" NAME_WE)
get_filename_component(INPUTDIR "${INPUT}" PATH)
get_filename_component(OUTPUTDIR "${OUTPUT}" PATH)

if ("${INPUTEXT}" STREQUAL ".c" AND "${OUTPUTEXT}" STREQUAL ".out")
  get_filename_component(GENDIR "${OUTPUT}" PATH)
  file(MAKE_DIRECTORY "${GENDIR}")

  file(REMOVE "${OUTPUT}.tf1" "${OUTPUT}.tf2")

  set(INCLUDES "-I${INCDIR}")
  if(ZLIBINCDIR)
    list(APPEND INCLUDES "-I${ZLIBINCDIR}")
  endif()

  if(PNG_PREFIX)
    set(PNG_PREFIX_DEF "-DPNG_PREFIX=${PNG_PREFIX}")
  endif()

  execute_process(COMMAND "${CMAKE_C_COMPILER}" "-E"
                          ${CMAKE_C_FLAGS}
                          "-I${SRCDIR}"
                          "-I${BINDIR}"
                          "-DPNGLIB_LIBNAME=PNG${PNGLIB_MAJOR}${PNGLIB_MINOR}_0"
                          "-DPNGLIB_VERSION=${PNGLIB_VERSION}"
                          "-DSYMBOL_PREFIX=${SYMBOL_PREFIX}"
                          "-DPNG_NO_USE_READ_MACROS"
                          "-DPNG_BUILDING_SYMBOL_TABLE"
                          ${PNG_PREFIX_DEF}
                          "${INPUT}"
                  OUTPUT_FILE "${OUTPUT}.tf1"
                  WORKING_DIRECTORY "${BINDIR}"
                  RESULT_VARIABLE CPP_FAIL)
  if(CPP_FAIL)
    message(FATAL_ERROR "Failed to generate ${OUTPUT}.tf1")
  endif()

  execute_process(COMMAND "${AWK}" -f "${SRCDIR}/scripts/dfn.awk"
                          "out=${OUTPUT}.tf2" "${OUTPUT}.tf1"
                  WORKING_DIRECTORY "${BINDIR}"
                  RESULT_VARIABLE AWK_FAIL)
  if(AWK_FAIL)
    message(FATAL_ERROR "Failed to generate ${OUTPUT}.tf2")
  endif()

  file(REMOVE "${OUTPUT}.tf1")
  file(RENAME "${OUTPUT}.tf2" "${OUTPUT}")
else()
  message(FATAL_ERROR "Unsupported conversion: ${INPUTEXT} to ${OUTPUTEXT}")
endif()
