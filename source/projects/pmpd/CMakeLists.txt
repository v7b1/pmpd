
include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-sdk-base/script/max-pretarget.cmake)


include_directories( 
	"${C74_INCLUDES}"
)

set(BUILD_SOURCES
	${PROJECT_NAME}.cpp
	pmpd.h
	pmpd_core.h
	pmpd_get.h
	pmpd_list.h
	pmpd_set.h
	pmpd_stat.h
	pmpd_tab.h
	pmpd_various.h
	pmpd_test.h
	pmpd_deprecated.h

)

add_library( 
	${PROJECT_NAME} 
	MODULE
	
	${BUILD_SOURCES}
	
)

# create groups in our project
# source_group(TREE ${MUTABLE_PATH} FILES ${STMLIB_SOURCES})

include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-sdk-base/script/max-posttarget.cmake)
