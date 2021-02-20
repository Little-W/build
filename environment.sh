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
	python \
        zip \
        xz-utils \
	llvm \
        zlib1g-dev 
git clone --depth 1 https://github.com/Little-W/clang ~/tc
sudo dd if=/dev/zero of=/swapfile bs=1M count=14800
sudo mkswap /swapfile
sudo swapon /swapfile
