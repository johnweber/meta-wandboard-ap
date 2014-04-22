FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

FW_FILE = "fw_bcm4329_apsta.bin"

SRC_URI_append = " \
	file://${FW_FILE} \
"

PACKAGES =+ "${PN}-bcm4329-ap"

do_install_append () { 
	install -m 644 ${WORKDIR}/${FW_FILE} ${D}/lib/firmware/brcm/${FW_FILE}
}

LICENSE_${PN}-bcm4329-ap = "Firmware-bcm4329"
FILES_${PN}-bcm4329-ap = " \
  /lib/firmware/brcm/${FW_FILE} \
"

RDEPENDS_${PN}-bcm4329-ap += "${PN}-broadcom-license"
ALTERNATIVE_linux-firmware-bcm4329-ap = "brcmfmac-sdio.bin"
ALTERNATIVE_TARGET_linux-firmware-bcm4329-ap[brcmfmac-sdio.bin] = "/lib/firmware/brcm/${FW_FILE}"
ALTERNATIVE_PRIORITY_linux-firmware-bcm4329-ap[brcmfmac-sdio.bin] = "90"
