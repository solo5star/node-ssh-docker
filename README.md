## A node.js Docker server that can be accessed via SSH

**[node:lts](https://hub.docker.com/_/node)**에 SSH 연결 기능이 추가된 이미지입니다.

이 레포지토리를 클론한 후 `docker-compose up` 명령어만 입력하면 됩니다.

<br><br>

## 사용법

```sh
$ git clone https://github.com/solo5star/node-ssh-docker
$ cd node-ssh-docker
```
레포지토리를 클론합니다.

```yml
version: "3"
services:
  server:
    build: .
    ports:
      - 22:22
    volumes:
      - ./shared:/root
    environment:
      - PASSWORD=changeme
```
`docker-compose.yml` 파일을 열어 `PASSWORD` 환경변수를 수정합니다. 이 값은 상대방이 나의 서버로 접속할 때 사용하는 비밀번호입니다.

`./shared` 는 공유하려는 디렉토리입니다. 다른 디렉토리를 공유하고 싶다면 이 값을 변경해주세요. (예: `~/workspace/example-project`)

```sh
$ docker-compose up
```

> 만약 백그라운드로 실행하고 싶다면 `docker-compose up -d` 명령으로 입력해주세요.

접속하려는 상대방은 사용하는 IDE에 따라 아래 가이드를 참고하여 접속하면 됩니다.

* VSCode: https://code.visualstudio.com/docs/remote/ssh
* WebStorm: https://www.jetbrains.com/help/webstorm/remote-development-starting-page.html#start_from_IDE

<br><br>

## 환경 변수

* **PASSWORD**: `root` 계정의 패스워드를 설정합니다. 안전한 패스워드로 설정해주세요.
