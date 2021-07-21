# Clear Linux的WSL2版，包含一些个性化功能

FROM clearlinux:latest

ARG swupd_args

COPY container-files /
RUN chmod u+x,g+x /wsldns.sh \
    # prepare: set xonsh as default, ubuntu没这么麻烦的问题
    && chage -M 99999 root \
    && chage -m 0 root \
    && chage -W 7 root \
    && chmod 644 /etc/passwd \
    && cp /etc/passwd /etc/passwd- \
    # let `chsh` work for `root` after build
    && sed s/required/sufficient/g -i /usr/share/pam.d/chsh


# 补充bundles，参考补充ubuntu wsl版默认的包
RUN swupd update --no-boot-update $swupd_args \
    && swupd bundle-add python3-basic \
        sysadmin-basic \
        sysadmin-remote \
        editors \
        #aspell \
        curl wget git \
        openssh-server \
        #less \
        net-tools \
        #mtr \
        #netkit-telnet \
        #texinfo \
        x11-tools \
        #byobu \
        #diffoscope \
        #dosfstools \
        fuse \
        ghostscript \
        #logrotate \
        lz4 \
        #rsyslog \
        #ceph \
        cronie \
        #polkit \
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
    # set xonsh as default
    && chsh -s $(which xonsh) \
    && rm -rf /tmp/*

CMD ["xonsh"]