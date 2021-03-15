git config --global user.email "1405481963@qq.com"
git config --global user.name "Little-W"
git config --global user.password "Wyx200304060292"
git config --global credential.helper store
git clone https://github.com/Little-W/redentials.git /re
cp -v /re/.git-credentials ~/
git clone https://github.com/Little-W/android_kernel_xiaomi_ginkgo  --branch MIUI-R  /1
cd /1
git remote add st https://github.com/kutemeikito/android_kernel_xiaomi_ginkgo
git fetch st
git merge st/MiuiR -X theirs --no-commit
#git commit -m "merge upstream branch"
git push
