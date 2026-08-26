# Void Linux Niri and DankMaterialShell Fixes

What does this thing actually do?:
it's just my confif files i used on void to get niri working



This repository contains targeted configuration files and script fixes to run the Niri Wayland compositor and DankMaterialShell (DMS) on Void Linux.

## Included Configurations and Fixes

- **niri/config.kdl**: The main configuration file for Niri. It coordinates the desktop setup, window rules, and keybindings, including the following custom features:
  - **Window Resize Preset Keybind (Mod+R)**: Bound to switch window size by 25% for better usability.
  - **Keyboard Layout Switch Keybind (Mod+B)**: Bound to run the switch-layout.sh script to toggle layouts.
  - **Portal Screen Share Race Fix**: A startup hook that waits for Mutter's ScreenCast interface to register on D-Bus and then restarts xdg-desktop-portal-gnome, preventing screensharing freezes. (keep in mind that i probably wont work in most electron appilications)
- **niri/start-audio.sh**: Manually runs PipeWire, WirePlumber, and PipeWire-Pulse components at startup, which is required since Void Linux lacks systemd user session management.
- **niri/switch-layout.sh**: Helper script that rotates keyboard layouts (us and cz by default editable in **niri/config.kdl**) and provides a dms notification when switching 
- **niri/dms/**: Subfolder containing modular layout, color, and keybinding settings included by config.kdl. (most of these files are not needed added them just for if issues happen)

## Installation Guide

### 1. Install Dependencies
Ensure you have the required packages installed on Void Linux. Run:
```bash
sudo xbps-install -S niri pipewire wireplumber libnotify dbus
```

### 2. Backup Configurations s
For safety backup your current Niri configuration directory:
```bash
# Backup existing configurations
[ -d ~/.config/niri ] && cp -r ~/.config/niri ~/.config/niri.backup
```

### 3. Copy the Configurations
Copy the repository's configuration directory into your local user settings
keep in mind that **you don't have to copy most of the dms files LOOK INSIDE THEM**

**ALSO DONT FORGET TO REMOVE THE OLD CONFIGS**

### 4. Make Scripts Executable
Grant execution permissions to the helper scripts:
```bash
chmod +x ~/.config/niri/start-audio.sh
chmod +x ~/.config/niri/switch-layout.sh
```

### 5. Fix Script Location
Fix the switch-layout.sh directory in **niri/dms/binds.kdl** and start-audio.sh in **niri/config.kdl**

### 5. Enable D-Bus Service
Since Void Linux does not automatically manage user session services via systemd, ensure the system D-Bus daemon is running through runit:
```bash
sudo ln -s /etc/sv/dbus /var/service/
```

**After applying fixes restart your computer and login to Niri**
