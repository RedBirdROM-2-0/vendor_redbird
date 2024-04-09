# Inherit common Lineage stuff
$(call inherit-product, vendor/redbird/config/common.mk)

# Inherit Lineage car device tree
$(call inherit-product, device/redbird/car/redbird_car.mk)
