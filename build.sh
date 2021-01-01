dd if=/dev/zero of=/swapfile bs=1M count=12000
mkswap /swapfile
swapon /swapfile
cd /sourse
export PATH="/proton/bin:$PATH"
export LD_LIBRARY_PATH="/proton/lib:$LD_LIBRARY_PATH"
export KBUILD_BUILD_HOST="Litttle-W <1405481963@qq.com>"
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
make -j$(nproc --all) O=out ARCH=arm64 CC=clang LD=ld.lld AR=llvm-ar AS=llvm-as NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- Image.gz-dtb
fi

if [ -f "out/arch/arm64/boot/Image.gz-dtb" ]; then
git clone -q git@github.com:Little-W/AnyKernel3.git
cp out/arch/arm64/boot/Image.gz-dtb AnyKernel3
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
git clone git@github.com:Little-W/build.git /build
cp -v $ZIPNAME /build
cd /build
git add .
git commit -m "$ZIPNAME"
git push -f

