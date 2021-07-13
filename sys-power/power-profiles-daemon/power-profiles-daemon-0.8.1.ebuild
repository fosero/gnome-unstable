# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit meson

DESCRIPTION="D-Bus service for power profile handling"
HOMEPAGE="https://gitlab.freedesktop.org/hadess/power-profiles-daemon/"
SRC_URI="https://gitlab.freedesktop.org/hadess/${PN}/-/archive/${PV}/${P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
IUSE="gtk-doc"

KEYWORDS="amd64"

RDEPEND="
        dev-libs/glib:2
        >=dev-libs/libgudev-234:=
        sys-apps/systemd
	sys-power/upower
"
DEPEND="${RDEPEND}"
BDEPEND="
        gtk-doc? ( dev-util/gtk-doc )
"

src_configure() {
        local emesonargs=(
                $(meson_use gtk-doc gtk_doc)
        )
        meson_src_configure
}

pkg_postinst() {
        if [[ -z "${REPLACING_VERSIONS}" ]]; then
                elog "You need to run systemd and enable the service:"
                elog "# systemctl enable power-profiles-daemon"
        fi
}
