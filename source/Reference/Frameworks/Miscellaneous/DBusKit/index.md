# DBusKit

DBusKit is a framework that allows you to use the [D-Bus inter-process communication system](https://www.freedesktop.org/wiki/Software/dbus/), which is standard on Unix-like operating systems excluding Mac OS X.

**<a href="../../../../RawHTML/DBusKit/Reference/index.html">👉 Browse the API reference</a>**  
**<a href="../../../../RawHTML/DBusKit/ProgrammingManual/DBusKit/Introduction.html">📖 Read the Manual</a>**

## Install
Download [version 2.0](https://github.com/gnustep/libs-dbuskit/commit/5d69a35357f6e32fc2e1194194e176bf48588120)
```bash
git clone https://github.com/gnustep/libs-dbuskit/
cd libs-dbuskit
    git checkout 5d69a35357f6e32fc2e1194194e176bf48588120
cd ..
```
Dependencies -- you **must** replace the `libclang` version with the version of Clang you installed:
```bash
sudo apt install libdbus-1-dev libdbus-1-3 libclang1-11 libclang-11-dev
```
Fix `config.guess` and `config.sub`:
```bash
curl -o config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD"
curl -o config.sub "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD"
```
<!-- In `DKEndpointManager.m`, replace all occurences of `%"PRIuPTR"` with `%lo`.
Lines 144~146:
```objc
  NSDebugMLog(@"Inserting into ringbuffer (remaining capacity: %lo).",\
    (unsigned long)DKRingSpace);\
} while (0)
``` -->
```bash
export CPATH=$CPATH:/usr/lib/llvm-11/include/clang:/usr/include/dbus-1.0/dbus/:/usr/lib/arm-linux-gnueabihf/dbus-1.0/include:/usr/GNUstep/Local/Library/Headers
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/arm-linux-gnueabihf:/usr/lib/llvm-11/lib/
# Use clang
export CC=clang
export CXX=clang++
export RUNTIME_VERSION=gnustep-2.1
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export LD=/usr/bin/ld.gold
export LDFLAGS="-fuse-ld=gold -L/usr/local/lib"
```
```bash
./configure
make nonstrict=yes
sudo -E make install
cd Bundles
    cd DBusMenu
        make
        sudo -E make install
    cd ../DKUserNotification
        make
        sudo -E make install
cd ../..

cd Examples/GlobalMenu
        make
        sudo -E make install
cd ../..
```