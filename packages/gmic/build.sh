TERMUX_PKG_HOMEPAGE=https://gmic.eu
TERMUX_PKG_DESCRIPTION="Full-featured framework for image processing"
TERMUX_PKG_LICENSE="CeCILL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=3.2.5
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://gmic.eu/files/source/gmic_$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=ae1a903df27e3131702c27b6fea6bdd8faabd756f53e22d3f35fb790f22d2035
TERMUX_PKG_DEPENDS="fftw, imath, libc++, libcurl, libjpeg-turbo, libpng, libtiff, libx11, openexr, zlib"
TERMUX_PKG_BUILD_DEPENDS="graphicsmagick"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
	return 0;
}

termux_step_make() {
	cd src/
	make STRIP="$STRIP" OPT_CFLAGS="$CXXFLAGS" cli cli_gm
}

termux_step_make_install() {
	cp src/gmic $TERMUX_PREFIX/bin/
	cp src/gmic-gm $TERMUX_PREFIX/bin/
	cp man/gmic.1.gz $TERMUX_PREFIX/share/man/man1/
	cp man/gmic.1.gz $TERMUX_PREFIX/share/man/man1/gmic-gm.1.gz
}

