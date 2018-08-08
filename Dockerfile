From fedora:28

RUN dnf install -y \
    gcc \
    git \
    gnu-efi-devel \
    make

RUN git clone --branch 15 https://github.com/rhboot/shim.git /build/shim
WORKDIR /build/shim

ADD bccl.cer .

RUN mkdir build-x64

RUN make -C build-x64 ARCH=x86_64 VENDOR_CERT_FILE=../bccl.cer \
    TOPDIR=.. -f ../Makefile

RUN mkdir /build/install
RUN cp build-x64/shimx64.efi /build/install
