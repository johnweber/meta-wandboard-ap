FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_wandboard = " \
    file://wandboard-hostapd.conf \
    file://default \
"

do_install_append() {
    install -d ${D}${sysconfdir}/default
    install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/hostapd
    install -m 0644 ${WORKDIR}/wandboard-hostapd.conf ${D}${sysconfdir}/hostapd.conf
}

