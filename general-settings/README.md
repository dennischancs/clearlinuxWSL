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



-----
`tar -zcf tmp.tar.gz run.sh resolv.conf wsl.conf`