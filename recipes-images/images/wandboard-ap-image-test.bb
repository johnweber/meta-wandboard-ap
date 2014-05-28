include recipes-core/images/core-image-base.bb

SOC_EXTRA_IMAGE_FEATURES ?= ""

# Add extra image features
EXTRA_IMAGE_FEATURES += " \
    ${SOC_EXTRA_IMAGE_FEATURES} \
"

IMAGE_INSTALL += " \
    packagegroup-wandboard-ap-test \
"

# Because hostapd v1 does not seem to work with the BCM4329
PREFERRED_VERSION_hostap-daemon = "2.0"

export IMAGE_BASENAME = "wandboard-ap-image-test"
