cmake_minimum_required(VERSION 3.3)

MESSAGE("[NvCloth]cmake/html5/CMakeList.txt")
#set(CMAKE_VERBOSE_MAKEFILE ON)
include(../common/CMakeLists.txt)


IF(NOT DEFINED TARGET_BUILD_PLATFORM) # Not defined, default to HTML5
	SET(TARGET_BUILD_PLATFORM "html5")
ENDIF()

SET(PLATFORM_LIST html5)

IF (NOT ${TARGET_BUILD_PLATFORM} IN_LIST PLATFORM_LIST)
	MESSAGE(FATAL_ERROR "Invalid platform:" ${TARGET_BUILD_PLATFORM})
ENDIF()

# ----------------------------------------
SET(CMAKE_CXX_FLAGS "-std=c++11 -fno-rtti -fno-exceptions -ffunction-sections -fdata-sections -Werror -ferror-limit=0 -Wall -Wextra -fstrict-aliasing -Wstrict-aliasing=2 -Weverything -Wno-documentation-deprecated-sync -Wno-documentation-unknown-command -Wno-float-equal -Wno-padded -Wno-weak-vtables -Wno-cast-align -Wno-conversion -Wno-missing-noreturn -Wno-missing-variable-declarations -Wno-shift-sign-overflow -Wno-covered-switch-default -Wno-exit-time-destructors -Wno-global-constructors -Wno-missing-prototypes -Wno-unreachable-code -Wno-unused-macros -Wno-unused-member-function -Wno-used-but-marked-unused -Wno-weak-template-vtables -Wno-deprecated -Wno-non-virtual-dtor -Wno-invalid-noreturn -Wno-return-type-c-linkage -Wno-reserved-id-macro -Wno-c++98-compat-pedantic -Wno-unused-local-typedef -Wno-old-style-cast -Wno-newline-eof -Wno-unused-private-field -Wno-undefined-reinterpret-cast -Wno-invalid-offsetof -Wno-unused-value -Wno-format-nonliteral -Wno-undef -Wno-c++2a-compat -Wno-unused-private-field -Wno-tautological-type-limit-compare")
IF(NOT DEFINED ENV{UE_PHYSX_FASTCOMP})
	# to be default -- once upstream packaging is successful
	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-extra-semi-stmt -Wno-atomic-implicit-seq-cst")
ENDIF()

IF(DEFINED ENV{UE_PHYSX_SIMD})
	SET(CMAKE_CXX_FLAGS "-msimd128 ${CMAKE_CXX_FLAGS}")
ELSE()
	ADD_DEFINITIONS(-DPX_SIMD_DISABLED)
ENDIF()
# ----------------------------------------

SET(CMAKE_SHARED_LINKER_FLAGS "")

# Controls PX_NVTX for all projects on html5
SET(PHYSX_HTML5_ENABLE_NVTX 0)

# Disable cuda and dx for all projects on html5
SET(PHYSX_HTML5_COMPILE_DEFS DISABLE_COMPUTE_PHYSX)
SET(PHYSX_HTML5_DEBUG_COMPILE_DEFS _DEBUG;PX_DEBUG=1;PX_CHECKED=1;PX_NVTX=${PHYSX_HTML5_ENABLE_NVTX};PX_SUPPORT_PVD=0)
SET(PHYSX_HTML5_CHECKED_COMPILE_DEFS NDEBUG;PX_CHECKED=1;PX_NVTX=${PHYSX_HTML5_ENABLE_NVTX};PX_SUPPORT_PVD=0)
SET(PHYSX_HTML5_PROFILE_COMPILE_DEFS NDEBUG;PX_PROFILE=1;PX_NVTX=${PHYSX_HTML5_ENABLE_NVTX};PX_SUPPORT_PVD=0)
SET(PHYSX_HTML5_RELEASE_COMPILE_DEFS NDEBUG;PX_SUPPORT_PVD=0)

SET(PX_SELECT_COMPONENTS PxFoundation)
FIND_PACKAGE(PxShared REQUIRED)

# Include the PxShared-exports.cmake file that PxShared created. There's other ways to do this, but there's a bunch of issues with it in a CI environment
#  such as - we don't want to be installing any built artifacts on this server, etc. So for now we hack it.

# Add PxShared as a dependency so that we can use project references
ADD_SUBDIRECTORY(${PXSHARED_ROOT_DIR}/src/compiler/cmake/html5 "${CMAKE_CURRENT_BINARY_DIR}/pxshared_bin")

# Include all of the projects
INCLUDE(NvCloth.cmake)


