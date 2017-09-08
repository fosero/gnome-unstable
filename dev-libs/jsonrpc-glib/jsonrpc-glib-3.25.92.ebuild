# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{3,4,5,6} )
inherit gnome2 meson

VALA_USE_DEPEND="vapigen"
DESCRIPTION=""
HOMEPAGE=""

LICENSE="GPL-2"
SLOT="0"
IUSE=""

KEYWORDS="amd64"


COMMON_DEPEND="
"
DEPEND="${COMMON_DEPEND}
"
RDEPEND="${COMMON_DEPEND}
"

PDEPEND="
"

src_prepare() {
	default
	vala_src_prepare
}

src_configure() {

	local emesonargs=(
		-Dwith_vapi=true
	)

	meson_src_configure
}
