project("foo_sdk" VERSION 0.1.0 LANGUAGES CXX)


set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib")

add_library(
    foo_sdk
    STATIC
    # SHARED
    foo_c_api.h
    foo_c_api.cc
)

# set library path
# set_target_properties(
#     foo_sdk
#     PROPERTIES
#     LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
#     ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
#     RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
#     LIBRARY_OUTPUT_DIRECTORY_DEBUG "${CMAKE_SOURCE_DIR}/lib"
# )

target_include_directories(
    foo_sdk
    PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}
)

# target_link_directories(
#     foo_sdk
#     PUBLIC
#     ${CMAKE_CURRENT_LIST_DIR}
# )

target_link_libraries(
    foo_sdk
    PUBLIC
    "${CMAKE_CURRENT_LIST_DIR}/mpbase.a"
)



