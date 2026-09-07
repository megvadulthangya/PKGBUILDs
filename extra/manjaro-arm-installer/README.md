# Manjaro ARM Installer

Scripts for installing Manjaro ARM directly to SD/eMMC cards or USB sticks without the need for images.

This script is "interactive". Meaning that it asks you questions when run to customize your install. Like username, password etc.


## Dependencies (Arch package names):
* bash
* wget
* git
* systemd
* dialog
* parted
* libarchive
* qemu-user-static-binfmt (only needed when script is run from other architectures than `aarch64`)
* openssl
* gawk
* dosfstools
* polkit
* btrfs-progs (for btrfs filesystem support)
* f2fs-tools (for f2fs filesystem support)
* cryptsetup (for encryption support)
* grub-efi-arm64 (only needed when script is run from other arcitectures than `aarch64`) (from AUR) (for `generic-efi` support)

## Installing and using from Manjaro (x64 and ARM) repositories:
To use this script, please make sure that the following is correct:

* An SD/eMMC card with at least 8 GB storage is plugged in, but not mounted. This Script **will** remove everything on it.
* That your user account has `sudo` rights.

Then install the `manjaro-arm-installer` package with:
```
sudo pacman -Syu manjaro-arm-installer
```
Then reboot or run `sudo systemctl restart systemd-binfmt`. You can now launch the installer with:
```
sudo bash manjaro-arm-installer
```


## Installing and using from gitlab:
To use this script, please make sure that the following is correct:

* An SD/eMMC card or USB stick with at least 8 GB storage is plugged in, but not mounted. This Script **will** remove everything on it.
* That your user account has `sudo` rights.
* That you have rebooted or restarted the binfmt service with `sudo systemctl restart systemd-binfmt` if you are running the script from any other architecture than `aarch64`.

Then use this to get it:
```
git clone https://gitlab.manjaro.org/manjaro-arm/applications/manjaro-arm-installer
cd manjaro-arm-installer
chmod +x manjaro-arm-installer
sudo bash ./manjaro-arm-installer
```

## Known Issues:
* Because `dialog` is weird, the script needs to be run in `bash`.

## Supported Devices:
* ClockworkPi DevTerm
* Generic
* Generic EFI
* Beelink GT1 Ultimate
* Odroid C4
* Odroid C2
* Odroid HC4
* Odroid M1 (new)
* Odroid N2
* Odroid N2
* Orange Pi 4 LTS (new)
* Pine64-LTS / Sopine
* Pine64+
* Pinebook
* Pine H64
* PinePhone
* PinePhone Pro (Experimental)
* Pinebook Pro
* PineTab
* Radxa Zero
* Raspberry Pi 4/400/3+/3
* Rock 3A (new)
* Rock64
* Rock Pi 4B
* Rock Pi 4C
* RockPro64
* LibreComputer Renegade
* NanoPC T4
* Quartz64 Model A
* Quartz64 Model B (new)
* Khadas Vim 1
* Khadas Vim 2
* Khadas Vim 3

## Supported Editions / Desktops:
* Minimal (no xorg, no apps)
* KDE/Plasma (full plasma desktop with apps)
* XFCE (full XFCE desktop with apps)
* i3 (tiling window manager with gtk apps)
* Sway (tiling wayland window manager with gtk apps)
* LXQT (full LXQT desktop with some qt apps)
* Mate (full mate desktop with apps)
* Server (minimal install with LAMP and Docker)
* Gnome (full Gnome desktop with apps)
* Budgie (full Budge desktop with apps) (EXPERIMENTAL)
* Phosh (A mobile interface for phones based on GTK/Gnome)
* Plasma Mobile (A mobile interface for phones based on QT/Plasma)

## Other notes:
This script is available in the **Manjaro** repository and can be installed with `sudo pacman -S manjaro-arm-installer`.

This script **should** be distro-agnostic, which means you can install *Manjaro ARM* from **any** distro, as long as the dependencies are met.
