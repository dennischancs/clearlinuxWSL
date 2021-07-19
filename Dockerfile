# Clear Linux的WSL2版，包含一些个性化功能

FROM clearlinux/python:latest

ARG swupd_args

# Clear Linux的WSL2版
RUN swupd update --no-boot-update $swupd_args \
    # docker-base缺少的，补充iso默认安装的bundles
       # wsl没必要安装的 acpica-unix2 kbd kernel-install kernel-native linux-firmware linux-firmware-extras linux-firmware-wifi powertop
    && swupd bundle-add NetworkManager \
        aspell \
        curl \
        diffutils \
        file \
        glibc-locale \
        gzip \
        htop \
        iperf \
        iproute2 \
        less \
        lib-openssl \
        man-pages \
        minicom \
        openssh-client openssh-server \
        parallel \
        patch \
        perl-basic \
        procps-ng \
        qemu-guest-additions \
        socat \
        strace \
        sudo \
        sysadmin-basic \
        tmux \
        tzdata \
        unzip \
        which \
        wpa_supplicant \
        xz \
        zstd \
    # clear缺少的，补充ubuntu wsl版默认的包
    && swupd bundle-add bc \
        bcache-tools \
        binutils \
        boot-encrypted \
        byobu \
        c-basic \
        ceph \
        cockpit \
        cronie \
        dev-utils \
        diffoscope \
        dosfstools \
        editors \
        firmware-update \
        fuse \
        fwupdate \
        ghostscript \
        gnupg \
        logrotate \
        lz4 \
        mtr \
        netkit-telnet \
        os-cloudguest-vmware \
        os-clr-on-clr \
        polkit \
        pulseaudio \
        rsyslog \
        shells \
        storage-utils \
        sysadmin-basic-dev \   #include git
        sysadmin-remote \
        texinfo \
        vim \
        vim-minimal \
        x11-tools \
        xfsprogs \
        wget net-tools network-basic \
        neofetch \
    && rm -rf /var/lib/swupd/*

CMD ["bash"]