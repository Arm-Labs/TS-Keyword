# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.23.1)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(open_iot_sdk-populate NONE)


# Pass through things we've already detected in the main project to avoid
# paying the cost of redetecting them again in ExternalProject_Add()
set(GIT_EXECUTABLE [==[/usr/bin/git]==])
set(GIT_VERSION_STRING [==[2.25.1]==])
set_property(GLOBAL PROPERTY _CMAKE_FindGit_GIT_EXECUTABLE_VERSION
  [==[/usr/bin/git;2.25.1]==]
)


include(ExternalProject)
ExternalProject_Add(open_iot_sdk-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://git.gitlab.arm.com/iot/open-iot-sdk/sdk.git" "GIT_TAG" "dc62ef0bb0bc39f1ed67c33758e36482d3c6b2ff"
                    SOURCE_DIR          "/mnt/c/data/dev/Arm/iot-sdk-repos/github_custom_runner/TS-Keyword/application/junk/_deps/open_iot_sdk-src"
                    BINARY_DIR          "/mnt/c/data/dev/Arm/iot-sdk-repos/github_custom_runner/TS-Keyword/application/junk/_deps/open_iot_sdk-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
                    USES_TERMINAL_PATCH     YES
)


