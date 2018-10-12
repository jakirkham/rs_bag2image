cmake_minimum_required( VERSION 3.6 )

# Require C++17 (or later)
# set( CMAKE_CXX_STANDARD 17 )
set( CMAKE_CXX_STANDARD_REQUIRED ON )
set( CMAKE_CXX_EXTENSIONS OFF )

# Create Project
project( rs_bag2image )
add_executable( rs_bag2image version.h realsense.h realsense.cpp main.cpp )

# Set StartUp Project
set_property( DIRECTORY PROPERTY VS_STARTUP_PROJECT "rs_bag2image" )

# Find Package
# librealsense2
set( realsense2_DIR "C:/Program Files/librealsense2/lib/cmake/realsense2" CACHE PATH "Path to librealsense2 config directory." )
find_package( realsense2 REQUIRED )

# OpenCV
set( OpenCV_DIR "C:/Program Files/opencv/build" CACHE PATH "Path to OpenCV config directory." )
find_package( OpenCV REQUIRED )

# Boost
find_package( Boost REQUIRED COMPONENTS filesystem )

if( realsense2_FOUND AND OpenCV_FOUND AND Boost_FOUND )
  # Additional Include Directories
  message( STATUS "realsense_INCLUDE_DIR = ${realsense_INCLUDE_DIR}" )
  message( STATUS "realsense2_LIBRARY = ${realsense2_LIBRARY}" )
  target_include_directories( rs_bag2image PRIVATE ${realsense_INCLUDE_DIR} )
  target_include_directories( rs_bag2image PRIVATE ${OpenCV_INCLUDE_DIRS} )
  target_include_directories( rs_bag2image PRIVATE ${Boost_INCLUDE_DIRS} )

  # Additional Dependencies
  target_link_libraries( rs_bag2image ${realsense2_LIBRARY} )
  target_link_libraries( rs_bag2image ${OpenCV_LIBS} )
  target_link_libraries( rs_bag2image ${Boost_LIBRARIES} )
endif()
