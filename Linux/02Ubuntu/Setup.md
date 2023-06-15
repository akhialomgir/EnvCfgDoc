# Setup

## WSL

Download in Microsoft Store

enable proxy between Win and WSL

```PowerShell
New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
```

Switch to WSL2

```PowerShell
wsl -l -v
wsl --set-version Ubuntu-22.04 2
wslconfig /setdefault Ubuntu-22.04
wsl -l -v
```

## Initialization

If you install or update directly, you will get a certificate error, so you need to install archlinux-keyring first.

```sh
# Changing software sources
sudo apt update && sudo apt upgrade
sudo apt install zsh
chsh -s /bin/zsh
git config --global user.name akhialomgir
git config --global user.email akhialomgir362856@gmail.com
```

Put zsh-autosuggestions and Vundle from the repository, then pull vimrc and zshrc from the remote.

```sh
export HOST_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}')
export https_proxy="http://$HOST_IP:7890"
export http_proxy="http://$HOST_IP:7890"

git clone https://github.com/akhialomgir/EnvCfgDoc.git
cp ~/EnvCfgDoc/Linux/RCs/.zshrc ~
cp ~/EnvCfgDoc/Linux/RCs/.vimrc ~
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Vim plugin install:

```vim
:PluginInstall
q
```
