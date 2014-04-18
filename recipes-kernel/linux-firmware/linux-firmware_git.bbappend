FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = "file://fw_bcm4329_apsta.bin"

PACKAGES += "${PN}-bcm4329-ap"

LICENSE_${PN}-bcm4329-ap = "Firmware-bcm4329"
FILES_${PN}-bcm4329-ap = " \
  /lib/firmware/brcm/fw_bcm4329_apsta.bin \
"

RDEPENDS_${PN}-bcm4329-ap += "${PN}-broadcom-license"
ALTERNATIVE_linux-firmware-bcm4329-ap = "brcmfmac-sdio.bin"
ALTERNATIVE_TARGET_linux-firmware-bcm4329-ap[brcmfmac-sdio.bin] = "/lib/firmware/brcm/fw_bcm4329_apsta.bin"

