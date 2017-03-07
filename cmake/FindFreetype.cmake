find_package(PkgConfig QUIET)
pkg_check_modules(PC_FREETYPE freetype2)
set_extra_dirs(FREETYPE freetype)

find_path(FREETYPE_INCLUDEDIR ft2build.h
  PATH_SUFFIXES freetype2
  HINTS ${PC_FREETYPE_INCLUDEDIR} ${PC_FREETYPE_INCLUDE_DIRS}
  PATHS ${EXTRA_FREETYPE_INCLUDEDIR}
)
find_library(FREETYPE_LIBRARY
  NAMES freetype
  HINTS ${PC_FREETYPE_LIBDIR} ${PC_FREETYPE_LIBRARY_DIRS}
  PATHS ${EXTRA_FREETYPE_LIBDIR}
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Freetype DEFAULT_MSG FREETYPE_LIBRARY FREETYPE_INCLUDEDIR)

mark_as_advanced(FREETYPE_LIBRARY FREETYPE_INCLUDEDIR)

set(FREETYPE_LIBRARIES ${FREETYPE_LIBRARY})
set(FREETYPE_INCLUDE_DIRS ${FREETYPE_INCLUDEDIR})

string(FIND "${FREETYPE_LIBRARY}" "${PROJECT_SOURCE_DIR}" LOCAL_PATH_POS)
if(LOCAL_PATH_POS EQUAL 0 AND TARGET_OS STREQUAL "windows")
  set(FREETYPE_COPY_FILES "${EXTRA_FREETYPE_LIBDIR}/freetype.dll")
else()
  set(FREETYPE_COPY_FILES)
endif()
