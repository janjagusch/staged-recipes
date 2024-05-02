# !/bin/bash

set -exuo pipefail


# PKG_PREFIX="duckdb-extension-"
# EXTENSION_NAME="${PKG_NAME#$PKG_PREFIX}"  # This doesn't seem to work.
# env | grep 'duckdb-extension-json'
EXTENSION_NAME='json'

if [ "${target_platform}" = "linux-64" ]; then
    DUCKDB_ARCH='linux_amd64'
elif [ "${target_platform}" = "osx-64" ]; then
    DUCKDB_ARCH='osx_amd64'
elif [ "${target_platform}" = "osx-arm64" ]; then
    DUCKDB_ARCH='osx_arm64'
else
    echo "Unknown target platform: ${target_platform}"
    exit 1
fi

make \
    BUILD_EXTENSIONS="${EXTENSION_NAME}" \
    SKIP_EXTENSIONS="parquet;jemalloc" \
    BUILD_EXTENSIONS_ONLY="1" \
    OVERRIDE_GIT_DESCRIBE="v${PKG_VERSION}-0-g4a89d97"

mkdir -p "${PREFIX}"/duckdb/extensions/"v${PKG_VERSION}"/"${DUCKDB_ARCH}"/
# cp ./build/release/repository/v"${PKG_VERSION}"/"${DUCKDB_ARCH}"/"${EXTENSION_NAME}".duckdb_extension "${PREFIX}"/duckdb/extensions/"v${PKG_VERSION}"/"${DUCKDB_ARCH}"/
