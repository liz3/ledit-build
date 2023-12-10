FROM ubuntu:focal
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y fontconfig libfontconfig1-dev fontconfig-config libz-dev llvm pkg-config clang build-essential git ca-certificates cmake git libwayland-dev libxkbcommon-dev wayland-protocols libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev libxext-dev --no-install-recommends
WORKDIR /usr/app
COPY run.sh ./run.sh
RUN chmod +x ./run.sh
ENTRYPOINT ["./run.sh"]