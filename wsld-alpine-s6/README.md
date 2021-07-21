# wsld-alpine-s6 & wsld.exe

# wsld-alpine-s6

an alpine wsl image supporting for [Rucadi/wsld](https://github.com/Rucadi/wsld), which is smaller and faster than ubuntu wsl image.

| images | [alpine](https://gitlab.com/dennischancs/wsld-alpine)  | [ubuntu](https://gitlab.com/ruben.cano96/wsld_image)|
| ------ | ------ | ------ |
|HDD | 325MB | 1128MB |
|RAM | 113MB | 144MB |

PS: alpine wsl image `service docker start` use `. /entrypoint.sh` for some special prepare.

# wsld.exe
a new wsld.exe to replace [Rucadi's original executable](https://github.com/Rucadi/wsld)

USAGE:
1. [download](./wsld/wsld-x86_64.zip) 
2. `unzip wsld-x86_64.zip`
3. in PowerShell `.\wsld.exe -d test -i alpine:latest`
4. [original Docs](./wsld/README.md)