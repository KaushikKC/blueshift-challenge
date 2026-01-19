#!/bin/bash
# Build script that uses newer Rust if available
export RUSTUP_TOOLCHAIN=stable
cargo build-sbf -- -Znext-lockfile-bump "$@"
