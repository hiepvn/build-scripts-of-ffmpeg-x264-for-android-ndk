#!/bin/bash
NDK=/Users/hiep-vo/Library/Android/sdk/ndk-bundle
PLATFORM=$NDK/platforms/android-21/arch-mips64/
TOOLCHAIN=$NDK/toolchains/mips64el-linux-android-4.9/prebuilt/darwin-x86_64
PREFIX=./android/mips64

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=mips64-linux \
  --cross-prefix=$TOOLCHAIN/bin/mips64el-linux-android- \
  --sysroot=$PLATFORM \
  --disable-asm

  make clean
  make
  make install
}

build_one

echo Android MIPS_64 builds finished

