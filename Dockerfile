FROM --platform=$BUILDPLATFORM debian:bookworm AS build

WORKDIR /build
RUN apt-get update && apt-get install -y git g++ gcc make tar libsdl2-dev \
    xz-utils automake cmake python3 wget curl bzip2

RUN git clone https://github.com/emscripten-core/emsdk.git \
    && cd emsdk \
    && ./emsdk install latest \
    && ./emsdk activate latest

COPY . /build/

ENV CFLAGS="-sUSE_SDL -O2"
RUN bash -c "source emsdk/emsdk_env.sh \
    && emcc -v \
    && cd doom_src \
    && emconfigure ./configure \
    && autoreconf --install --force \
    && automake --add-missing \
    && emmake make -j4 VERBOSE=1 \
    && emcc -g -Os -o ../public/index.html am_map.o d_items.o d_main.o d_net.o doomdef.o doomstat.o dstrings.o f_finale.o f_wipe.o g_game.o hu_lib.o hu_stuff.o i_main.o i_net.o i_sound.o i_system.o i_video.o info.o m_argv.o m_bbox.o m_cheat.o m_fixed.o m_menu.o m_misc.o m_random.o m_swap.o p_ceilng.o p_doors.o p_enemy.o p_floor.o p_inter.o p_lights.o p_map.o p_maputl.o p_mobj.o p_plats.o p_pspr.o p_saveg.o p_setup.o p_sight.o p_spec.o p_switch.o p_telept.o p_tick.o p_user.o r_bsp.o r_data.o r_draw.o r_main.o r_plane.o r_segs.o r_sky.o r_things.o s_sound.o sounds.o st_lib.o st_stuff.o tables.o v_video.o w_wad.o wi_stuff.o z_zone.o -lm --preload-file doom1.wad -s ALLOW_MEMORY_GROWTH=1"

RUN sed -i 's/copyOnLock:true/copyOnLock: false/' public/index.js


FROM cgr.dev/chainguard/nginx AS live
# COPY public/* /usr/share/nginx/html
COPY --from=build /build/public/* /usr/share/nginx/html

