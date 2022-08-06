# mirai-http

[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/ttionya/mirai-http?label=Version&logo=docker)](https://hub.docker.com/r/ttionya/mirai-http/tags) [![Docker Pulls](https://img.shields.io/docker/pulls/ttionya/mirai-http?label=Docker%20Pulls&logo=docker)](https://hub.docker.com/r/ttionya/mirai-http) [![GitHub](https://img.shields.io/github/license/ttionya/vaultwarden-backup?label=License&logo=github)](https://github.com/ttionya/mirai-http-docker/blob/master/LICENSE)

集成了 `mirai-api-http` 插件的 Mirai QQ 机器人 Docker 镜像。

<br>

## 使用方法

你需要先进入要存放 Mirai 配置的目录。

若使用 `docker-compose`，请下载 `docker-compose.yml` 文件到当前目录。

### 1. 生成配置文件并修改

```shell
docker run \
  --rm -it \
  --mount type=bind,source=$(pwd)/config,target=/mirai/config \
  -e LANG="C.UTF-8" \
  ttionya/mirai-http:latest

# 或使用 docker-compose
docker-compose up
```

出现 `mirai-console started successfully` 后 `Ctrl + C` 终止运行。

并根据实际情况修改 `config` 中的配置文件。

### 2. 验证

执行以下指令确认可以正常登录账号。

```shell
docker run \
  --rm -it \
  --mount type=bind,source=$(pwd)/bots,target=/mirai/bots \
  --mount type=bind,source=$(pwd)/config,target=/mirai/config \
  --mount type=bind,source=$(pwd)/data,target=/mirai/data \
  -e LANG="C.UTF-8" \
  ttionya/mirai-http:latest

# 或使用 docker-compose
docker-compose run --rm mirai-http
```

出现 `Bot login successful` 相关内容后代表账号登录成功，可以通过 `Ctrl + C` 终止运行。

### 3. 后台运行

```shell
docker run -d \
  --restart=always \
  --name mirai-http \
  --mount type=bind,source=$(pwd)/bots,target=/mirai/bots \
  --mount type=bind,source=$(pwd)/config,target=/mirai/config \
  --mount type=bind,source=$(pwd)/data,target=/mirai/data \
  -p 127.0.0.1:8080:8080 \
  -e LANG="C.UTF-8" \
  ttionya/mirai-http:latest

# 或使用 docker-compose
docker-compose up -d
```

<br>

## 插件

内置插件及版本信息详见 [Plugins](/plugins/README.md)。

<br>

## 关联项目

- [Mirai](https://github.com/mamoe/mirai)
- [iTXTech MCL Installer](https://github.com/iTXTech/mcl-installer)
- [Mirai Console Loader](https://github.com/iTXTech/mirai-console-loader)

<br>

## 许可证

MIT
