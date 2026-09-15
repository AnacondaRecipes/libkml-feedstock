export CMAKE_POLICY_VERSION_MINIMUM=3.5

if [[ "${target_platform}" == "osx-"* ]]; then
    export CXXFLAGS="$CXXFLAGS -D_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION"
fi

mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX}  \
      -DCMAKE_PREFIX_PATH=${PREFIX}     \
      $SRC_DIR
ctest
make install -j${CPU_COUNT} ${VERBOSE_CM}
