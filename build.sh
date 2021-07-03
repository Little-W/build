export PATH=~/tc/bin:$PATH
export LD_LIBRARY_PATH=~/tc/lib:$LD_LIBRARY_PATH
export KBUILD_BUILD_HOST="Litttle-W <1405481963@qq.com>"
export KBUILD_BUILD_USER="Akari Kernel Project"
mkdir -p out
cp arch/arm64/configs/vendor/alioth_stock_defconfig out/.config
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

