LOCAL_PATH := $(call my-dir)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl libxml2 libbase libhidlbase libhidltransport libutils android.hardware.power@1.2
LOCAL_HEADER_LIBRARIES += libutils_headers
LOCAL_HEADER_LIBRARIES += libhardware_headers
LOCAL_SRC_FILES := power-common.c metadata-parser.c utils.c list.c hint-data.c power-msmnile.c powerhintparser.c service.cpp Power.cpp
LOCAL_C_INCLUDES := external/libxml2/include \
                    external/icu/icu4c/source/common
LOCAL_REQUIRED_MODULES := \
    android.hardware.power@1.2-service.xiaomi_raphael.rc

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
    LOCAL_CFLAGS += -DINTERACTION_BOOST
endif

LOCAL_MODULE := android.hardware.power@1.2-service
LOCAL_MODULE_STEM := android.hardware.power@1.2-service
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/bin
LOCAL_INIT_RC := android.hardware.power@1.2-service.rc
LOCAL_MODULE_TAGS := optional
LOCAL_HEADER_LIBRARIES := generated_kernel_headers
LOCAL_CFLAGS += -Wno-unused-parameter -Wno-unused-variable
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.power@1.2-service.xiaomi_raphael.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init
LOCAL_MODULE_STEM := android.hardware.power@1.2-service.rc
LOCAL_SRC_FILES := android.hardware.power@1.2-service.xiaomi_raphael.rc

include $(BUILD_PREBUILT)
