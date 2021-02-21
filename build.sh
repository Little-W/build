export PATH=~/tc/bin:$PATH
export LD_LIBRARY_PATH=~/tc/lib:$LD_LIBRARY_PATH
export KBUILD_BUILD_HOST="Litttle-W <1405481963@qq.com>"

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

