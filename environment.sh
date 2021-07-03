sudo apt update
sudo apt install -y --no-install-recommends \
        bc \
        bison \
        ca-certificates \
        cmake \
        curl \
        file \
        flex \
        gcc \
        g++ \
	alien \
        git \
        libelf-dev \
        libssl-dev \
        linux-libc-dev \
        lld \
        make \
        ninja-build \
        python3 \
        llvm \
        clang \
        texinfo \
	python2 \
        zip \
	gzip \
	tar \
        xz-utils \
        zlib1g-dev 
sudo apt install -y --no-install-recommends flex
#sudo wget -P /home/ https://github.com/sgerrand/docker-glibc-builder/releases/download/2.33-0/glibc-bin-2.33-0-x86_64.tar.gz
#sudo wget -P /home http://www.rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/g/glibc-2.33.9000-2.fc35.x86_64.rpm
#cd /home/
#sudo gzip -d glibc-bin-2.33-0-x86_64.tar.gz
#sudo tar -xvf glibc-bin-2.33-0-x86_64.tar
#ls /lib/x86_64-linux-gnu/
#echo "-----------"
#ls /lib
#export LD_PRELOAD=/home/glibc-bin-2.33-0-x86_64/usr/glibc-compat\lib\libc-2.33.so
#export LD_LIBRARY_PATH=/home/glibc-bin-2.33-0-x86_64/usr/glibc-compat\lib
#sudo rm -rf /lib/x86_64-linux-gnu/libc.so.6
#LD_PRELOAD=/lib/x86_64-linux-gnu/libc-2.31.so sudo ln -s /home/glibc-bin-2.33-0-x86_64/usr/glibc-compat\lib\libc-2.33.so  /lib/x86_64-linux-gnu/libc.so.6
git clone --depth 1 https://github.com/Little-W/proton-clang ~/tc
~/tc/bin/clang -v
sudo dd if=/dev/zero of=/swapfile bs=1M count=40960
sudo mkswap /swapfile
sudo swapon /swapfile
#cd /home/circleci/project
