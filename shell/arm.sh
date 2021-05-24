brew-arm() {
 /opt/homebrew/bin/brew $@
}

brew() {
  arch -x86_64 /usr/local/bin/brew $@
}

# Stuff related to arm (?) from Abu

# For compilers to find zlib you may need to set
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
# For compilers to find bz2 you may need to set:
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/bzip2/include"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/openssl@1.1/lib/pkgconfig"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/readline/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/readline/lib/pkgconfig"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1
export SYSTEM_VERSION_COMPAT=1
