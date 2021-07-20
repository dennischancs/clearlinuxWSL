# Clear Linux的WSL2版，包含一些个性化功能

FROM clearlinux:latest

ARG swupd_args

# 补充bundles，参考补充ubuntu wsl版默认的包
RUN swupd update --no-boot-update $swupd_args \
    && swupd bundle-add python3-basic \
        sysadmin-basic \
        storage-utils \
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
        rsync \
    && rm -rf /var/lib/swupd/* \
    && rm -rf /tmp/*

# add xonsh
RUN pip install --no-cache-dir xonsh \
    && /usr/bin/python3 -m pip install --no-cache-dir \
        xontrib-argcomplete \
        xonsh-autoxsh \
        xonsh-docker-tabcomplete \
        xontrib-hist-navigator \
        xontrib-output-search \
        xontrib-pipeliner \
        xontrib-pyenv \
        xontrib-ssh-agent \
        xontrib-z \
        xontrib-back2dir \
        xontrib-sh \
    && rm -rf /tmp/*

# wsl setting，DNS no 172.28.160.1
RUN rm -f /etc/wsl.conf \
    && echo "[network]" > /etc/wsl.conf \
    && echo "generateResolvConf = false" >> /etc/wsl.conf \
    && rm -f /etc/resolv.conf \
    && echo "# /etc/resolv.conf" > /etc/resolv.conf \
    && echo "nameserver 223.5.5.5" >> /etc/resolv.conf \
    && echo "nameserver 223.6.6.6" >> /etc/resolv.conf \
    && chattr +i /etc/resolv.conf

# set xonsh as default, ubuntu没这么麻烦的问题
COPY .xonshrc /root/
COPY passwd /etc/
RUN chage -M 99999 root \
    && chage -m 0 root \
    && chage -W 7 root \
    && chmod 644 /etc/passwd \
    && cp /etc/passwd /etc/passwd- \
    && chsh -s $(which xonsh) \
    # let `chsh` work for `root` after build
    && sed s/required/sufficient/g -i /usr/share/pam.d/chsh

CMD ["xonsh"]