# FROM debian:buster as build


# WORKDIR /build
# RUN apt-get update && apt-get install -y git g++ gcc make tar libsdl2-dev \
#     xz-utils automake cmake python3 wget curl bzip2

# RUN git clone https://github.com/emscripten-core/emsdk.git \
#     && cd emsdk \
#     && ./emsdk install latest \
#     && ./emsdk activate latest

# COPY . /build/
# # RUN bash -c "source emsdk/emsdk_env.sh \
# #     && emcc -v \
# #     && cd doom_src \
# #     && emconfigure ./configure \
# #     && automake --add-missing \
# #     && emmake make -j4 VERBOSE=1"

FROM nginx:1.23 as live
COPY public/* /usr/share/nginx/html

