# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "D:\Program Files\JetBrains\CLion 2020.2.1\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "D:\Program Files\JetBrains\CLion 2020.2.1\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:\DataStructs\DLinkList

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:\DataStructs\DLinkList\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/DLinkList.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/DLinkList.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/DLinkList.dir/flags.make

CMakeFiles/DLinkList.dir/main.cpp.obj: CMakeFiles/DLinkList.dir/flags.make
CMakeFiles/DLinkList.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\DataStructs\DLinkList\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/DLinkList.dir/main.cpp.obj"
	D:\mingw64\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\DLinkList.dir\main.cpp.obj -c E:\DataStructs\DLinkList\main.cpp

CMakeFiles/DLinkList.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DLinkList.dir/main.cpp.i"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E E:\DataStructs\DLinkList\main.cpp > CMakeFiles\DLinkList.dir\main.cpp.i

CMakeFiles/DLinkList.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DLinkList.dir/main.cpp.s"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S E:\DataStructs\DLinkList\main.cpp -o CMakeFiles\DLinkList.dir\main.cpp.s

# Object files for target DLinkList
DLinkList_OBJECTS = \
"CMakeFiles/DLinkList.dir/main.cpp.obj"

# External object files for target DLinkList
DLinkList_EXTERNAL_OBJECTS =

DLinkList.exe: CMakeFiles/DLinkList.dir/main.cpp.obj
DLinkList.exe: CMakeFiles/DLinkList.dir/build.make
DLinkList.exe: CMakeFiles/DLinkList.dir/linklibs.rsp
DLinkList.exe: CMakeFiles/DLinkList.dir/objects1.rsp
DLinkList.exe: CMakeFiles/DLinkList.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:\DataStructs\DLinkList\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable DLinkList.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\DLinkList.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/DLinkList.dir/build: DLinkList.exe

.PHONY : CMakeFiles/DLinkList.dir/build

CMakeFiles/DLinkList.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\DLinkList.dir\cmake_clean.cmake
.PHONY : CMakeFiles/DLinkList.dir/clean

CMakeFiles/DLinkList.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\DataStructs\DLinkList E:\DataStructs\DLinkList E:\DataStructs\DLinkList\cmake-build-debug E:\DataStructs\DLinkList\cmake-build-debug E:\DataStructs\DLinkList\cmake-build-debug\CMakeFiles\DLinkList.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DLinkList.dir/depend

