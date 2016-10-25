# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit gnome2

DESCRIPTION="Graphene"
HOMEPAGE="https://github.com/ebassi/graphene"

LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="amd64"

RDEPEND="
	>=dev-libs/glib-2.30:2
	>=dev-libs/gobject-introspection-1.41:=
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

# FIXME: use meson
