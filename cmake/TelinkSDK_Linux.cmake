# Download and extract Telink Zigbee SDK
set(DOWNLOAD_URL_SDK "http://wiki.telink-semi.cn/tools_and_sdk/Zigbee/Zigbee_SDK.zip")
set(SDK_EXPECTED_SHA256 "0d0859e2412e3a52e9c3ba012bbf5d5b7c30554b8a96632659bd500ea18f7aa3")
set(DOWNLOAD_PATH_SDK "${CMAKE_CURRENT_BINARY_DIR}/Zigbee_SDK.zip")
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
set(DOWNLOAD_PATH_TOOLCHAIN "${CMAKE_CURRENT_BINARY_DIR}/tc32_gcc_v2.0.tar.bz2")
set(TOOLCHAIN_PREFIX_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/tc32")

if(NOT EXISTS ${TOOLCHAIN_PREFIX_LOCATION})
  if(NOT EXISTS ${DOWNLOAD_PATH_TOOLCHAIN})
    message(STATUS "Downloading SDK from ${DOWNLOAD_URL_TOOLCHAIN} to ${DOWNLOAD_PATH_TOOLCHAIN}")
    file(DOWNLOAD ${DOWNLOAD_URL_TOOLCHAIN} ${DOWNLOAD_PATH_TOOLCHAIN} SHOW_PROGRESS)
  endif()

  message(STATUS "Extracting toolchain to ${CMAKE_CURRENT_BINARY_DIR}")
  execute_process(COMMAND tar -xjf ${DOWNLOAD_PATH_TOOLCHAIN} -C ${CMAKE_CURRENT_BINARY_DIR})
endif()
