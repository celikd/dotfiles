### Wayland environment variables
export QT_QPA_PLATFORM="wayland;xcb"
#export QT_QPA_PLATFORMTHEME=qt5ct
export ELM_DISPLAY=wl
export SDL_VIDEODRIVER="wayland,x11"
export CLUTTER_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
# NVIDIA Only
#export WLR_NO_HARDWARE_CURSORS=1
#export GBM_BACKEND=nvidia-drm

### Hardware video acceleration
# Intel Desktop
#export VDPAU_DRIVER=va_gl
#export LIBVA_DRIVER_NAME=i965
# Intel Laptop
#export VDPAU_DRIVER=va_gl
#export LIBVA_DRIVER_NAME=iHD
# Nouveau Desktop
export VDPAU_DRIVER=nouveau
export LIBVA_DRIVER_NAME=nouveau
# NVIDIA Desktop
#export VDPAU_DRIVER=nvidia
#export LIBVA_DRIVER_NAME=nvidia
#export __GLX_VENDOR_LIBRARY_NAME=nvidia

### SSH-Agent
eval $(keychain --eval --quiet)

### Sway
export XDG_CURRENT_DESKTOP=sway
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    # Void Linux
    # exec dbus-run-session sway
    # Arch Linux
    exec sway
    #exec sway --unsupported-gpu
    #exec sway -d > ~/sway-debug.log
fi
