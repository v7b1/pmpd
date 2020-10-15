cmake_minimum_required(VERSION 3.0)


include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-api/script/max-pretarget.cmake)


include_directories( 
	"${C74_INCLUDES}"
)

set(BUILD_SOURCES
	${PROJECT_NAME}.cpp
	pmpd.h
	pmpd_core.c
	pmpd_get.c
	pmpd_list.c
	pmpd_set.c
	pmpd_stat.c
	pmpd_tab.c
	pmpd_various.c

)

add_library( 
	${PROJECT_NAME} 
	MODULE
	
	${BUILD_SOURCES}
	
)

# create groups in our project
# source_group(TREE ${MUTABLE_PATH} FILES ${STMLIB_SOURCES})

include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-api/script/max-posttarget.cmake)
