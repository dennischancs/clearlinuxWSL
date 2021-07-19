# Clear Linux for WSL2
[Docker Page](https://hub.docker.com/repository/docker/dennischancs/clr-wsl-base)

use [wsld.exe](https://github.com/Rucadi/wsld) to install:
`./wsld -d cleartest -i dennischancs/clr-wsl-base:latest`

## This Image is a base image for wsl with xonsh
Including bundles as follow:
```shell
swupd bundle-add python3-basic \
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
        polkit

pip install --no-cache-dir xonsh \
    && /usr/bin/python3 -m pip install --no-cache-dir \
        xontrib-argcomplete \
        xonsh-autoxsh \
        xonsh-docker-tabcomplete \
        xontrib-hist-navigator \
        xontrib-output-search \
        xontrib-pipeliner \
        xontrib-pyenv \
        xontrib-ssh-agent \
        xontrib-z
```


## others

1. 替换默认的shell
> 很重要的一点，要有`/etc/passwd`文件，参考Ubuntu WSL 以及 从iso安装clear linux时设置的用户名。【`/etc/passwd-`是备份文件】

2. clear linux 的[docker image](https://github.com/clearlinux/docker-brew-clearlinux/blob/919de92f3ea61be7b1d63e04c401f2bac86f6a78/Dockerfile)对密码有效期过短，因此要用`chage -M 99999 root`调整为不过期。