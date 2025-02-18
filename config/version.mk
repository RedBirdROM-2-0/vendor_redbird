PRODUCT_VERSION_MAJOR = 21
PRODUCT_VERSION_MINOR = 0

ifeq ($(REDBIRD_VERSION_APPEND_TIME_OF_DAY),true)
    REDBIRD_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    REDBIRD_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set REDBIRD_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef REDBIRD_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "REDBIRD_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^REDBIRD_||g')
        REDBIRD_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(REDBIRD_BUILDTYPE)),)
    REDBIRD_BUILDTYPE := UNOFFICIAL
    REDBIRD_EXTRAVERSION :=
endif

ifeq ($(REDBIRD_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        REDBIRD_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

REDBIRD_VERSION_SUFFIX := $(REDBIRD_BUILD_DATE)-$(REDBIRD_BUILDTYPE)$(REDBIRD_EXTRAVERSION)-$(REDBIRD_BUILD)

# Internal version
REDBIRD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(REDBIRD_VERSION_SUFFIX)

# Display version
REDBIRD_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(REDBIRD_VERSION_SUFFIX)
