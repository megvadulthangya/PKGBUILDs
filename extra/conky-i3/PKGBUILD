# Maintainer:
# Contributor: Bernhard Landauer <bernhard@manjaro.org>

pkgname=conky-i3
pkgver=20210907
pkgrel=1
pkgdesc="Conkies for manjaro-i3 in grey, green, solarized or 'maia' colors"
arch=('any')
url="https://github.com/oberon-manjaro/conkies"
license=('GPL-3.0-or-later')
groups=('i3-manjaro')
depends=(
  'conky'
  'ttf-bitstream-vera'
)
makedepends=('git')
conflicts=('lua-clock-i3')
backup=(
  'usr/share/conky/conky_green'
  'usr/share/conky/conky_grey'
  'usr/share/conky/conky_maia'
  'usr/share/conky/conky_solarized'
  'usr/share/conky/conky1.10_shortcuts_green'
  'usr/share/conky/conky1.10_shortcuts_grey'
  'usr/share/conky/conky1.10_shortcuts_maia'
  'usr/share/conky/conky1.10_shortcuts_solarized'
)
_commit=b830a801f1ec8622f5bbf15601f9aa0f6d06743d
source=("git+https://github.com/oberon-manjaro/conkies.git#commit=${_commit}")
sha256sums=('9993a9b39341f06d246c243a918825a7b19d4c7d6492bbb3236e22d99ac95b0f')

pkgver() {
  cd conkies
  printf "$(git show -s --format=%cd --date=format:%Y%m%d HEAD)"
}

package() {
  cd conkies
  install -Dm755 start-scripts-i3/* -t "$pkgdir/usr/bin/"
  install -Dm644 config_i3/* -t "$pkgdir/usr/share/conky/"
}
