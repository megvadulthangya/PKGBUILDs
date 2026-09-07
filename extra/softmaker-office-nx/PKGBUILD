# Maintainer: Mark Wagie <mark at manjaro dot org>
# Maintainer: Philip Müller <philm@manjaro.org>
# Contributor: Bernhard Landauer <bernhard@manjaro.org>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=softmaker-office-nx
pkgver=1502
pkgrel=1
pkgdesc="GDPR-compliant alternative to Microsoft Office (subscription only version)"
url="https://www.softmaker.com"
arch=('x86_64')
license=('custom')
depends=(
  'curl'
  'desktop-file-utils'
  'gst-plugins-base-libs'
  'gstreamer'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxext'
  'libxmu'
  'libxrandr'
  'libxrender'
  'shared-mime-info'
)
source=(
        "https://www.softmaker.net/down/${pkgname}-${pkgver}-amd64.tgz"
        'planmaker-nx.desktop'
        'presentations-nx.desktop'
        'textmaker-nx.desktop'
        'planmakernx'
        'presentationsnx'
        'textmakernx'
        "${pkgname}.xml")
sha256sums=('db80a7999e659f1efe36f6718808226f4b9809f510b94811b955be2ba01e0775'
            'a4732fb134f5965a57ca6532f80ba824933d9889ccbdd10cb20c86e1cb7ae568'
            '5fa8f5571212dd063949e0b354614f22026b6fe275720ffac3adbb43dfa23c35'
            'c331776cb781f91cc6d4a6cf0bed4d7ad8202e915a3eed52fd6a0281a2ae6da3'
            '96cb1b7cfa4a67f152560ebebb8447c593c9ca44d946b7f7eef0455e1e485314'
            'bfedb7dcfe023c4b85e79393c4770f03601e58e7b11aa715e10cd0dfa5b263b6'
            '06d0b6d43cd8bd852858e47ab710d2bc532b685c3bfa2a61993b4b2ef37efd6d'
            'f40cd36c173ab091296e87282105956b765f39d75979fffe3a22d225563f5025')

package() {
  install -dm755 "${pkgdir}/usr/share/officenx"
  bsdtar xf "${srcdir}/officenx.tar.lzma" -C "${pkgdir}/usr/share/officenx/"

  # fix ownership
  chown -R root:root "${pkgdir}"

  install -Dm755 planmakernx presentationsnx textmakernx -t "${pkgdir}/usr/bin/"

  for size in 16 32 48 64 128 256 512; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    ln -s "/usr/share/officenx/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/officenx-planmaker.png"
    ln -s "/usr/share/officenx/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/officenx-presentations.png"
    ln -s "/usr/share/officenx/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/officenx-textmaker.png"

    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    ln -s "/usr/share/officenx/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmdnx.png"
    ln -s "/usr/share/officenx/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prdnx.png"
    ln -s "/usr/share/officenx/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmdnx.png"
    ln -s "/usr/share/officenx/icons/pmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmdnx-oth.png"
    ln -s "/usr/share/officenx/icons/tmd_oth_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmdnx-oth.png"
    ln -s "/usr/share/officenx/icons/pmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmdnx-mso.png"
    ln -s "/usr/share/officenx/icons/prd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prdnx-mso.png"
    ln -s "/usr/share/officenx/icons/tmd_mso_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmdnx-mso.png"
  done

  install -Dm644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -dm755 "${pkgdir}/usr/share/mime-info"
  ln -s /usr/share/officenx/mime/${pkgname}.mime "${pkgdir}/usr/share/mime-info/${pkgname}.mime"

  install -Dm644 "${srcdir}/planmaker-nx.desktop" "${pkgdir}/usr/share/applications/planmaker-nx.desktop"
  install -Dm644 "${srcdir}/presentations-nx.desktop" "${pkgdir}/usr/share/applications/presentations-nx.desktop"
  install -Dm644 "${srcdir}/textmaker-nx.desktop" "${pkgdir}/usr/share/applications/textmaker-nx.desktop"

  install -Dm644 "${pkgdir}/usr/share/officenx/mime/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

  # Symlink affiliate link
  install -d "${pkgdir}/usr/share/doc/officenx"
  echo "office-nx-l-manjaro" > "${pkgdir}/usr/share/officenx/affiliate.txt"
  ln -s "/usr/share/officenx/affiliate.txt" "$pkgdir/usr/share/doc/officenx/"
}
