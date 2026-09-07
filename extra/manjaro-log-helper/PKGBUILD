# Maintainer: Stefano Capitani <stefano@manjaro.org>

pkgname=manjaro-log-helper
pkgver=1.0.2
pkgrel=1
pkgdesc="Gathers selected system logs and usr/libionally sends them to the internet."
arch=('any')
url="https://codeberg.org/Ste74/manjaro-log-helper"
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'gtk4'
  'libadwaita'
  'python-gobject'
  'xdg-utils'
)
makedepends=('git')
optdepends=(
  'wl-clipboard: Clipboard support on Wayland'
  'xclip: Clipboard support on Xorg'
)
source=("git+https://codeberg.org/Ste74/manjaro-log-helper.git#tag=$pkgver")
sha256sums=('612f1942cc798568e0a185f338ef974c41f00634c0e874b3319bf44ed14edce0')

package() {
  cd "$pkgname"
  install -Dm755 mlh -t "$pkgdir/usr/bin/"
  install -Dm755 main.py -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 mlh_{core,gui}.py -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 ui/* -t "$pkgdir/usr/lib/$pkgname/ui/"
  install -Dm644 mlh.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  cp -a usr/share/locale "$pkgdir/usr/share/"

  # Compile Python bytecode
  python -m compileall -d / "$pkgdir/usr/lib/$pkgname"
  python -O -m compileall -d / "$pkgdir/usr/lib/$pkgname"
}
