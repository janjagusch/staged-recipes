# !/bin/bash

set -exuo pipefail

env | grep duckdb-extension-

EXTENSION_NAME="httpfs"

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

mkdir -p "${PREFIX}"/duckdb/extensions/"v${PKG_VERSION}"/"${DUCKDB_ARCH}"/
cp ./build/release/repository/v"${PKG_VERSION}"/"${DUCKDB_ARCH}"/"${EXTENSION_NAME}".duckdb_extension "${PREFIX}"/duckdb/extensions/"v${PKG_VERSION}"/"${DUCKDB_ARCH}"/
