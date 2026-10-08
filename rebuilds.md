## REBUILDS
# Note that packages only need to be rebuilt when there's an [soname](https://wikipedia.org/wiki/Soname) bump

binutils

- kernels


boost-libs

- calamares
- calamares-git
- dwarfs


fmt

- dwarfs


gnome-desktop

- gnome-control-center


gcc

- kernels


glibc

- kernels


gpgme

- pacman


icu

- boxit
- boxit-arm
- calamares
- calamares-git
- manjaro-settings-manager
- manjaro-settings-manager-qt6


hwinfo

- calamares
- calamares-git
- manjaro-settings-manager
- manjaro-settings-manager-qt6
- mhwd


libjxl

- pix


libpeas

- xviewer


libplasma

- plasma6-applets-supergfxctl


libraw

- pix


libtiff

- pix


libwacom

- gnome-control-center


libxml2

- blackbox-terminal
- cinnamon
- gnome-control-center
- kdoctools5


openssl

- pacman
- systemd
- zfs-utils
- firmware-manager
- kernels
- watchmate

pacman (libalpm.so)

- pacman
- pacman-contrib
- libpamac
- pamac-cli
- pamac
- alpm-octopi-utils
- octopi
- yay


perl

- needrestart


python (libpython3.so)

- backintime
- calamares
- calamares-git
- gdm-settings
- kernels
- thunarx-python

python (site-packages)

  ```
  sudo pacman -Fxq 'usr/lib/python3.XX/'
  ```

  Requires `manjaro-check-repos`:

  ```
  sudo mbn update
  sudo mbn update files --unstable
  mbn files 'usr/lib/python3.XX' --unstable | grep '::'
  ```


qt5-base

- manjaro-settings-manager


qt6-base

- calamares
- calamares-git
- manjaro-settings-manager-qt6
- octopi
- qt-sudo


qtermwidget

- octopi


ruby

- ruby-kwalify


rust

- kernels >=6.18


rust-bindgen

- kernels >=6.18


yaml-cpp

- calamares
- calamares-git
- coreboot-configurator
