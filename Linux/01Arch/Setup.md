# Setup

## WSL

[ArchWSL Install](https://github.com/yuk7/ArchWSL/releases)

Unzip it in the root directory of the C drive and run Arch.exe

reinstall

```PowerShell
wsl --unregister Arch
wslconfig /setdefault Arch
```

enable proxy between Win and WSL

```PowerShell
New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
```

Switch to WSL2

```PowerShell
wsl -l -v
wsl --set-version Arch 2
wsl -l -v
```

## Initialization

First set up the user

```sh
useradd -m akhia
passwd akhia
export EDITOR=vim
visudo
    akhia ALL=(ALL:ALL) ALL
```

Set default user in cmd

```cmd
cd C:\Arch
Arch.exe config --default-user akhia
```

If you install or update directly, you will get a certificate error, so you need to install archlinux-keyring first.

```sh
# Changing software sources
sudo vim /etc/pacman.d/mirrorlist
    # TOP
    Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch

sudo pacman -Sy archlinux-keyring
sudo pacman -Syu

sudo pacman -S zsh git wget
git config --global user.name akhialomgir
git config --global user.email akhialomgir362856@gmail.com
git config --global core.editor vim
git config --global init.defaultBranch master
chsh -s /bin/zsh
```

Put zsh-autosuggestions and Vundle from the repository, then pull vimrc and zshrc from the remote.

```sh
export HOST_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}')
export https_proxy="http://$HOST_IP:7890"
export http_proxy="http://$HOST_IP:7890"

git clone https://github.com/akhialomgir/EnvCfgDoc.git
cp ~/EnvCfgDoc/Linux/RCs/.zshrc ~
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/EnvCfgDoc/Linux/RCs/.vimrc ~
```

Vim plugin install:

```vim
:PluginInstall
q
```

## Latex

Installing dependencies for latexindent

```sh
sudo cpan -i Log::Log4perl Log::Dispatch::File\
 YAML::Tiny File::HomeDir Unicode::GCString
```
