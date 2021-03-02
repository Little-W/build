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
        lld \
        make \
        ninja-build \
        python3 \
        texinfo \
	python2 \
        zip \
        xz-utils \
	llvm \
        zlib1g-dev 
git clone --depth 1 git@github.com:stormbreaker-project/stormbreaker-clang.git ~/tc
~/tc/bin/clang -v
sudo dd if=/dev/zero of=/swapfile bs=1M count=40960
sudo mkswap /swapfile
sudo swapon /swapfile
