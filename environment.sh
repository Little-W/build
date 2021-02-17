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
        zlib1g-dev 
git clone --depth 1 https://github.com/kutemeikito/RastaMod69-Clang ~/tc
sudo dd if=/dev/zero of=/swapfile bs=1M count=10240
sudo mkswap /swapfile
sudo swapon /swapfile
