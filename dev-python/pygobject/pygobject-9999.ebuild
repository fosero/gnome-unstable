# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{11..14} pypy3 )

inherit meson virtualx xdg distutils-r1 git-r3

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="https://gitlab.gnome.org/GNOME/pygobject.git"

LICENSE="LGPL-2.1"
SLOT="3"
IUSE="+cairo examples test"

# KEYWORDS="amd64"
RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/glib-utils
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
	${PYTHON_DEPS}
"

python_configure() {
        local emesonargs=(
                $(meson_feature cairo pycairo)
                $(meson_use test tests)
                -Dpython="${EPYTHON}"
        )
	meson_src_configure
}

python_compile() {
        meson_src_compile
}

python_install() {
        meson_src_install
        python_optimize
}

python_install_all() {
        distutils-r1_python_install_all
        use examples && dodoc -r examples
}

#src_prepare() {
#	default
#        vala_src_prepare
#}

#src_configure() {
#	local emesonargs=(
#		-Ddocs=false
#		# $(meson_use gtk-doc docs)
#		# -Dfts=true
#		# -Dfunctional_tests=false # many fail in 2.2; retry with 2.3
#		#$(meson_use test functional_tests)
#		-Dman=false
#		$(meson_feature networkmanager network_manager)
#		$(meson_feature stemmer)
#		-Dunicode_support=icu
#		-Dbash_completion=false
#		-Dbash_completion_dir="$(get_bashcompdir)"
#		# -Dsystemd_user_services="$(systemd_get_userunitdir)"
#		--buildtype $(usex debug debug plain)
#	)
#	meson_src_configure
#}

#pkg_postinst() {
#	xdg_pkg_postinst
#	gnome2_schemas_update
#}

#pkg_postrm() {
#	xdg_pkg_postrm
#	gnome2_schemas_update
#}
