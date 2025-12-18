1. **Hyprland is not working / Display problems:**

**If you have a NVIDIA graphics card:**
- Open `/etc/mkinitcpio.conf`, for example, `nano /etc/mkinitcpio.conf`.
- In the `MODULES` array add the following modules names:
    - `MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)`.
- You can then rebuild the initramfs with `sudo mkinitcpio -P`, and reboot.

**If you have a Amd / Intel graphics card:**
- You need to go to Arch Wiki and do the installation manually.
for Intel - https://wiki.archlinux.org/title/Intel_graphics.
for Amd - https://wiki.archlinux.org/title/AMDGPU.


2. **Other errors:**
- If you find bugs that aren't listed here and you're sure you followed the manual, then be sure to contact us so we can fix the bug in the next update.
