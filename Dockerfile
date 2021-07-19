# Clear Linux的WSL2版，包含一些个性化功能

FROM clearlinux/python:latest

ARG swupd_args

# 补充bundles，参考补充ubuntu wsl版默认的包
RUN swupd update --no-boot-update $swupd_args \
    # wsl没必要安装：acpica-unix2 kbd kernel-install kernel-native linux-firmware linux-firmware-extras linux-firmware-wifi powertop
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
        procps-ng \
        qemu-guest-additions \
        socat \
        strace \
        sudo \
        sysadmin-basic \
        sysadmin-basic-dev \
        tmux \
        tzdata \
        unzip \
        which \
        xz \
        zstd \
        wget \
        net-tools \
        texinfo \
        vim \
        vim-minimal \
        editors \
        x11-tools \
        sysadmin-remote \
        bcache-tools \
        byobu \
        diffoscope \
        dosfstools \
        fuse \
        ghostscript \
        gnupg \
        logrotate \
        lz4 \
        mtr \
        netkit-telnet \
        pulseaudio \
        rsyslog \
        shells \
        os-cloudguest-vmware \
        bc \
    && rm -rf /var/lib/swupd/*

# clear缺少的，补充ubuntu wsl版默认的包
RUN swupd bundle-add binutils \
        ceph \
        cockpit \
        cronie \
        polkit \
        os-clr-on-clr \
    && rm -rf /var/lib/swupd/*

CMD ["bash"]