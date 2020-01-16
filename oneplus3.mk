#
# Copyright (C) 2020 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ALLOW_MISSING_DEPENDENCIES=true
TARGET_USES_AOSP := true
TARGET_USES_AOSP_FOR_AUDIO := false
TARGET_USES_QCOM_BSP := false

DEVICE_PACKAGE_OVERLAYS := device/oneplus/oneplus3/overlay
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

TARGET_USES_NQ_NFC := true
BOARD_FRP_PARTITION_NAME :=frp

TARGET_KERNEL_VERSION := 3.18

# QTIC
-include $(QCPATH)/common/config/qtic-config.mk

# Add soft home, back and multitask keys.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.hw.mainkeys=0

# Video Seccomp policy files.
PRODUCT_COPY_FILES += \
    device/oneplus/oneplus3/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    device/oneplus/oneplus3/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Enable features in video HAL that can compile only on this platform.
TARGET_USES_MEDIA_EXTENSIONS := true

# Copy customized media_profiles and media_codecs xmls for msm8996.
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += \
    device/oneplus/oneplus3/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/oneplus/oneplus3/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    device/oneplus/oneplus3/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/oneplus/oneplus3/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    device/oneplus/oneplus3/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    device/oneplus/oneplus3/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml
endif

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service \
    android.hardware.power@1.0-impl

# Override heap growth limit due to high display density on device.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, device/oneplus/oneplus3/common64.mk)

# Platform WLAN chipset for msm8996.
WLAN_CHIPSET := qca_cld


# System property for opengles version.
#
# 196608 is decimal for 0x30000 to report version 3
# 196609 is decimal for 0x30001 to report version 3.1
# 196610 is decimal for 0x30002 to report version 3.2
PRODUCT_PROPERTY_OVERRIDES  += \
    ro.opengles.version=196610

PRODUCT_BOOT_JARS += tcmiface

PRODUCT_PACKAGES += telephony-ext

DEVICE_MANIFEST_FILE := device/oneplus/oneplus3/manifest.xml
DEVICE_MATRIX_FILE   := device/oneplus/oneplus3/compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := device/oneplus/oneplus3/framework_manifest.xml

#Android EGL implementation.
PRODUCT_PACKAGES += libGLES_android

# Audio configuration file.
-include $(TOPDIR)hardware/qcom/audio/configs/msm8996/msm8996.mk

# WLAN driver configuration files.
PRODUCT_COPY_FILES += \
    device/oneplus/oneplus3/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# MIDI
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf


# For WLAN.
PRODUCT_PACKAGES += \
    wificond \
    wifilogd

ifneq ($(WLAN_CHIPSET),)
PRODUCT_PACKAGES += $(WLAN_CHIPSET)_wlan.ko
endif

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    libvolumelistener

# Display/Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    android.hardware.configstore@1.0-service \
    android.hardware.broadcastradio@1.0-impl

PRODUCT_PACKAGES += \
    vendor.display.color@1.0-service \
    vendor.display.color@1.0-impl

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service \

# VB XML
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

# Camera configuration file, shared by passthrough/binderized camera HAL.
PRODUCT_PACKAGES += camera.device@3.2-impl
PRODUCT_PACKAGES += camera.device@1.0-impl
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-impl

# Enable binderized camera HAL.
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-service

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

# DM-Verity configuration.
PRODUCT_SUPPORTS_VERITY := true
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/bootdevice/by-name/system

# FEATURE_OPENGLES_EXTENSION_PACK support string configuration file.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# MSM IRQ Balancer configuration file.
PRODUCT_COPY_FILES += \
    device/oneplus/oneplus3/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1

# List of AAPT configurations
PRODUCT_AAPT_CONFIG += xlarge large

# Powerhint configuration file
PRODUCT_COPY_FILES += \
    device/oneplus/oneplus3/powerhint.xml:system/etc/powerhint.xml

# Healthd
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service \
    libhealthd.msm

PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

# Enable logdumpd service only for non-perf boot image.
ifeq ($(findstring perf,$(KERNEL_DEFCONFIG)),)
    ifeq ($(TARGET_BUILD_VARIANT),user)
        PRODUCT_DEFAULT_PROPERTY_OVERRIDES+= \
            ro.logdumpd.enabled=0
    else
        #PRODUCT_DEFAULT_PROPERTY_OVERRIDES+= \
            ro.logdumpd.enabled=1
    endif
else
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES+= \
        ro.logdumpd.enabled=0
endif

PRODUCT_PACKAGES += \
    libandroid_net \
    libandroid_net_32

# Lights
PRODUCT_PACKAGES += \
     android.hardware.light@2.0-impl

TARGET_SUPPORT_SOTER := true

#Enable AOSP KEYMASTER and GATEKEEPER HIDLs.
ifneq ($(KMGK_USE_QTI_SERVICE), true)
PRODUCT_PACKAGES += android.hardware.gatekeeper@1.0-impl \
                    android.hardware.gatekeeper@1.0-service \
                    android.hardware.keymaster@3.0-impl \
                    android.hardware.keymaster@3.0-service
endif

# Defined the locales.
PRODUCT_LOCALES += th_TH vi_VN tl_PH hi_IN ar_EG ru_RU tr_TR pt_BR bn_IN mr_IN ta_IN te_IN zh_HK \
        in_ID my_MM km_KH sw_KE uk_UA pl_PL sr_RS sl_SI fa_IR kn_IN ml_IN ur_IN gu_IN or_IN

PRODUCT_PROPERTY_OVERRIDES += rild.libpath=/system/vendor/lib64/libril-qc-qmi-1.so

# Set this true as ROME which is programmed
# as embedded wipower mode by deafult.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.emb_wp_mode=true \
    ro.vendor.bluetooth.emb_wp_mode=true

# System property for wipower support.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.wipower=true \
    ro.vendor.bluetooth.wipower=true

#Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service

SDM660_DISABLE_MODULE := true

# Enable extra vendor libraries.
ENABLE_EXTRA_VENDOR_LIBS := true
PRODUCT_PACKAGES += vendor-extra-libs


###################################################################################
# This is the End of target.mk file.
# Now, Pickup other split product.mk files:
###################################################################################
$(call inherit-product-if-exists, vendor/qcom/defs/product-defs/legacy/*.mk)
###################################################################################
