# Set required paths
set(DOWNLOAD_PATH "${CMAKE_CURRENT_BINARY_DIR}/downloads")
file(MAKE_DIRECTORY ${DOWNLOAD_PATH})

# Download and extract Telink Zigbee SDK
set(DOWNLOAD_URL_SDK "http://wiki.telink-semi.cn/tools_and_sdk/Zigbee/Zigbee_SDK.zip")
set(SDK_EXPECTED_SHA256 "ab2dad33c43bd21b7b35f9152e222fdbf48594e32988eb5d74dcc01b8002b4bc")
set(DOWNLOAD_PATH_SDK "${DOWNLOAD_PATH}/Zigbee_SDK.zip")
set(SDK_PREFIX_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/tl_zigbee_sdk")

if(NOT EXISTS ${SDK_PREFIX_LOCATION})
  if(NOT EXISTS ${DOWNLOAD_PATH_SDK})
    message(STATUS "Downloading SDK from ${DOWNLOAD_URL_SDK} to ${DOWNLOAD_PATH_SDK}")
    file(DOWNLOAD ${DOWNLOAD_URL_SDK} ${DOWNLOAD_PATH_SDK} SHOW_PROGRESS
            EXPECTED_HASH SHA256=${SDK_EXPECTED_SHA256})
  endif()

  message(STATUS "Extracting SDK to ${SDK_PREFIX_LOCATION}")
  execute_process(COMMAND unzip -o ${DOWNLOAD_PATH_SDK} -d ${CMAKE_CURRENT_BINARY_DIR})
endif()

# Download and extract Telink toolchain
set(DOWNLOAD_URL_TOOLCHAIN "http://shyboy.oss-cn-shenzhen.aliyuncs.com/readonly/tc32_gcc_v2.0.tar.bz2")
set(DOWNLOAD_PATH_TOOLCHAIN "${DOWNLOAD_PATH}/tc32_gcc_v2.0.tar.bz2")
set(TOOLCHAIN_PREFIX_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/tc32")

if(NOT EXISTS ${TOOLCHAIN_PREFIX_LOCATION})
  if(NOT EXISTS ${DOWNLOAD_PATH_TOOLCHAIN})
    message(STATUS "Downloading toolchain from ${DOWNLOAD_URL_TOOLCHAIN} to ${DOWNLOAD_PATH_TOOLCHAIN}")
    file(DOWNLOAD ${DOWNLOAD_URL_TOOLCHAIN} ${DOWNLOAD_PATH_TOOLCHAIN} SHOW_PROGRESS)
  endif()

  message(STATUS "Extracting toolchain to ${TOOLCHAIN_PREFIX_LOCATION}")
  execute_process(COMMAND tar -xjf ${DOWNLOAD_PATH_TOOLCHAIN} -C ${CMAKE_CURRENT_BINARY_DIR})
endif()
