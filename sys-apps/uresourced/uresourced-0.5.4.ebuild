# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://gitlab.freedesktop.org/wayland/wayland.git"
	inherit git-r3
else
	SRC_URI="https://gitlab.freedesktop.org/benzea/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"
	KEYWORDS="amd64"
	S="${WORKDIR}/${PN}-v${PV}"
fi
inherit meson-multilib

DESCRIPTION="uresourced"
HOMEPAGE="https://gitlab.freedesktop.org/benzea/uresourced"

LICENSE="MIT"
SLOT="0"

BDEPEND="virtual/pkgconfig"
RDEPEND="
"
DEPEND="${RDEPEND}"

#multilib_src_configure() {
#	local emesonargs=(
#		-Ddocumentation=false
#		-Ddtd_validation=false
#		-Dlibraries=false
#		-Dscanner=true
#	)
#	meson_src_configure
#}
