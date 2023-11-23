# Arch

# 安装

主要参考以下安装指南：

- [Archlinux WIKI 安装指南](https://wiki.archlinuxcn.org/wiki/%E5%AE%89%E8%A3%85%E6%8C%87%E5%8D%97)
- [Arch Linux + Windows 双系统安装教程](https://blog.linioi.com/posts/18/)

## 

下载内核前 https://stackoverflow.com/questions/74794022/curl-28-failed-to-connect-to-raw-githubusercontent-com-port-443-connection-t

## pacstrap

```sh
# base, base-devel      -> basic software
# linux                 -> core
# linux-firmware        -> firmware
# nano, vim             -> editor
# e2fsprogs             -> ext4
# ntfs-3g               -> windows
pacstrap /mnt base base-devel linux linux-firmware nano vim e2fsprogs ntfs-3g
```

## 安装过程

1. 分配磁盘空间
2. 禁止快速启动、安全启动
3. 设置时区偏移
4. 烧录启动盘并启动
5. 连接网络同步时间
6. 硬盘分区
7. 挂载分区
8. 安装基本系统并生成分区表
9. 进入系统
10. 创建用户组
11. 配置主机名
12. hosts 配置 github (分两次)
13. 配置 Grub 引导
14. 配置语言、区域（en_GB.UTF-8）
15. 启动 NetworkManager
17. 添加 Arch Linux CN 源，并安装 yay
18. 解决 windows 加密，重新生成 Grub 配置文件
16. 如果为特殊机型（Surface），安装对应内核
19. 测试是否能正常运行，如果可以再进行下述操作
20. 安装 KDE
21. 安装字体
22. 安装 fcitx5-im, fcitx5-chinese-addons

log

```sh
rfkill unblock all # 一般不需要
iwctl
    station wlan0 get-networks
    station wlan0 connect PDCN
    exit
ping www.bing.com

hwclock --systohc --utc
timedatectl set-ntp true

cfdisk /dev/nvme0n1
# 分区
fdisk -l

mkfs.ext4 /dev/nvme0n1p7
mkfs.vfat -F32 /dev/nvme0n1p5
mkswap /dev/nvme0n1p6

mount /dev/nvme0n1p7 /mnt
mkdir -p /mnt/boot
mount /dev/nvme0n1p5 /mnt/boot
swapon /dev/nvme0n1p6
lsblk

pacman -Syy
pacstrap /mnt base base-devel linux linux-firmware nano vim e2fsprogs ntfs-3g 
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

arch-chroot /mnt

passwd
useradd -m -G wheel -s /bin/bash akhia
passwd akhia
visudo
    %wheel ALL=(ALL) ALL

echo "AKHIA" > /etc/hostname

echo "185.199.108.133 raw.githubusercontent.com" >> /etc/hosts # 可能会变
curl -sSL https://raw.githubusercontent.com/maxiaof/github-hosts/master/hosts | tee -a /etc/hosts

pacman -S intel-ucode grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --recheck # 未配置 windows 引导

echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg # 一定要确定输入命令有输出

vim /etc/locale.gen
    #en_US.UTF-8 UTF-8
    #en_GB.UTF-8 UTF-8
    #zh_CN.UTF-8 UTF-8
    #zh_TW.UTF-8 UTF-8
locale-gen

echo "LANG=en_GB.UTF-8" > /etc/locale.conf

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

pacman -S networkmanager # 此时不 enable 因为如果更换内核会找不到版本号

vim /etc/pacman.conf
    [archlinuxcn]
    Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
pacman -Syy
pacman -S archlinuxcn-keyring

pacman -S yay
su akhia
yay -S dislocker 
sudo grub-mkconfig -o /boot/grub/grub.cfg # 检查输出是否有 Windows

cd ~
curl -o surface.asc -sSL https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc
sudo pacman-key --add surface.asc
sudo pacman-key --finger 56C464BAAC421453
sudo pacman-key --lsign-key 56C464BAAC421453
sudo vim /etc/pacman.conf
    [linux-surface]
    Server = https://pkg.surfacelinux.com/arch/
sudo pacman -Syu
sudo pacman -S linux-surface linux-surface-headers iptsd linux-firmware-marvell # current 可能需要安装命令行代理才能跑 居然Syy就解决了... 也没有完全解决iptsd 还是要看运气
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo systemctl enable NetworkManager # 更换内核需要重新 enable

# 重启

nmcli dev wifi list
nmcli dev wifi connect PDCN_5G -a

sudo pacman -S xorg plasma sddm konsole dolphin ark gwenview
sudo systemctl enable sddm
# 字体 <<插入配置
sudo pacman -S adobe-source-han-sans-cn-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-sarasa-gothic
# 中文输入法
sudo pacman -S fcitx5-im fcitx5-chinese-addons 
sudo vim /etc/environment
    GTK_IM_MODULE=fcitx
    QT_IM_MODULE=fcitx
    XMODIFIERS=@im=fcitx
    SDL_IM_MODULE=fcitx
# 蓝牙
sudo pacman -S bluez bluez-utils
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
# 重启
```

```sh
# 问题：现在没有 windows 分区 TODO 感觉不是最优 但是 os-prober一堆问题 可以先补救下
/etc/grub.d/40_custom

menuentry "Windows" {
    insmod part_gpt
    insmod chain
    set root='hd0,gpt1'
    chainloader /EFI/Microsoft/Boot/bootmgfw.efi
}
```

```sh
# 问题 nmcli(1.44.2) and networkmanager(Unknown) versions don't match
# 可能是更换内核导致
# 主要原因可能是 networkmanager 版本号丢失
systemctl enable NetworkManager # 已解决+
```

```sh
# 触屏还不能正常工作 TODO
```

```sh
# 同步 windows 和 arch 的蓝牙 TODO
```

```sh
# 字形调整 最好装好clash再整
mkdir -p ~/.config/fontconfig
curl -o ~/.config/fontconfig/fonts.conf -sSL https://raw.githubusercontent/szclsya/dotfiles/blob/master/fontconfig/fonts.conf
```

```sh
# clash todo
https://blog.linioi.com/posts/clash-on-arch/
wget -O ~/.config/clash/config.yaml xxx # 导入链接
```

```sh
# 高分屏屏幕比例问题
# https://wiki.archlinuxcn.org/wiki/HiDPI > KDE
# 系统设置→显卡与显示器→显示器配置→缩放率 重启 解决+
# 然而任务栏图标在xorg小死
Set the environment variable PLASMA_USE_QT_SCALING to 1.

Usually by adding export PLASMA_USE_QT_SCALING=1 to your ~/.xprofile
# 不过肉眼看不出变化，弃用
```

```sh
# grub 字体太小、编辑顺序 todo
# 顺序
sudo mv /etc/grub.d/30_os-prober /etc/grub.d/05_os-prober
# 字体大小

```

```sh
# 美化 sddm
打开 系统设置 > 点击侧栏 开机和关机 > 登录屏幕（SDDM）
```

```sh
# 改ctrl/esc
https://blog.lancediary.com/posts/3372432813/

永久改键
上述方法有个问题，在升级完系统系统之后可能会出现键位还原的情况。如果要永久修改，需要修改这个文件 /usr/share/X11/xkb/keycodes/evdev，找到如下两行:

...
<CAPS> = 66;
...
<LCTL> = 37;
...
修改成:

...
<CAPS> = 37;
...
<LCTL> = 66;
...

# reboot
```

- breeze dark
- touchpad nature scrolling、tap to click
- fcitx5 settings>input method>Shuangpin>1.ziranma
- fcitx5 settings>input method>global options>trigger input method>alt+shrift