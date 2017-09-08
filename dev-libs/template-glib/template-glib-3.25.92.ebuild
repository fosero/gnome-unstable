# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit gnome2 meson vala

DESCRIPTION=""
HOMEPAGE=""

LICENSE="GPL-2"
SLOT="0"
IUSE="vala"

KEYWORDS="amd64"


COMMON_DEPEND="
		dev-libs/glib:2
		dev-libs/gobject-introspection
"
DEPEND="${COMMON_DEPEND}
	vala? ( dev-lang/vala )
"
RDEPEND="${COMMON_DEPEND}
"

src_prepare() {
	default
}

src_configure() {

	local emesonargs=(
		-Dwith_vapi=$(usex vala true false)
	)

	meson_src_configure
}
