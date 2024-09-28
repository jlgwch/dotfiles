# nvidia suspend fixes
1. Create file `/etc/modprobe.d/nvidia.conf` with the following contents.
```
options nvidia_drm modeset=1 fbdev=1
# options nvidia NVreg_EnableGpuFirmware=0
options nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_TemporaryFilePath=/var/tmp
options nvidia NVreg_RegistryDwords="PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3"
```
Then execute the following command:
```
 sudo mkinitcpio -P
```
WARNING: Ensure /var/tmp has enough space to store your temporary file (total VRAM of all cards + 5% margin).

2. Edit /etc/default/grub and add the following lines inside line GRUB_CMDLINE_LINUX_DEFAULT as followed:
```
nvidia.NVreg_PreserveVideoMemoryAllocations=1 nvidia.NVreg_EnableGpuFirmware=0
```
so for example it should look something like this: 
```
GRUB_CMDLINE_LINUX_DEFAULT="nowatchdog loglevel=5 nvme_load=YES nvidia.NVreg_PreserveVideoMemoryAllocations=1 nvidia.NVreg_EnableGpuFirmware=0 nvidia_drm.modeset=1  nvidia-drm.modeset=1"
```
update grub
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

3. Enable services as followed:
```
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service
```

4. Reboot.

# environment
- system: archlinux
- cpu: r7 5800h
- gpu: rtx 3060
- gpu driver: nvidia-dkms
- gpu connection method: Dedicated GPU direct connection.
- desktop: hyprland


# references
1. https://github.com/wxqwinner/xdots/blob/master/docs/nvidia_suspend_fixes.md
2. https://gist.github.com/jstarcher/abdac9c2c0b5de8b073d527870b73a19