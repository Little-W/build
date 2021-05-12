git config --global user.email "1405481963@qq.com"
git config --global user.name "Little-W"
git config --global user.password "Wyx200304060292"
git config --global credential.helper store
git clone git@github.com:Little-W/redentials.git /re
cp -v /re/.git-credentials ~/
git clone  https://github.com/Little-W/proton-clang --depth 3 /1
cd /1
#git branch -m f739fd5bf17ee9b0a8b60abd8295a71deda0fad4 MIUI-R
git reset --hard  5cade6cb315fc7f29be3b8abb4a1c60680ead5af
#git cherry-pick e35e86812a7e35c1320fc51c45565f61478dd045^..
git push -f
