
include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-sdk-base/script/max-pretarget.cmake)


include_directories( 
	"${C74_INCLUDES}"
	"${CMAKE_CURRENT_SOURCE_DIR}/../../include/"
)


add_library( 
	${PROJECT_NAME} 
	MODULE
	${PROJECT_NAME}.cpp
	
)


include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-sdk-base/script/max-posttarget.cmake)
