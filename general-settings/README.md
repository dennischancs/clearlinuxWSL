# general-settings

## wsl setting && DNS no 172.28.160.1

Usage: `COPY ../general-settings /etc/`

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

[Important] `chattr +i /etc/resolv.conf`
