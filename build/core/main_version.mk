# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# LineageOS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.redbird.version=$(REDBIRD_VERSION) \
    ro.redbird.releasetype=$(REDBIRD_BUILDTYPE) \
    ro.redbird.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(REDBIRD_VERSION) \
    ro.redbirdlegal.url=https://redprez16.com/redbirdromlatest
# LineageOS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.redbird.display.version=$(REDBIRD_DISPLAY_VERSION)

# LineageOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.redbird.build.version.plat.sdk=$(REDBIRD_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.redbird.build.version.plat.rev=$(REDBIRD_PLATFORM_REV)
