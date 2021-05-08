sudo apt-get update
sudo apt-get install -y --no-install-recommends \
        bc \
        bison \
        ca-certificates \
        cmake \
        curl \
        file \
        flex \
        gcc \
        g++ \
        git \
        libelf-dev \
        libssl-dev \
        linux-libc-dev \
        linux-libc-dev:i386 \
        lld \
        make \
        ninja-build \
        python3 \
        texinfo \
	python2 \
        zip \
        xz-utils \
	llvm \
        clang \
        zlib1g-dev 

sudo ln -s /usr/include/asm-generic /usr/include/asm
git clone https://github.com/bminor/glibc --depth 1 ~/glibc
cd ~/glibc
mkdir build
cd build
../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin
make headers_install
make -j8
sudo make install
git clone --depth 1 https://github.com/Klozz/Yuki-clang ~/tc
~/tc/bin/clang -v
sudo dd if=/dev/zero of=/swapfile bs=1M count=40960
sudo mkswap /swapfile
sudo swapon /swapfile
cd /home/circleci/project
