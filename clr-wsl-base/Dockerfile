# Clear Linux的WSL2版，包含一些个性化功能

FROM clearlinux:latest

ARG swupd_args

# 补充bundles，参考补充ubuntu wsl版默认的包
RUN swupd update --no-boot-update $swupd_args \
    && swupd bundle-add python3-basic \
        sysadmin-basic \
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
    && rm -rf /var/lib/swupd/* \
    && rm -rf /tmp/*

RUN pip install --quiet --no-cache-dir xonsh \
    && chsh -s /usr/local/bin/xonsh \
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
    && rm -rf /tmp/*

COPY .xonshrc /root/

CMD ["xonsh"]