# qr-scanner
QR code scanner built as an adaptive app for desktop and mobile linux.

This is still a work in progress as I learn to create an app.

## How to Build

### Flatpak

```
flatpak-builder build com.github.sirthomas.qr-scanner.yml --user --install --force-clean
```

### Meson

```
meson build --prefix=/usr
cd build
ninja
sudo ninja install
```