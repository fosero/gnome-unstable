# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2 meson vala

DESCRIPTION=""
HOMEPAGE=""

LICENSE="GPL-2"
SLOT="0"
IUSE="introspection doc vala"

KEYWORDS="amd64"


RDEPEND="
	dev-libs/glib:2
	x11-libs/gtk+:3
"
DEPEND="${RDEPEND}
	doc? ( dev-util/gtk-doc )
	vala? ( dev-lang/vala )
"


src_prepare() {

	gnome2_src_prepare
	use vala && vala_src_prepare

}

src_configure() {

	local emesonargs=(
		-Denable_gtk_doc=$(usex doc true false) \
		-Denable_tests=false \
		-Dwith_introspection=$(usex introspection true false) \
		-Dwith_vapi=$(usex vala true false)
	)

	meson_src_configure
}
