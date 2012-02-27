# Copyright (C) 2011 The Android Open Source Project
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

#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/asus/tf101/tf101-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/tf101/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/asus/tf101/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# A few more packages that aren't quite used on all builds
PRODUCT_PACKAGES := \
	HoloSpiralWallpaper \
	LiveWallpapersPicker \
	VisualizationWallpapers

# Camera
PRODUCT_PACKAGES += \
    Camera

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
#$(call inherit-product, build/target/product/full.mk)

# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)

$(call inherit-product, device/asus/tf101/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_tf101
PRODUCT_DEVICE := tf101
PRODUCT_BRAND := asus
PRODUCT_MODEL := TF101
PRODUCT_MANUFACTURER := Asus
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=IML77 \
    BUILD_DISPLAY_ID="EOS IML74K Nightly $(EOS_BUILD_NUMBER) (`(cd $(ANDROID_BUILD_TOP)/.repo/manifests ; git log -1 --pretty=%h versioned.xml)`)" \
    BUILD_FINGERPRINT="asus/tf101:4.0.3/IML77/239789:user/release-keys" \
    PRIVATE_BUILD_DESC="tf101-user 4.0.3 IML77 239789 release-keys"