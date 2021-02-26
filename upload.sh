SECONDS=0
ZIPNAME="Akari-ginkgo-$(date '+%Y%m%d-%H%M').zip"
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
else
echo -e "\nCompilation failed!"
fi
git clone --depth 1 https://github.com/Little-W/kernel-release.git ~/release
rm -f ~/release/*.zip
cp -v $ZIPNAME ~/release
cd ~/release
git add .
git commit -m "$ZIPNAME"
git push 

