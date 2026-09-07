# Maintainer:
# Contributor: Bernhard Landauer <bernhard@manjaro.org

pkgbase=linux612-rt
pkgname=("$pkgbase" "$pkgbase-headers")
_basekernel=6.12
_sub=100
_rtpatchver=rt20
_basever=${pkgbase//linux}
_kernelname=-MANJARO
if [[ "$_sub" == "0" ]]; then
    _pkgver=${_basekernel}
else
    _pkgver=${_basekernel}.${_sub}
fi
pkgver=6.12.100_rt20
pkgrel=1
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=(bc docbook-xsl libelf pahole python-sphinx git inetutils kmod xmlto cpio perl tar xz)
options=('!strip')
source=("https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_basekernel}.tar.xz"
        # rt-config
        'config.rt'
        # Upstream Patches
        # ARCH Patches
        0101-ZEN_Add_sysctl_and_CONFIG_to_disallow_unprivileged_CLONE_NEWUSER.patch
        0102-drivers-firmware-skip-simpledrm-if-nvidia-drm.modese.patch
        # Realtek patch
        0999-patch_realtek.patch
        # ROG ALLY Patches (wip/ally-6.12)
        0001-drm-amd-display-Avoid-divide-by-zero-by-initializing.patch
        0002-Tmp-add-GA605W-H7606W-to-AMD-PMF-quirks.patch
        revert-upstream-hid-asus-check-ROG-Ally-MCU-version-and-warn.patch
        0004-hid-asus-check-ROG-Ally-MCU-version-and-warn.patch
        0005-platform-x86-asus-wmi-Refactor-Ally-suspend-resume.patch
        0006-hid-asus-set-mcu-hack-to-off-if-required-MCU-version.patch
        0007-hid-asus-ally-Add-joystick-LED-ring-support.patch
        0008-hid-asus-ally-initial-Ally-X-gamepad.patch
        0009-hid-asus-ally-initial-gamepad-configuration.patch
        0010-hid-asus-ally-add-button-remap-attributes.patch
        0011-hid-asus-ally-add-gamepad-mode-selection.patch
        0012-hid-asus-ally-Turbo-settings-for-buttons.patch
        0013-hid-asus-ally-add-vibration-intensity-settings.patch
        0014-hid-asus-ally-add-JS-deadzones.patch
        0015-hid-asus-ally-add-trigger-deadzones.patch
        0016-hid-asus-ally-add-anti-deadzones.patch
        0017-hid-asus-ally-add-JS-response-curves.patch
        0018-hid-asus-ally-mcu_version-attribute.patch
        0019-hid-asus-ally-add-calibrations-wip.patch
        0020-hid-asus-ally-set-default-backface-btns-to-F14-15.patch
        0021-debug-by-default.patch
        0022-platform-x86-asus-wmi-export-symbols-used-for-read-w.patch
        0023-platform-x86-asus-armoury-move-existing-tunings-to-a.patch
        0024-platform-x86-asus-armoury-add-panel_hd_mode-attribut.patch
        0025-platform-x86-asus-armoury-add-apu-mem-control-suppor.patch
        0026-platform-x86-asus-armoury-add-core-count-control.patch
        0027-platform-x86-asus-wmi-deprecate-bios-features.patch
        0028-platform-x86-asus-armoury-add-the-ppt_-and-nv_-tunin.patch
        0029-backport-asus-armoury-fix-fw_attributes_class-after-.patch
        0030-backport-asus-wmi-fix-symbol-ASUS_WMI-after-cherry-p.patch
        0031-hda-tas2781-add-speaker-id-check-for-ASUS-projects.patch::https://lore.kernel.org/lkml/20241123073718.475-1-baojun.xu@ti.com/raw
        # OrangePi Neo patches
        0001-iio_imu_Add_driver_for_Bosch_BMI260_IMU.patch
        # RT Patch
        "https://cdn.kernel.org/pub/linux/kernel/projects/rt/${_basekernel}/patch-${_pkgver}-${_rtpatchver}.patch.xz")

_srcdir="linux-${_basekernel}"

sha256sums=('b1a2562be56e42afb3f8489d4c2a7ac472ac23098f1ef1c1e40da601f54625eb'
            'ab0ec185ce900e4a5ed2b0470e759dfd27270606f493b8a6993c2739878345c9'
            '888a89ec67433ddfd71ba187a7356ca60270dbe51d6df7211e3930f13121ba8c'
            '934bc233684c45860251bb75433d671b23fa784c891ab3a1ef10d5bc761156b6'
            'b88d42565ce771cb6c8f98b7c05aada6b8024578a1985e5772dc5a2d07facee0'
            'c5288dd3057ced81018db254c94fd7ee8dfc5d4687064b5ae234d56f04ad1069'
            'a4ec35907f4d532b45599821a74e7703e21a4df1677a3c057c433d13b31816a4'
            '8a4765598fd6090a5cbfddb40470362d99968463a47e605f9ee4e45be06d25c0'
            'a1c2e372d771b1bd42cb5f1e51718ea2c8af4fa911f4fd640d8d10cbf1e59cb0'
            '76eb9ac8f1a9928fa1f2222171633801898a5f89a139241443ec3c7df46b8531'
            '7893450bfae2bba7a1d20d29ad1791cadde32197297acb84bbbed1d952d24052'
            '5a5a0f80e76b693f0e06d1644bb81b0f3720fca7e14435fc06ecfaa187380602'
            '3fac0fb57c769bfef57d71d78d1b5f681947c2146ef30d7a9afdc87805eda058'
            '20e07201d951773ff60b9b4f201bf21386ea3102a80e4a158bbaeb7bc1ae1b45'
            '5b515dc4e43f5e3638a9f09318361c2f26964612df511d54a41149147926c40d'
            'b7118bb15b6c8f591d726dab469a2b7e48693d61c534e950eeb8dd5e4f45900f'
            'da11bacca3788f18f1267eef5453018f8c3b358c9e5b43e6242b5529e09237fc'
            'b3a36f8e02c78c953b738c4d2ecb59c8a84dfce5a354ee8f1d8d30c07e3e904d'
            'a706c396738153983140dae0d7322170920557dcb7852cbbb6392f8dfe4d72b9'
            '77413e58e83c14d01035d14aa4483df5da7ab3c8051eb8dda8df1ee9f1e18192'
            'a9c52bd8c76dbb4d65591534e34666bf95db698ad614672d3981c3667fdea8f9'
            'd7f139f1957b83f9954cb9f5a801f07ab0db3cb9f6a20206e1b7c988e1d3339b'
            '9e818853ede7775c809cff9de640b722d915f628817e6c9538fa5e6c8a4ea016'
            '9924ceda71fc126118d51cd8e23b46cc7e374b99bf08ffa035a46f878b3b5ac3'
            '99b1c4b1eac5d7cf6dd4fcc27488a14a7b4e79891f3285002dd3eb02d64f493b'
            '8aef981bda2f6406b48f428a2ad105d69d3c7114fe727f7f1ab81a44b8a1f9fc'
            'fef19b5e6adeac38e1a09c9323420da1a134cb4bb10c38610f0779c3cd4bef20'
            'bd81d17e0762553fbfeb27d8ef98f34e6897d26fc113940d0002fda481fb5de0'
            'e63ed6514de8d83fd16bafe9f7037aed8da25c8763b5153083290870410dd7c5'
            '6ecd696e2ea3ef53789e24370c2b155bc51a9c17854a7c273cec5c1cc4b3bc51'
            '78954076a9e6ce21be2bcb0dea717a9b2992c4cf55a4c95922000358be3ec5c9'
            '7ac1742354ca76bf89a2ef2b61136fb41c72ed4303047843d60b66d4d7383822'
            '26ab54dcfd68069008b5b19983f20ba954a5e311e6420f2783dec5a912493996'
            '9baa3f0cad34916f0599efeaa67170ee470f0ca1453666aa2e37bc62a843f277'
            '69be0b12d0df47866b65d969f1354acda58fb09d576763431ec3b1bc120c7cf1'
            '353af1b0411c4400277cf49270d1183e1678d46e5a77ea043be948fa1cbb9db2'
            'e58b6631da6dcc302984c30882276026a449228833cfb01d157a85ff1064080e'
            '5fce0e42b06e0188b6f5ae32247f9d166f2ea3d6f94c11773a57147dad7cb961'
            'ea63094cd9dd98e7b6479633b01e6863f4dfbdb2a18afbd4dc87c1048c86a93d')
if [[ ! "$_sub" == "0" ]]; then
  source+=("$url/pub/linux/kernel/v6.x/patch-${_pkgver}.xz")
fi
validpgpkeys=('64254695FFF0AA4466CC19E67B96E8162A8CF5D1' # Sebastian Andrzej Siewior
            '4FE5E3262872E4CC')
pkgver() {
  echo "${_pkgver}_${_rtpatchver}"
}

prepare() {
  cd "$_srcdir"

if [[ ! "$_sub" == "0" ]]; then
  # add upstream patch
  patch -p1 -i "../patch-${_pkgver}"
fi

  # Add RT patch
  msg "realtime patch..."
  patch -p1 -i "../patch-${_pkgver}-${_rtpatchver}.patch"

  local src
  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      msg2 "Applying patch: $src..."
      patch -Np1 < "../$src"
  done

  msg2 "add config"
  cat "../config.rt" > ./.config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  msg "set extraversion to pkgrel"
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  msg "don't run depmod on 'make install'"
  # We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  msg "get kernel version"
  make prepare

  msg "rewrite configuration"
  yes "" | make config >/dev/null
}

build() {
  cd "$_srcdir"

  msg "build"
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux612-rt() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  depends=(
    'coreutils'
    'initramfs'
    'kmod'
  )
  optdepends=(
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=("linux=${pkgver}" VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)

  cd "$_srcdir"

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  ZSTD_CLEVEL=19 make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}/usr" \
  INSTALL_MOD_STRIP=1 modules_install

  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  cp arch/x86/boot/bzImage "${pkgdir}/usr/lib/modules/${_kernver}/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${pkgbase}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_kernver}/pkgbase"
  echo "${_basekernel}-rt-${CARCH}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_kernver}/kernelbase"

  # add kernel version
  echo "${_pkgver}-${_rtpatchver}-${pkgrel}-MANJARO x64" > "${pkgdir}/boot/${pkgbase}-${CARCH}.kver"

  # remove build link
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/build

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"
}

package_linux612-rt-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  depends=('gawk' 'python' 'libelf' 'pahole')
  provides=("linux-headers=$pkgver")

  cd "$_srcdir"
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${_builddir}/version"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile
  install -Dt "${_builddir}" -m644 vmlinux

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/x86" -m644 "arch/x86/Makefile"
  install -Dt "${_builddir}/arch/x86/kernel" -m644 "arch/x86/kernel/asm-offsets.s"

  cp -t "${_builddir}/arch/x86" -a "arch/x86/include"

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "${_builddir}/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool

  # https://forum.manjaro.org/t/90629/39
  install -Dt "${_builddir}/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */x86/ ]] && continue
    rm -r "${_arch}"
  done

  # remove documentation files
  rm -r "${_builddir}/Documentation"

  # strip scripts directory
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip $STRIP_SHARED "$file" ;;
    esac
  done < <(find "${_builddir}" -type f -perm -u+x ! -name vmlinux -print0 2>/dev/null)
  strip $STRIP_STATIC "${_builddir}/vmlinux"

  echo "Adding symlink..."
  mkdir -p "${pkgdir}/usr/src"
  ln -sr "${_builddir}" "${pkgdir}/usr/src/${pkgbase}"

  # remove unwanted files
  find ${_builddir} -name '*.orig' -delete
}
