# Maintainer: Mark Wagie <mark at manjaro dot org>
# Contributor: Bernhard Landauer <bernhard@manjaro.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Somasis <somasis@cryptolab.net>

pkgname=mugshot
pkgver=0.4.3
pkgrel=10
pkgdesc="User Management Utility for Linux"
arch=('any')
url="https://bluesabre.org/projects/mugshot"
license=('GPL-3.0-only')
depends=(
  'accountsservice'
  'gtk3'
  'hicolor-icon-theme'
  'python'
  'python-cairo'
  'python-gobject'
  'python-pexpect'
  'which'
)
makedepends=(
  'git'
  'intltool'
  'python-build'
  'python-distutils-extra'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('appstream')
optdepends=(
  'cheese: webcam support'
  'pidgin: update buddy icon'
  'gnome-control-center: collection of stock face icons'
)
_commit=01cc800f467dd3661bf158fb26820d37042fb0a0
source=("git+https://github.com/bluesabre/mugshot.git#tag=$pkgname-$pkgver?signed"
        "git+https://github.com/oberon-manjaro/avatars.git#commit=${_commit}")
sha256sums=('18162cb0bbd5f852612e233cb53975a132635c03533f019a95e9017b473287a2'
            'c7d21a21a43a4d10301452f38daceff3ed14bd63747c34f2b0d1a3b0700f427c')
validpgpkeys=('21D00B5001E804E5DE6E4BF876E6FEEC95FC5E22') # Sean Davis <sean@bluesabre.org>

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  appstreamcli validate --no-net "data/metainfo/$pkgname.appdata.xml"
  desktop-file-validate build/share/applications/org.bluesabre.Mugshot.desktop
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove misplaced mugshot.appdata.xml.in
  rm -r "$pkgdir/usr/share/$pkgname/metainfo/"

  # install our stock avatars
  cd "$srcdir/avatars"
  install -d "$pkgdir/usr/share/pixmaps"
  cp -r faces "$pkgdir/usr/share/pixmaps/"
}
