FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

FW_FILE = "fw_bcm4329_apsta.bin"

SRC_URI_append = " file://${FW_FILE}"

PACKAGES =+ "${PN}-bcm4329-ap"

do_install_append () { 
	cp -r ${WORKDIR}/${FW_FILE} ${D}/lib/firmware/brcm/${FW_FILE}
}

LICENSE_${PN}-bcm4329-ap = "Firmware-bcm4329"
FILES_${PN}-bcm4329-ap = " \
  /lib/firmware/brcm/${FW_FILE} \
"

RDEPENDS_${PN}-bcm4329-ap += "${PN}-broadcom-license"

