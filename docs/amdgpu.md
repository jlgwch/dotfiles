# fix error edid
在混合模式下，启用 `AMD` 核显后，笔记本显示器刷新率只支持到 `60Hz`,解决方法如下：
- 先切换到独显模式，找到使用的edid
```
sudo mkdir /usr/lib/firmware
sudo cp /sys/class/drm/card1-eDP-1/edid /usr/lib/firmware/edid/edid.bin
```
- 添加内核启动参数
```
sudo vim /etc/default/grub
```
```
GRUB_CMDLINE_LINUX="drm.edid_firmware=eDP-1:edid/edid.bin"
```
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
- 编辑 `/etc/mkinitcpio.conf`
```
sudo vim /etc/mkinitcpio.conf
```
```
MODULES=(amdgpu nvidia nvidia_modeset nvidia_uvm nvidia_drm)
FILES=(/usr/lib/firmware/edid/edid.bin)
```
```
sudo mkinitcpio -P
```
# fix suspend
- 编辑 `/etc/modprobe.d/blacklist-hid_sensors.conf`
```
blacklist hid_sensor_accel_3d
blacklist hid_sensor_gyro_3d
blacklist hid_sensor_magn_3d
```