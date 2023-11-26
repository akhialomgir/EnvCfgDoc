# Arch

# 安装

主要参考以下安装指南：

- [Archlinux WIKI 安装指南](https://wiki.archlinuxcn.org/wiki/%E5%AE%89%E8%A3%85%E6%8C%87%E5%8D%97)
- [Arch Linux + Windows 双系统安装教程](https://blog.linioi.com/posts/18/)

## 详细流程

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

reboot # 重启进入本地 Arch
# 此时未安装图形界面

nmcli dev wifi list
nmcli dev wifi connect PDCN_5G -a

# 安装 linux-surface 内核
curl -o surface.asc -sSL https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc
sudo pacman-key --add surface.asc
sudo pacman-key --finger 56C464BAAC421453
sudo pacman-key --lsign-key 56C464BAAC421453
sudo vim /etc/pacman.conf
    [linux-surface]
    Server = https://pkg.surfacelinux.com/arch/
sudo pacman -Syu
sudo pacman -S linux-surface linux-surface-headers iptsd linux-firmware-marvell # current 可能需要安装命令行代理才能跑 居然Syy就解决了... 也没有完全解决iptsd 还是要看运气
sudo mount /dev/nvme0n1p5 /boot
sudo grub-mkconfig -o /boot/grub/grub.cfg # 注意输出内容中是否使用surface kernel

sudo systemctl enable NetworkManager # 更换内核需要重新 enable

# 安装 KDE
sudo pacman -S xorg plasma sddm konsole dolphin ark gwenview
sudo systemctl enable sddm
# 字体
sudo pacman -S adobe-source-han-sans-cn-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-sarasa-gothic
# 字形调整
mkdir -p ~/.config/fontconfig
curl -o ~/.config/fontconfig/fonts.conf -sSL https://raw.githubusercontent/szclsya/dotfiles/blob/master/fontconfig/fonts.conf
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

reboot # 重启
# 此时有图形界面

# Ctrl <-> Caps
sudo vim /usr/share/X11/xkb/keycodes/evdev
    <CAPS> = 66; => 37
    <LCTL> = 37; => 66

# V2rayA
sudo pacman -S v2ray
yay -S v2raya
sudo systemctl enable v2raya.service
sudo systemctl start v2raya.service
sudo vim /etc/environment # 配置命令行代理
    http_proxy=http://127.0.0.1:20172/
    https_proxy=http://127.0.0.1:20172/

# libwacom-surface 触屏驱动
yay -S libwacom-surface

# grub 加入 windows 分区 美化
# 从 store.kde.org/p/1009236 下载主题（如果字小就2k）
cd ~/Downloads
tar -xvf Vimix-2k.tar.xz
sudo sh install.sh
sudo mount /dev/nvem0n1p5 /boot # 可能不需要挂载？（待验证
sudo grub-mkconfig -o /boot/grub/grub.cfg

# 高分屏屏幕比例问题
# https://wiki.archlinuxcn.org/wiki/HiDPI#KDE
# 系统设置 → 显卡与显示器 → 显示器配置 → 缩放率 重启
# 任务栏图标较小的话右键手动调

# 主题美化
# 系统设置 -> breeze dark
# touchpad -> nature scrolling & tap to click

# fcitx5 基础设置
# fcitx5 设置 -> input method -> Shuangpin -> ziranma
# fcitx5 设置 -> input method -> global options -> trigger input method -> alt+shrift

# 设置fcitx5字体大小和主题
# fcitx5 设置 -> Configure Addons -> Classic User Interface

# 美化 sddm
# 系统设置 -> 侧栏：开机和关机 -> 登录屏幕（SDDM）
# sddm dpi
sudo vim /usr/lib/sddm/sddm.conf.d/default.conf
    ServerArguments=-nolisten -tcp -dpi 150

# 同步 windows 和 arch 的蓝牙
# https://wiki.archlinuxcn.org/wiki/%E8%93%9D%E7%89%99#%E5%8F%8C%E7%B3%BB%E7%BB%9F%E9%85%8D%E5%AF%B9
```

## pip

```sh
sudo pacman -S python3
# 库内包直接使用 pacman 安装
sudo pacman -S python-xxx
# 库外包建立虚拟环境后安装
python -m venv ./venv
source .venv/bin/activate
# 安装镜像避免代理导致的 SSL 问题
pip install --upgrade pip # 如果不行先关代理
pip install -i https://mirrors.ustc.edu.cn/pypi/web/simple pip -U
pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/web/simple
```

## TODO

- 使用代理时网络会显示 Limited Connectivity
- 使用代理时的 pip SSL 问题，疑似需要配置proxy
- 如果合上键盘盖超过一定时间会发热死机，原因不明
- fontconfig 待自定义
