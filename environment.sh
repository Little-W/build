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
git clone --depth 1 https://github.com/kdrag0n/proton-clang ~/tc
export PATH=~/tc/bin:$PATH
export LD_LIBRARY_PATH=~/tc/lib:$LD_LIBRARY_PATH
