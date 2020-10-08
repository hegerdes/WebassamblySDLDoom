# Doom in the Browser

Thanks to the power of [WebAssably](https://webassembly.org/) we are able to bring the power of compiled languges like C/C++ to the web.

## How does it work?
The wasm compiler creates binary instruction form out of source files that can be run in a stack-based virtual machine **inside** the any (*modern*) browser.

## Demo
![](https://imgur.com/TqDhoEC.png)
Find a demo version [here](https://web-doom.herokuapp.com/)

**Note** This is not perfect. It is a proof of concept and some first steps with wasm.

## How to compile it yourself
### Requirments:
 * NodeJS
 * Npm
 * Git
 * Cmake
 * make
 * Python3
The  `build.sh` script has does all the work.

It downloads the latest emscripten compiler, sets it up and runs the doom compile script.

Finaly it builds a static nodejs webserver and runs it.

## Licens
This is a clone of SDL_DOOM form [aserebryakov](https://github.com/aserebryakov/sdl_doom) with some wasm specific canges applied.

All rights belong to id Software
