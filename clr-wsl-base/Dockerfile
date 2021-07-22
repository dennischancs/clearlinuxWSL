# Clear Linux的WSL2版，包含一些个性化功能

FROM clearlinux:latest

ARG swupd_args

COPY container-files /
RUN chmod u+x,g+x /usr/bin/xpip \
    && chmod u+x,g+x /usr/bin/wsldns.sh \
    && ln -s /usr/bin/wsldnes.sh /  \
    # prepare: set xonsh as default, ubuntu没这么麻烦的问题
    && chage -M 99999 root \
    && chage -m 0 root \
    && chage -W 7 root \
    && chmod 644 /etc/passwd \
    && cp /etc/passwd /etc/passwd- \
    # let `chsh` work for `root` after build
    && sed s/required/sufficient/g -i /usr/share/pam.d/chsh


# 补充bundles
# 参考: clear-34820-azure-hyperv.vhd, ubuntu wsl版默认的包
RUN swupd update --no-boot-update $swupd_args \
    && swupd bundle-add os-core-update \
        aspell \
        # base bundles
        sysadmin-basic \
        sysadmin-remote \
        editors \
        clr-network-troubleshooter \
        network-basic \
        net-tools \
        wpa_supplicant \
        ethtool \
        systemd-networkd-autostart \
        netkit-telnet \
        storage-utils \
        bootloader \
        openvswitch \
        wget git \
        rsync file \
        sshfs \
        openldap \
        dpdk \
        znc \
        lib-samba \
        # extra bundles
        x11-tools \
        less \
        fuse \
        diffoscope \
        cronie \
        mtr \
        byobu \
    && rm -rf /var/lib/swupd/* \
    && rm -rf /tmp/*

# add xonsh
RUN pip install --no-cache-dir --disable-pip-version-check xonsh[full] \
    && ln -s $(which xonsh) /usr/bin/xonsh \
    && /usr/bin/python3 -m pip install --no-cache-dir --disable-pip-version-check \
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
    # && chsh -s $(which xonsh) \
    && rm -rf /tmp/*

CMD ["/usr/bin/xonsh"]