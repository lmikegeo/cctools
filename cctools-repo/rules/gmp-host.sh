build_gmp_host() {
    PKG=gmp
    PKG_VERSION=$gmp_version
    PKG_DESC="Multiprecision arithmetic library."
    O_FILE=$SRC_PREFIX/$PKG/$PKG-$PKG_VERSION.tar.bz2
    S_DIR=$src_dir/${PKG}-${PKG_VERSION}
    B_DIR=$build_dir/host-${PKG}

    c_tag ${PKG}-host && return

    banner "Build $PKG host"

    pushd .

    tar jxf $O_FILE -C $src_dir || error "tar jxf $O_FILE"

    cd $S_DIR
    patch -p1 < $patch_dir/${PKG}-${PKG_VERSION}.patch

    mkdir -p $B_DIR
    cd $B_DIR

    $S_DIR/configure --prefix=${TARGET_DIR}-host --enable-cxx --disable-werror --enable-static --disable-shared || error "configure"

    $MAKE $MAKEARGS || error "make $MAKEARGS"

    $MAKE install || error "make install"

    popd
    s_tag ${PKG}-host
}
