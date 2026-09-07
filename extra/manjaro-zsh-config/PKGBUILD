# Maintainer: Chrysostomus <forum.manjaro.org>
# Contributor: pheiduck <forum.manjaro.org>
# Contributor: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=manjaro-zsh-config
pkgver=0.26
pkgrel=4
pkgdesc="Zsh configuration for manjaro"
arch=('any')
url="https://github.com/Chrysostomus/manjaro-zsh-config"
license=('MIT')
depends=('zsh-autosuggestions'
  'zsh-syntax-highlighting'
  'zsh-completions'
  'zsh-history-substring-search'
  'zsh'
  'ttf-meslo-nerd-font-powerlevel10k'
  'zsh-theme-powerlevel10k')
makedepends=('git')
conflicts=('grml-zsh-config')
backup=('root/.zshrc')
_commit=1f9d0da2c8408de895156cb65d324636d656df1c
source=("git+${url}.git#commit=${_commit}")
sha256sums=('6d814d5b216b380c4894214e19788d1057e4e6c684d5e897b2ff66366b4ab291')

prepare() {
  cd "$srcdir/$pkgname"

  # Trim down prompt when accepting a command line
  # for easier copying and pasting terminal output
  sed -i 's/POWERLEVEL9K_TRANSIENT_PROMPT=off/POWERLEVEL9K_TRANSIENT_PROMPT=always/g' \
    p10k.zsh p10k-portable.zsh
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 .zshrc -t "${pkgdir}/etc/skel/"
  install -D -m644 "$pkgname" -t "${pkgdir}/usr/share/zsh/"
  install -D -m644 manjaro-zsh-prompt -t "${pkgdir}/usr/share/zsh"
  install -D -m644 zsh-maia-prompt -t "${pkgdir}/usr/share/zsh/"
  install -D -m644 p10k.zsh -t "${pkgdir}/usr/share/zsh/"
  install -D -m644 p10k-portable.zsh -t "${pkgdir}/usr/share/zsh/"
  install -D -m640 .zshrc -t "${pkgdir}/root/"
  chmod 750 "${pkgdir}/root"
  install -d "${pkgdir}/usr/share/zsh/scripts"
  cp -r base16-shell "${pkgdir}/usr/share/zsh/scripts/"
  chmod a+x "${pkgdir}/usr/share/zsh/scripts/base16-shell/"*
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
