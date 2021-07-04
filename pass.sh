	mkdir -p out
  make O=out ARCH=arm64 alioth_defconfig
	echo -e "\n" | make   -j$(nproc --all)  out \
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
                                 CROSS_COMPILE_ARM32=arm-linux-gnueabi- 
