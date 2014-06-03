FILESEXTRAPATHS_prepend := "${THISDIR}:"

SRC_URI_append = " \
	file://gliveserver \
"

do_install_append () {
        install -m 0755 ${WORKDIR}/gliveserver ${D}${sysconfdir}/init.d/gliveserver

	update-rc.d -r ${D} gliveserver start 99 5 .
}

