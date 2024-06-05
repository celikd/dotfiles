# Wayland
export QT_QPA_PLATFORM="wayland;xcb"
# export QT_QPA_PLATFORMTHEME=qt5ct
export ELM_DISPLAY=wl
export SDL_VIDEODRIVER="wayland,x11"
export CLUTTER_BACKEND=wayland
# NVIDIA Only
#export WLR_NO_HARDWARE_CURSORS=1
#export GBM_BACKEND=nvidia-drm

# Hardware video acceleration
# Intel Desktop
# export VDPAU_DRIVER=va_gl
# export LIBVA_DRIVER_NAME=i965
# Intel Laptop
# export VDPAU_DRIVER=va_gl
# export LIBVA_DRIVER_NAME=iHD
# Nouveau Desktop
export VDPAU_DRIVER=nouveau
export LIBVA_DRIVER_NAME=nouveau
# NVIDIA Desktop
#export VDPAU_DRIVER=nvidia
#export LIBVA_DRIVER_NAME=nvidia
#export __GLX_VENDOR_LIBRARY_NAME=nvidia

# SSH-Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Sway
export XDG_CURRENT_DESKTOP=sway
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec dbus-run-session sway
  # exec sway
  # exec sway --unsupported-gpu
  # exec sway -d > ~/sway-debug.log
fi
