# Maintainer: Stefano Capitani <stefano@manjaro.org>

pkgname=manjaro-rescue
pkgver=3.0.0
pkgrel=1
pkgdesc="Professional system restore utility for Manjaro Linux"
arch=('any')
url="https://codeberg.org/Ste74/manjaro-rescue"
license=('GPL-3.0-or-later')
depends=(
  'grub'
  'gtk4'
  'libadwaita'
  'manjaro-tools-base'
  'os-prober'
  'polkit'
  'python'
  'python-gobject'
)
makedepends=('git')
optdepends=(
  'bmenu: Bash scripts providing a collection of terminal applications in a simple UI'
  'manjaro-log-helper: Gathers selected system logs and optionally sends them to the internet'
  'timeshift: System restore utility for Linux'
)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('aa92e600b5305bbc9e47de38eff1eb41254dc953d6036e0218fce95d21ec6379')

prepare() {
  mkdir -p "${pkgname}-${pkgver}"
  bsdtar xf "${pkgname}-${pkgver}.tar.gz" --strip-components 1 -C "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

  cp -r backend utils locale "${pkgdir}/usr/lib/${pkgname}/"
  [ -d icons ] && cp -a icons "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 main.py "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 window.ui "${pkgdir}/usr/lib/${pkgname}/"

  ln -s "/usr/lib/${pkgname}/main.py" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/lib/${pkgname}/icons/hicolor/scalable/apps/${pkgname}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
