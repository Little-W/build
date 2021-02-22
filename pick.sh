git config --global user.email "1405481963@qq.com"
git config --global user.name "Little-W"
git config --global user.password "Wyx200304060292"
git config --global credential.helper store
git clone https://github.com/Little-W/redentials.git /re
cp -v /re/.git-credentials ~/
git clone https://github.com/Little-W/android_kernel_xiaomi_ginkgo  --branch f739fd5bf17ee9b0a8b60abd8295a71deda0fad4  /1
cd /1
git branch -m f739fd5bf17ee9b0a8b60abd8295a71deda0fad4 MIUI-R
#git reset --hard f1f07a36e9c6a58a521b4c5fe880bd13ec6c8d77
#git cherry-pick e35e86812a7e35c1320fc51c45565f61478dd045^..
git push -f
