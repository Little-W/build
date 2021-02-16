#!/usr/bin/env bash
set -eu

function do_deps() {
    # We only run this when running on GitHub Actions
    [[ -z ${GITHUB_ACTIONS:-} ]] && return 0
    sudo apt-get install -y --no-install-recommends \
        bc \
        bison \
        ca-certificates \
        clang \
        cmake \
        curl \
        file \
        flex \
        gcc \
        g++ \
        git \
        libelf-dev \
        libssl-dev \
        lld \
        make \
        ninja-build \
        python3 \
        texinfo \
        xz-utils \
        zlib1g-dev
}

do_deps
export PATH="~/tc/bin:$PATH"
export LD_LIBRARY_PATH="~/tc/lib:$LD_LIBRARY_PATH"
export KBUILD_BUILD_HOST="Litttle-W <1405481963@qq.com>"
git config --global user.email "1405481963@qq.com"
git config --global user.name "Little-W"
git config --global user.password "Wyx200304060292"
git clone https://github.com/Little-W/redentials.git ~/re
git config --global credential.helper store
cp -v ~/re/.git-credentials ~/
SECONDS=0
ZIPNAME="Akari-ginkgo-$(date '+%Y%m%d-%H%M').zip"
mkdir -p out
make O=out ARCH=arm64 vendor/ginkgo-perf_defconfig
if [[ $1 == "-r" || $1 == "--regen" ]]; then
cp out/.config arch/arm64/configs/vendor/ginkgo-perf_defconfig
echo -e "\nRegened defconfig succesfully!"
exit 0
else
echo -e "\nStarting compilation...\n"
make 	  -j$(nproc --all)  O=out \
                          ARCH=arm64 \
                          CC="clang" \
                          AR="llvm-ar" \
                          NM="llvm-nm" \
					      LD="ld.lld" \
			              AS="llvm-as" \
						  STRIP="llvm-strip" \
			              OBJCOPY="llvm-objcopy" \
			              OBJDUMP="llvm-objdump" \
						  CLANG_TRIPLE=aarch64-linux-gnu- \
                          CROSS_COMPILE=aarch64-linux-gnu-  \
                          CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
                          Image.gz-dtb \
                          dtbo.img
fi

if [ -f "out/arch/arm64/boot/Image.gz-dtb" ] && [ -f "out/arch/arm64/boot/dtbo.img" ]; then
echo -e "\nKernel compiled succesfully! Zipping up...\n"
git clone https://github.com/Little-W/AnyKernel3.git
cp out/arch/arm64/boot/Image.gz-dtb AnyKernel3
cp out/arch/arm64/boot/dtbo.img AnyKernel3
rm -f *zip
cd AnyKernel3
zip -r9 "../$ZIPNAME" * -x '*.git*' README.md *placeholder
cd ..
rm -rf AnyKernel3
echo -e "\nCompleted in $((SECONDS / 60)) minute(s) and $((SECONDS % 60)) second(s) !"
if command -v gdrive &> /dev/null; then
gdrive upload --share $ZIPNAME
else
echo "Zip: $ZIPNAME"
fi
rm -rf out
else
echo -e "\nCompilation failed!"
fi
git clone https://github.com/Little-W/release.git /release
cp -v $ZIPNAME /release
cd /release
git add .
git commit -m "$ZIPNAME"
git push -f

