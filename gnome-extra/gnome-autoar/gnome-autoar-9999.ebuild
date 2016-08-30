# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GNOME2_LA_PUNT="yes"

inherit gnome2
if [[ ${PV} = 9999 ]]; then
	inherit gnome2-live
fi

DESCRIPTION="Archiving for GNOME"
HOMEPAGE="https://wiki.gnome.org/TingweiLan/GSoC2013Final"
LICENSE="LGPL-2+"
SLOT="0"
IUSE="gtk"
if [[ ${PV} = 9999 ]]; then
	IUSE="${IUSE} doc"
	REQUIRED_USE="doc? ( gtk )"
	KEYWORDS=""
else
	KEYWORDS=""
fi

RDEPEND="
	>=dev-libs/glib-2.35.6:2
	>=app-arch/libarchive-3.1
	gtk? ( >=x11-libs/gtk+-3.2:3 )
"
DEPEND="${RDEPEND}
	>=dev-libs/gobject-introspection-1.30
	virtual/pkgconfig
"

if [[ ${PV} = 9999 ]]; then
	DEPEND="${DEPEND}
		doc? ( >=dev-util/gtk-doc-1.14 )"
fi

src_configure() {
	local myconf=""
	[[ ${PV} != 9999 ]] && myconf="ITSTOOL=$(type -P true)"

	gnome2_src_configure \
		$(use_enable doc gtk-doc) \
		$(use_enable gtk) \
		${myconf}
}
