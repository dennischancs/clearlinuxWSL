# Clear Linux的WSL2版，包含一些个性化功能

FROM clearlinux/python:latest

ARG swupd_args

# 补充bundles，参考补充ubuntu wsl版默认的包
RUN swupd update --no-boot-update $swupd_args \
    && swupd bundle-add sysadmin-basic \
        sysadmin-remote \
        editors \
        aspell \
        curl wget git \
        openssh-server \
        less \
        net-tools \
        mtr \
        netkit-telnet \
        texinfo \
        x11-tools \
        byobu \
        diffoscope \
        dosfstools \
        fuse \
        ghostscript \
        logrotate \
        lz4 \
        rsyslog \
        ceph \
        cronie \
        polkit \
    && rm -rf /var/lib/swupd/*

CMD ["bash"]