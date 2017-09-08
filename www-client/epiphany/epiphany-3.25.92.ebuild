# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic eutils gnome2 virtualx meson

DESCRIPTION="GNOME webbrowser based on Webkit"
HOMEPAGE="https://wiki.gnome.org/Apps/Web"

LICENSE="GPL-3+"
SLOT="0"
IUSE="test"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~sparc ~x86"

COMMON_DEPEND="
	>=dev-libs/glib-2.52.0:2[dbus]
	>=x11-libs/gtk+-3.22.13:3
	>=net-libs/webkit-gtk-2.17.4:4=
	>=x11-libs/cairo-1.2
	>=app-crypt/gcr-3.5.5:=
	>=x11-libs/gdk-pixbuf-2.36.5:2
	>=gnome-base/gnome-desktop-2.91.2:3=
	dev-libs/icu:=
	>=dev-libs/json-glib-1.2.4
	>=x11-libs/libnotify-0.5.1:=
	>=app-crypt/libsecret-0.14
	>=net-libs/libsoup-2.48:2.4
	>=dev-libs/libxml2-2.6.12:2
	>=dev-libs/libxslt-1.1.7
	>=dev-libs/nettle-3.2
	dev-db/sqlite:3
	>=app-text/iso-codes-0.35
"
RDEPEND="${COMMON_DEPEND}
	x11-themes/adwaita-icon-theme
	!www-client/epiphany-extensions
"
DEPEND="${COMMON_DEPEND}
	>=sys-devel/gettext-0.19.8
	>=dev-util/meson-0.37
	virtual/pkgconfig
"

#PATCHES=(
#	# https://bugzilla.gnome.org/show_bug.cgi?id=751591
#	"${FILESDIR}"/${PN}-3.16.0-unittest-1.patch
#
#	# https://bugzilla.gnome.org/show_bug.cgi?id=751593
#	"${FILESDIR}"/${PN}-3.14.0-unittest-2.patch
#)

src_configure() {
	# https://bugzilla.gnome.org/show_bug.cgi?id=778495
	append-cflags -std=gnu11

	# httpseverywhere is experimental; gnome bug #775575
	# firefox sync storage is not quite ready in 3.24; deps on hogweed/nettle
	local emesonargs=(
		-Ddistributor_name=fosero \
		-Dhttps_everywhere=false \
		-Dunit_tests=$(usex test true false)
	)
	meson_src_configure
}

#src_test() {
#
#	"${EROOT}${GLIB_COMPILE_SCHEMAS}" --allow-any-name "${S}/data" || die
#	GSETTINGS_SCHEMA_DIR="${S}/data" virtx emake check
#}
