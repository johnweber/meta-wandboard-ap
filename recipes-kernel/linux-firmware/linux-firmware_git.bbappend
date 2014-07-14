FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
  file://fw_bcm4329_apsta.bin \
  file://fw_bcm4330_apsta_bg.bin \
"
do_install_append () {
	install -m 644 ${WORKDIR}/fw_bcm4329_apsta.bin ${D}/lib/firmware/brcm/brcmfmac4329-ap-sdio.bin
	install -m 644 ${WORKDIR}/fw_bcm4330_apsta_bg.bin ${D}/lib/firmware/brcm/brcmfmac4330-ap-sdio.bin
}

FILES_${PN}-bcm4329 += " \
  /lib/firmware/brcm/brcmfmac4329-ap-sdio.bin \
"

FILES_${PN}-bcm4330 += " \
  /lib/firmware/brcm/brcmfmac4330-ap-sdio.bin \
"

ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac4329-sdio.bin] = "${BRCM_FWDIR}/brcmfmac4329-ap-sdio.bin"
ALTERNATIVE_PRIORITY_linux-firmware-bcm4329[brcmfmac4329-sdio.bin] = "90"

ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac4330-sdio.bin] = "${BRCM_FWDIR}/brcmfmac4330-ap-sdio.bin"
ALTERNATIVE_PRIORITY_linux-firmware-bcm4329[brcmfmac4330-sdio.bin] = "90"

