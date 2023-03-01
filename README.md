# X-Plane cross-compile example with zig

This project is meant to showcase how to use the zig toolchain to cross-compile a plugin for X-Plane 12 on Linux/Ubuntu.

The script compiles plugins for
- Windows x86
- Linux x86
- Mac Universal - x86 + ARM 

This showcase is based on the [Menu SDK Sample](https://developer.x-plane.com/code-sample/x-plane-menu-sdk-sample/) from the X-Plane developer documentation. To support cross-compiling for Macs based on the M1/M2 processors (ARM64), the project is using the [X-Plane beta SDK](https://developer.x-plane.com/sdk/plugin-sdk-downloads/) supporting the new 4.0 API and ARM64 Macs.


## Install


### Install zig using snap
https://github.com/ziglang/zig/wiki/Install-Zig-from-a-Package-Manager

``` bash
sudo snap install zig --classic --beta
sudo apt install make
```

### Install cctools-port 
https://github.com/tpoechtrager/cctools-port

This project is being used to create the Universal (fat) binary for Mac Intel/ARM64. In order to compile the project, we need a `clang/clang++` compiler. Zig is LLVM based and provides this capability. For the `cctools-port` to compile/install we need the configure script to find the `clang/clang++` compiler. We are doing this by creating 2 scripts

``` bash
cat <<EOF > /usr/bin/clang
#!/bin/bash

zig cc "\$@"
EOF

cat <<EOF > /usr/bin/clang++
#!/bin/bash

zig c++ "\$@"
EOF

sudo chmod 755 /usr/bin/clang
sudo chmod 755 /usr/bin/clang++
```

``` bash
git clone https://github.com/tpoechtrager/cctools-port.git
cd cctools-port/cctools
./configure
make
sudo make install
```

## Usage

``` bash
make
```

You will find the resulting plugin in build/X-Plane-Menu-SDK-Sample. To install it, move the directory to your X-Plane installation into the `X-Plane 12/Resources/plugins` directory.

