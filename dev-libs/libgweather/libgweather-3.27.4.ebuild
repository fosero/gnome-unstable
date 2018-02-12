# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
VALA_USE_DEPEND="vapigen"

inherit gnome2 meson vala

DESCRIPTION="Library to access weather information from online services"
HOMEPAGE="https://wiki.gnome.org/Projects/LibGWeather"

LICENSE="GPL-2+"
SLOT="2/3-15" # subslot = 3-(libgweather-3 soname suffix)

# introspection no longer optional, but backwars compatability.
IUSE="doc glade +introspection vala "

KEYWORDS="~alpha amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sh ~sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux ~x86-solaris"

COMMON_DEPEND="
	>=dev-libs/glib-2.35.1:2
	>=x11-libs/gtk+-3.13.5:3[introspection]
	>=net-libs/libsoup-2.44:2.4
	>=dev-libs/libxml2-2.6.0:2
	sci-geosciences/geocode-glib
	>=sys-libs/timezone-data-2010k

	glade? ( >=dev-util/glade-3.16:3.10 )
	>=dev-libs/gobject-introspection-0.9.5:=
"
RDEPEND="${COMMON_DEPEND}
	!<gnome-base/gnome-applets-2.22.0
"
DEPEND="${COMMON_DEPEND}
	>=dev-util/meson-0.43
	>=sys-devel/gettext-0.18
	virtual/pkgconfig
	vala? ( $(vala_depend) )
	doc? ( >=dev-util/gtk-doc-am-1.11 )
"

src_configure() {

	local emesonargs=(
		-Dglade_catalog=$(usex glade true false)
		-Dvala=$(usex vala true false)
		-Dgtk_doc=$(usex doc true false)
	)

        meson_src_configure

}

src_compile() {

        meson_src_compile

}

src_prepare() {

	use vala && vala_src_prepare
	gnome2_src_prepare

}
