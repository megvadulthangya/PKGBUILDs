# Maintainer : Philip Müller <philm@manjaro.org>
# Maintainer : Bernhard Landauer <oberon@manjaro.org>

pkgname=manjaro-system
pkgver=20230401
pkgrel=1
pkgdesc="Manjaro Linux System - Update script"
arch=('any')
url="https://gitlab.manjaro.org/packages/core/manjaro-system"
license=('GPL')
depends=('initramfs' 'base')
install=manjaro-update-system.sh
source=('fsck.overlay'
        'networkmanager-connectivity.hook')
sha256sums=('306c6ca7407560340797866e077e053627ad409277d1b9da58106fce4cf717cb'
            'fc1fd9410f2b41726fac5b643c06f3324f3cd178a3533cc02ec656c3692ce90f')

pkgver() {
    date +%Y%m%d
}

package() {
   install -Dm755 "$srcdir/fsck.overlay" "$pkgdir/usr/bin/fsck.overlay"
   install -Dm644 "$srcdir/networkmanager-connectivity.hook" \
      "$pkgdir/usr/share/libalpm/hooks/networkmanager-connectivity.hook"
}
