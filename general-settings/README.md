# general-settings

## wsl setting && DNS no 172.28.160.1

Usage: `COPY <src> /etc/`

> The `<src>` path must be inside the context of the build; you cannot `COPY ../something /something`, because the first step of a docker build is to send the context directory (and subdirectories) to the docker daemon.

```config
#/etc/wsl.conf
[network]
generateResolvConf = false
```

```config
#/etc/resolv.conf
nameserver 223.5.5.5
nameserver 223.6.6.6
```

[ReadOnly] `chmod 0444 /etc/resolv.conf`

【注意】
1. 在docker里，不能改resolv.conf，这是特殊的只读文件；
2. 在docker里，不能用chattr，这受docker的权限限制。
如果该docekr镜像使用成WSL，办法是：写在entrypoint.sh脚本里，并在shell的环境变量 `.bashrc`中添加 `. /entrypoint.sh`，每次进入wsl会自动执行一次。其它进程调用，则先执行`. /entrypoint.sh`。