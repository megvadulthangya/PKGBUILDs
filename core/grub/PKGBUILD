# Maintainer: Philip Müller <philm[at]manjaro[dot]org>
# Maintainer: Mark Wagie <mark at manjaro dot org>
# Contributor: Stefano Capitani <stefano[at]manjaro[dot]org>
# Contributor: Helmut Stult
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname=(
  'grub'
  'update-grub'
  'install-grub'
)
pkgbase=grub
pkgdesc='GNU GRand Unified Bootloader (2)'
epoch=2
_pkgver=2.14
_unifont_ver=17.0.05
pkgver=${_pkgver/-/}
pkgrel=1
url='https://gnu-grub.freedesktop.org/'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
makedepends=(
  autogen
  device-mapper
  freetype2
  fuse3
  gettext
  git
  help2man
  libusb
  python
  rsync
  sdl
  texinfo
  ttf-dejavu
  wget
  xz
)
depends=(
  device-mapper
  gettext
  sh
  xz
)

validpgpkeys=(
  'E53D497F3FA42AD8C9B4D1E835A93B74E82E4209'  # Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
  'BE5C23209ACDDACEB20DB0A28C8189F1988C2166'  # Daniel Kiper <dkiper@net-space.pl>
  '95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>
source=(
  "git+https://gitlab.freedesktop.org/gnu-grub/grub.git#tag=grub-${_pkgver}?signed"
  "git+https://git.savannah.gnu.org/git/gnulib.git"
  "https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig}
  "https://ftp.gnu.org/gnu/unifont/unifont-${_unifont_ver}/unifont-${_unifont_ver}.bdf.gz"{,.sig}
  '0001-00_header-add-GRUB_COLOR_-variables.patch'
  '0003-support-dropins-for-default-configuration.patch'
  'grub.default'
  'sbat.csv'
  'grub-export-path.patch'
  'grub-manjaro-modifications.patch'
  'grub-use-efivarfs.patch'
  'grub-dont-call-fwsetup-at-all.patch'
  'fgrep-is-obsolescent-using-grep-F.patch'
  '0001-grub-maybe-quiet.patch'
  '0002-grub-gettext-quiet.patch'
  '0003-grub-quick-boot.patch'
  'background.png'
  'update-grub'
  'install-grub'
  'install-grub.conf'
  'grub-set-bootflag'
  'update-grub.hook'
  'install-grub.hook'
)
b2sums=('45cfac7487264e323522e58b87dd1bf70c5c5c87feaf3f70e20e4c484de94be8369bd011ab53ba72959ec9bc9c9159b3327e4965c9ae5a795b20a29fef9eacd1'
        'SKIP'
        '724bb430d8824bec39e6a025cf354a780b79260684c7c4e3d28beb08c8bee10d082a089fcb799f8f5eb6e83abcf8675fb7c5f5ddf443c5c0e61d6f180ee341af'
        'SKIP'
        '3bf679a6fb0114891b5f7d8061b2fb0e6156e538c50d85e281d0814ee9421a2c235839ed36cf28c33daad12462edfc21892eb54844b9a35be2eaa8288d6756b0'
        'SKIP'
        '992c71790785304c28fbaf0dba21dab3e283b199509f0e7e1aa0df08126da75e15b6626c3638279ff2ecaa59b925096d7dbd67d6a53cebd0ce4326ff3719d25b'
        'a7820bfe9bddc34af49de63222b3d2a9788367083e29db13b33120269adbfa1619ac421d8597f662f756592889f5cc5538544a17d9936d1420bd5742282c710c'
        'd4e03cb92c3908421751962dca9ea2acac3ca081034f8de852caae99bb7ff3d6aa5305c18436228d4bbca4360652b31dae69af700a75d987ff4d46daf6c07d78'
        'b21e36cee8a8d1cb62f30e06bfccb29ca589ff4a8fbd8f07fbe3342f25ee6a141a5e92c36387752b9bbc76c2ff32d5f1dbf839af8e56ff706bfe752f2e9dd9f5'
        '71e77b75b4f88554aabfcd5da2fcd0e150dbc199ec1779e458ee935663a7080002069a4944cb22e01a9a0af3a6434fc312db7e03888fe23c2156d25f2ba96c0a'
        '8c5ba9696aeb182f23b6478a1d2e2c44f0359235e172783d132dc314314ca0f4760be06b7e073285dc6d38f7fb01e64920d23360a05006a581c3d99a9f99b3b6'
        'c316a8c52747a61d7b8a612b545491df9c4ba259bcfa8f923705298104eee4c4dcbdcb1d9b3473e355adab9538c4ebd4703cea63cabd6046f9887a54bd7853fb'
        'e1fdd23b992ac48a532f54e91cd77bdd636f938a9eba6bef7fd863a8cd3f5a9bc0d77122a86dc4253d3b1958ade1ea2756cbb79571794c8efdaa97c501cde3c7'
        'bd2c2a833370007e284a9799765502cf599f141207cab33548040f611c8bf16c3326ed7f7f39bb9ebdd7ededf732aae3d933bb03e7fefd5d85af08e5eead4c4b'
        '127a40b9f193b22ed97ba2e5d3d2218b6296028b08073f537f2cdd7c33f5338a2b397a646d8dd769d80f0b14fc08696ca3a47f38b0e381aa490de7328a84506e'
        '29a1ccc44d8f5e5bfc6db719eaecda245c3cae7874fca527a81e3aa72b88c9d01a25a9f175e7d48d297ac65c919f0a0a0afcb686bf9619e6f5db3ffb11915795'
        '71e13690f5fa1fbe18928677b47c99a09ae333a0616eb917766f075129f2d51ad31969cd9ec1cd6bb664ab0ffae332d2400079453d9fd1ac69586abd15892e37'
        'b9530aeea084a0bbe0feedcdb9363b9933fab30f90337a79a9e2a535a2a084cbbf6458483a52b749a032858f8dd7b185e88f8fa659081886ef706eea456fc22d'
        '8b93a9564443d1509235c712e82a9aeb1d824df445eccd94f8c5f4d9050e3b1d89edefbc060b79d7ec029a2f53b19d8f31d3a82c7b8f13e8ca109751557b8b03'
        '97aa639b7c58ed0386c20300998ae5e77981eb92f351c9b248fe9d9f18dc2b2c5cb04ad63fbf562230a009e7b76325a09f5447a2103edfe9b0740b9391504c14'
        'f24e8c7d7a424cbad8e6576ec7e65b9551f7c6b4957f7a25160193afa2681e4bdd1c4651aa8a3b29937927d95daa12f38c85e0bd7491a77dc2a6673ab2838224'
        '910ad34fcbc09bd89730bd763839d60dfc2724baf5ab91c5aa8fa9bfe8e67fc90acc863e4b21d77edb2431da801d2c3ddbb0c373717ab090c3008f4b91a6a97a'
        '842ec1c51a40f6adee2a578ff2ed083975e4f31435ce1f75191edb0731200f36d2689f0158d5da21af05293c7c62e4efc37bf1d7e6dc7211c572e746feeef7cd'
        '7d66232583d30bbade009b56ee733e51ae38ae6eec870b30494e540009b0391a26217a2c1e6980d43b2d3188e1e5e2815601dc0d3ee3b1d2ae9829820efbec28')


_backports=(
  # osdep/linux/ofpath: Update strstr() calls
  '675d8581037dc8996cf6db21a61d26e28f7d44c1'
  # osdep/linux/ofpath: Correct path_size calculation
  'b71ae6db282fa25ca4ea6f8169161a2131ee6b9a'
  # util/probe: Save strrchr() ret val to const data ptr
  '9f4a586f1227a8287e1d6acd95893f6098756ee2'
  # util/resolve: Save str[r]chr() ret val to const data ptr
  'ce6f2b57f5450a8239022dcbfb2d750f273b83cb'
  # include/grub/i386/pc/int.h: Move GRUB_MACHINE_PCBIOS ifdef
  '9922ed133c2c754ec9f37198da2b3e3e8a4fd5ff'
)

_reverts=(
  # configure: Check linker for --image-base support
  '1a5417f39a0ccefcdd5440f2a67f84d2d2e26960'
  # configure: Print a more helpful error if autoconf-archive is not installed
  'ac042f3f58d33ce9cd5ff61750f06da1a1d7b0eb'
)

prepare() {
  cd "${srcdir}/grub/"

  echo "Apply backports..."
  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git --no-pager log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done

  echo "Apply reverts..."
  local _c _l
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git --no-pager log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  echo "Patch to enable GRUB_COLOR_* variables in grub-mkconfig..."
  ## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
  patch -Np1 -i "${srcdir}/0001-00_header-add-GRUB_COLOR_-variables.patch"

  echo "Patch to support dropins for default configuration..."
  patch -Np1 -i "${srcdir}/0003-support-dropins-for-default-configuration.patch"

  echo "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme..."
  sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

  echo "Fix mkinitcpio 'rw' FS#36275..."
  sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

  echo "Fix OS naming FS#33393..."
  sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

  # https://github.com/calamares/calamares/issues/918
  echo "Use efivarfs modules"
  patch -Np1 -i "${srcdir}/grub-use-efivarfs.patch"

  echo 'Export $PATH'
  patch -Np1 -i "${srcdir}/grub-export-path.patch"

  # https://bugs.archlinux.org/task/75701
  # https://lists.gnu.org/archive/html/grub-devel/2022-08/msg00374.html
  echo "Don't call fwsetup at all"
  patch -Np1 -i "${srcdir}/grub-dont-call-fwsetup-at-all.patch"

  echo "Include Manjaro Linux Modifications"
  patch -Np1 -i "${srcdir}/grub-manjaro-modifications.patch"

  #echo "fgrep is obsolescent using grep -F"
  #patch -Np1 -i "${srcdir}/fgrep-is-obsolescent-using-grep-F.patch"

  echo "Add Ubuntu patches"
  echo "Grub should be maybe quiet"
  patch -Np1 -i "${srcdir}/0001-grub-maybe-quiet.patch"
  echo "Quiet gettext"
  patch -Np1 -i "${srcdir}/0002-grub-gettext-quiet.patch"
  echo "Add Quick boot"
  patch -Np1 -i "${srcdir}/0003-grub-quick-boot.patch"


  echo "Pull in latest language files..."
  ./linguas.sh

  echo "Avoid problem with unifont during compile of grub..."
  # http://savannah.gnu.org/bugs/?40330 and https://bugs.archlinux.org/task/37847
  gzip -cd "${srcdir}/unifont-${_unifont_ver}.bdf.gz" > "unifont.bdf"

  echo "Run bootstrap..."
  ./bootstrap \
    --gnulib-srcdir="${srcdir}/gnulib" \
    --skip-po

  echo "Make translations reproducible..."
  sed -i '1i /^PO-Revision-Date:/ d' po/*.sed
}

_configure_options=(
  --prefix="/usr"
  --bindir="/usr/bin"
  --sbindir="/usr/bin"
  --mandir="/usr/share/man"
  --infodir="/usr/share/info"
  --datarootdir="/usr/share"
  --sysconfdir="/etc"
  --program-prefix=""
  --with-bootdir="boot"
  --with-grubdir="grub"
  --enable-boot-time
  --enable-cache-stats
  --enable-quiet-boot
  --enable-quick-boot
)

_platform=(
  i386-pc
  i386-efi
  x86_64-efi
)

build() {
  for i in ${_platform[@]}; do
    echo "Unset CFLAGS for build..."
    unset CFLAGS
    cp -r "${srcdir}/grub" "${srcdir}/grub-${i}"
    cd "${srcdir}/grub-${i}"
    echo "Run ./configure for ${i} build..."
    [[ "${i}" == "i386-pc" ]] && _configure_options+=(--enable-efiemu --with-platform="pc" --target="i386")
    [[ "${i}" == "i386-efi" ]] && _configure_options+=(--disable-efiemu --with-platform="efi" --target="i386")
    [[ "${i}" == "x86_64-efi" ]] && _configure_options+=(--with-platform="efi" --target="x86_64")
    ./configure PACKAGE_VERSION="${epoch}:${pkgver}-${pkgrel}" \
                ${_configure_options[@]}
    if [[ "${i}" == "x86_64-efi" ]]; then
      echo "Build language and doc files only for most common variant..."
      # language directory does not like -j option, build it first with -j1
      make -j1 po/
    else
      sed -i -e 's#po docs##' Makefile
    fi
    echo "Run make for ${i} build..."
    make
    if [ ! -z "${SOURCE_DATE_EPOCH}" ]; then
      echo "Make info pages reproducible..."
      touch -d "@${SOURCE_DATE_EPOCH}" $(find -name '*.texi')
    fi
  done

  # Generate grub mo files from dist tarball
  cd "${srcdir}/${pkgname}-${pkgver}/po"
  for po in *.po; do
    msgfmt "${po}" -o "${po%.po}.mo"
  done
}

package_grub() {
  optdepends=(
    'dosfstools: For grub-mkrescue FAT FS and EFI support'
    'efibootmgr: For grub-install EFI support'
    'freetype2: For grub-mkfont usage'
    'fuse3: For grub-mount usage'
    'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
    'libusb: For grub-emu USB support'
    'lzop: For grub-mkrescue LZO support'
    'mtools: For grub-mkrescue FAT FS support'
    'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
    'sdl: For grub-emu SDL support'
    'update-grub: Script to update Grub Menu on Linux Kernel updates'
    'install-grub: Script to install Grub after package updates'
  )
  backup=(
    etc/default/grub
    etc/grub.d/40_custom
  )
  install="${pkgname}.install"
  conflicts=(
    grub-bios
    grub-common
    grub-efi-${CARCH}
    grub-emu
    grub-legacy
  )
  replaces=(
    grub-common
    grub-bios
    grub-emu
    grub-efi-${CARCH}
  )
  provides=(
    grub-bios
    grub-common
    grub-efi-${CARCH}
    grub-emu
  )

  for i in ${_platform[@]}; do
    cd "${srcdir}/grub-${i}"
    echo "Run make install for ${i} build..."
    make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
    echo "Remove gdb debugging related files for ${i}..."
    rm -f "${pkgdir}/usr/lib/grub/${i}"/*.module
    rm -f "${pkgdir}/usr/lib/grub/${i}"/*.image
    rm -f "${pkgdir}/usr/lib/grub/${i}"/{kernel.exec,gdb_grub,gmodule.pl}
  done
  echo "Install /etc/default/grub (used by grub-mkconfig)..."
  install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
  sed -e "s/%PKGVER%/${epoch}:${pkgver}-${pkgrel}/" < "${srcdir}/sbat.csv" > "${pkgdir}/usr/share/grub/sbat.csv"

  # Install grub mo files from dist tarball
  cd "${srcdir}/${pkgname}-${pkgver}/po"
  for mo in *.mo; do
    install -D -m0644 "${mo}" "${pkgdir}/usr/share/locale/${mo%.mo}/LC_MESSAGES/${pkgname}.mo"
  done

  echo "Install grub background"
  install -Dm644 "${srcdir}/background.png" "${pkgdir}/usr/share/grub/background.png"

  # workaround for quiet fsck
  install -D -m755 "${srcdir}/grub-set-bootflag" "${pkgdir}/usr/bin/grub-set-bootflag"
}

package_update-grub() {
  pkgdesc="GNU Grub (2) Update Menu Script"
  depends=(grub)
  conflicts=('grub-update')
  replaces=('grub-update')

  echo "Install update-grub"
  install -Dm755 "${srcdir}/update-grub" "${pkgdir}/usr/bin/update-grub"
  echo "Install 99-update-grub.hook"
  install -D -m644 "${srcdir}/update-grub.hook" "${pkgdir}/usr/share/libalpm/hooks/99-update-grub.hook"
}

package_install-grub() {
  pkgdesc="GNU Grub (2) Install Script on Updates"
  depends=(coreutils efibootmgr gawk grep grub)
  backup=('etc/install-grub.conf')

  echo "Install install-grub"
  install -Dm755 "${srcdir}/install-grub" "${pkgdir}/usr/bin/install-grub"
  echo "Install install-grub.conf"
  install -Dm644 "${srcdir}/install-grub.conf" "${pkgdir}/etc/install-grub.conf"
  echo "Install 98-install-grub.hook"
  install -Dm644 "${srcdir}/install-grub.hook" "${pkgdir}/usr/share/libalpm/hooks/98-install-grub.hook"
}
