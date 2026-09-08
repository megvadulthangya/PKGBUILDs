# Maintainer: Stefano Capitani <stefano@manjaro.org>
# Maintainer: Philip Müller <philm@manjaro.org>
# Maintainer: Mark Wagie <mark at manjaro dot org>
# Contributor: Roland Singer
# Contributor: Shrinivas Kumbhar (aka Librewish)

pkgname=(
  'manjaro-alsa'
  'manjaro-bluetooth'
  'manjaro-connman'
  'manjaro-gstreamer'
  'manjaro-input'
  'manjaro-modem'
  'manjaro-pipewire'
  'manjaro-pulse'
)
pkgbase=manjaro-meta
pkgver=20260127
pkgrel=1
arch=('any')
license=('GPL-3.0-or-later')
source=('realtime-privileges.sh'
        'realtime-privileges.hook')
sha256sums=('de4521b2e801bb5ba53bddfaa5e62a8ebd3c7ff8247a1269f9f3b0e9821e6a46'
            '964d6e10a3af9d6dbe1d87ac0ca0b775e98cfe4719010b6efec6e812318cfc5a')

pkgver() {
  date +%Y%m%d
}

package_manjaro-alsa() {
  pkgdesc="Manjaro meta package for complete ALSA support"
  url="https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture"
  depends=(
    'alsa-firmware'
    'alsa-lib'
    'alsa-oss'
    'alsa-plugins'
    'alsa-utils'
  )
  optdepends=(
    'alsa-tools: Advanced tools for certain sound cards'
    'pipewire-alsa: PipeWire support'
    'pulseaudio-alsa: PulseAudio support'
  )
}

package_manjaro-bluetooth() {
  pkgdesc="Manjaro meta package for complete Bluetooth support"
  url="https://wiki.archlinux.org/title/Bluetooth"
  depends=(
    'bluez'
    'bluez-cups'
    'bluez-hid2hci'
    'bluez-libs'
    'bluez-plugins'
    'bluez-tools'
    'bluez-utils'
  )
  optdepends=(
    'bluedevil: Qt Bluetooth frontend'
    'blueman: A Gtk+ Bluetooth manager'
    'pipewire-pulse: PipeWire support'
    'pulseaudio-bluetooth: PulseAudio support'
  )
}

package_manjaro-connman() {
  pkgdesc="Manjaro meta package for complete ConnMan support"
  url="https://wiki.archlinux.org/title/ConnMan"
  depends=(
    'avahi'
    'connman'
    'dnsmasq'
    'openconnect'
    'resolvconf'
    'openssh'
    'openvpn'
    'ntp'
    'pacrunner'
    'pptpclient'
    'rp-pppoe'
    'wpa_supplicant'
  )
  optdepends=(
    'cmst: A Qt GUI for connman'
    'gufw: Uncomplicated firewall GTK GUI'
    'manjaro-settings-samba: Preconfigured samba settings'
  )
}

package_manjaro-gstreamer() {
  pkgdesc="Manjaro meta package for complete Gstreamer support"
  url="https://wiki.archlinux.org/title/GStreamer"
  depends=(
    'ffmpeg'
    'gst-libav'
    'gst-plugins-bad'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-ugly'
  )
}

package_manjaro-input() {
  pkgdesc="Manjaro meta package for complete input support"
  url="https://wiki.archlinux.org/title/Xorg#Input_devices"
  depends=(
    'xf86-input-elographics'
    'xf86-input-evdev'
    'xf86-input-libinput'
    'xf86-input-void'
    'xf86-input-wacom'
  )
optdepends=('touche: Qt GUI for touchpad gestures')
}

package_manjaro-modem() {
  pkgdesc="Manjaro meta package for complete modem support"
  url="https://wiki.archlinux.org/title/Mobile_broadband_modem"
  depends=(
    'modemmanager'
    'usb_modeswitch'
  )
  optdepends=(
    'gpsd: GPS daemon and library to support USB/serial GPS devices'
    'modem-manager-gui: Frontend for ModemManager'
    'ppp: configure 3g connections'
  )
}

package_manjaro-pipewire() {
  pkgdesc="Manjaro meta package for complete PipeWire support."
  url="https://wiki.archlinux.org/title/PipeWire"
  depends=(
    'gst-plugin-pipewire'
    'pipewire'
    'pipewire-alsa'
    'pipewire-pulse'
  )
  optdepends=(
    'easyeffects: advanced equalizer and effects'
    'pipewire-jack: Jack support'
    'pipewire-v4l2: V4L2 interceptor'
    'pipewire-x11-bell: X11 bell'
    'pipewire-zeroconf: Zeroconf support'
    'realtime-privileges: Realtime privileges for users'
  )
  conflicts=(
    'manjaro-pulse'
    'pulseaudio-equalizer'
    'pulseaudio-jack'
    'pulseaudio-lirc'
    'pulseaudio-rtp'
    'pulseaudio-zeroconf'
  )

  install -Dm644 realtime-privileges.hook -t "$pkgdir"/usr/share/libalpm/hooks/
  install -Dm755 realtime-privileges.sh "$pkgdir"/usr/bin/realtime-privileges
}

package_manjaro-pulse() {
  pkgdesc="Manjaro meta package for complete PulseAudio support"
  url="https://wiki.archlinux.org/title/PulseAudio"
  depends=(
    'pulseaudio'
    'pulseaudio-alsa'
    'pulseaudio-bluetooth'
  )
  optdepends=(
    'paprefs: Configuration dialog'
    'pasystray: system tray application'
    'pavucontrol: A GTK volume control tool'
    'pavucontrol-qt: A Qt volume control tool'
    'pulseaudio-equalizer: Graphical equalizer'
    'pulseaudio-equalizer-ladspa: A 15-band equalizer'
    'pulseaudio-jack: Jack support'
    'pulseaudio-lirc: IR (lirc) support'
    'pulseaudio-rtp: RTP and RAOP support'
    'pulseaudio-zeroconf: Zeroconf support'
  )
  conflicts=(
    'manjaro-pipewire'
    'pipewire-jack'
    'pipewire-pulse'
    'pipewire-v4l2'
    'pipewire-x11-bell'
    'pipewire-zeroconf'
  )
}
