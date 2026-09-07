# Ibus and Fcitx5 and Fcitx Input Method Configuration
This package sets environment variables, taking into account the following.

## X11 Environment
In X11 environments, the following environment variables are typically required.[^1] [^2] [^3]

### Fcitx5 or Fcitx
```bash
im=fcitx
export GTK_IM_MODULE=$im
export QT_IM_MODULE=$im
export XMODIFIERS=@im=$im
export INPUT_METHOD=$im
export SDL_IM_MODULE=$im
```

### Ibus
```bash
im=ibus 
export GTK_IM_MODULE=$im
export QT_IM_MODULE=$im
export XMODIFIERS=@im=$im
export INPUT_METHOD=$im
export SDL_IM_MODULE=$im
```

## Wayland Environment
### GNOME
Setting GTK_IM_MODULE may interfere with IME startup. Therefore, the above environment variable settings are not necessary.
https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland#GNOME [^4]

- Set XMODIFIERS=@im=fcitx for XWayland application
- Set QT_IM_MODULE=fcitx for Qt, since Qt5 would use XWayland by default.
- Qt need to use QT_IM_MODULE=fcitx since there is no text-input-v2 support.

```sh
im=fcitx
export XMODIFIERS=@im=$im
export QT_IM_MODULE=$im
```

### KDE
https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland#KDE_Plasma [^4]
Setting GTK_IM_MODULE and QT_IM_MODULE may interfere with IME startup. Therefore, the above environment variable settings are generally not necessary.  
In a KDE environment, it is recommended that you start Fcitx5 and IBUS from Kwin's VirtualKeyboard.  

Adding the following three settings may be beneficial for some applications:

```bash
im=fcitx
export XMODIFIERS=@im=$im
export INPUT_METHOD=$im
export SDL_IM_MODULE=$im
```

Prefer classicUI instead of WaylandUI.
In order to set GTK_IM_MODULE and QT_IM_MODULE, Fcitx5 displays a warning message in the Wayland environment, but please do not worry about it and use it as it is.
If you want to change the text or background colour, change the theme to something like plasma in Fcitx5's classicui settings, and also change the Follow
light-dark theme setting in the system settings to ON.

If the input window does not appear in the correct position in WaylandUI, try using ClassicUI.
```bash
im=fcitx
export XMODIFIERS=@im=$im
export INPUT_METHOD=$im
export SDL_IM_MODULE=$im
export GTK_IM_MODULE=$im
export QT_IM_MODULE=$im
```

However, since Fcitx does not support launching from a VirtualKeyboard, you will need to set an environment variable.
```bash
im=fcitx
export GTK_IM_MODULE=$im
export QT_IM_MODULE=$im
export XMODIFIERS=@im=$im
export INPUT_METHOD=$im
export SDL_IM_MODULE=$im
```

### Chrome-based Browsers in Wayland Environment
#### For Chromium, Vivaldi, Brave, Microsoft Edge, and other similar browsers:
Enable the following options to start IME in Wayland environments without environment variables.  
Edit the menu and add these options to the application:
```
--enable-wayland-ime --ozone-platform-hint=auto --wayland-text-input-v3=enable
```

Alternatively, launch the browser, access `chrome://flags`, set `ozone-platform-hint` to `auto`, and `wayland-text-input-v3` to `Enabled`.  
Restart the browser afterwards.

#### Additional Note
For the Flatpak version of Microsoft Edge, you may not find the options in `chrome://flags`. In this case, you need to edit the com.microsoft.Edge.desktop file.  
While it might be possible to edit through the menu depending on your environment, here's an example solution if permissions make it difficult:

```sh
cp /var/lib/flatpak/app/com.microsoft.Edge/current/active/export/share/applications/com.microsoft.Edge.desktop $HOME/.local/share/applications/
sed -i -e "s|Exec=\(.*\)$|Exec=\1 --enable-wayland-ime --ozone-platform-hint=auto --wayland-text-input-v3=enable|" $HOME/.local/share/applications/com.microsoft.Edge.desktop
```

This will create a local copy of the desktop file with the necessary options added.

### Snap version of Discord
Some apps in the Snap version may require environment variables to be set.
Below is an example of setting environment variables in the Snap version of Discord.
```sh
cp /var/lib/snapd/desktop/applications/discord_discord.desktop ~/.local/share/applications/
sed -i "s|Exec=\(.*\)|Exec=env GTK_IM_MODULE=fcitx env QT_IM_MODULE=fcitx env XMODIFIERS=@im=fcitx \1|" ~/.local/share/applications/discord_discord.desktop 
cat ~/.local/share/applications/discord_discord.desktop
```
```txt
[Desktop Entry]
X-SnapInstanceName=discord
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
X-SnapAppName=discord
Exec=env GTK_IM_MODULE=fcitx env QT_IM_MODULE=fcitx env XMODIFIERS=@im=fcitx env BAMF_DESKTOP_FILE_HINT=/var/lib/snapd/desktop/applications/discord_discord.desktop /var/lib/snapd/snap/bin/discord
Icon=/var/lib/snapd/snap/discord/228/meta/gui/icon.png
Type=Application
Categories=Network;InstantMessaging;
```

# Reference:
[^1]: https://wiki.archlinux.org/title/Fcitx5
[^2]: https://wiki.archlinux.org/title/Fcitx
[^3]: https://wiki.archlinux.org/title/IBus
[^4]: https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
