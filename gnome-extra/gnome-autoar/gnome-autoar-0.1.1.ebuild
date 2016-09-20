# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit gnome2

DESCRIPTION="Archiving for GNOME"
HOMEPAGE="https://wiki.gnome.org/TingweiLan/GSoC2013Final"
LICENSE="LGPL-2+"
SLOT="0"
IUSE="gtk doc"

KEYWORDS="amd64"

RDEPEND="
	>=dev-libs/glib-2.35.6:2
	>=app-arch/libarchive-3.2
	gtk? ( >=x11-libs/gtk+-3.2:3 )
"
DEPEND="${RDEPEND}
	>=dev-libs/gobject-introspection-1.30
	virtual/pkgconfig
"

src_configure() {

	gnome2_src_configure \
		$(use_enable doc gtk-doc) \
		$(use_enable gtk)

}
