HOMEPAGE = "http://hostap.epitest.fi"
SECTION = "kernel/userland"
LICENSE = "GPLv2 | BSD"
LIC_FILES_CHKSUM = "file://README;md5=a07250b28e857455336bb59fc31cb845"
DEPENDS = "libnl openssl"
DESCRIPTION = "User space daemon for extended IEEE 802.11 management"

inherit update-rc.d
INITSCRIPT_NAME = "hostapd"

PR = "r0"

SRCREV = "a06b1070d8902460a9c61a3e13af577327fce6b3"

SRC_URI = " \
    git://w1.fi/hostap.git \
    file://0001-Revert-a6cc060-breaks-Duovero-with-kernel-3.6.patch \
    file://defconfig \
    file://wandboard-hostapd.conf \
    file://init \
    file://default \
"

S = "${WORKDIR}/git"

do_configure() {
    install -m 0644 ${WORKDIR}/defconfig ${S}/hostapd/.config
}

do_compile() {
    cd hostapd
    export CFLAGS="-MMD -O2 -Wall -I${STAGING_INCDIR}/libnl3"
    make
}

do_install() {
    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd

    install -d ${D}${sysconfdir}/default/
    install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/hostapd

    install -m 0644 ${WORKDIR}/wandboard-hostapd.conf ${D}${sysconfdir}/hostapd.conf

    install -d ${D}${sbindir}
    install -m 0755 ${S}/hostapd/hostapd ${D}${sbindir}
    install -m 0755 ${S}/hostapd/hostapd_cli ${D}${sbindir}
}

FILES_${PN} += "${sysconfdir} ${sbindir}"

