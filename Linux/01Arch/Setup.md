# Setup

## WSL

[ArchWSL Install](https://github.com/yuk7/ArchWSL/releases)

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
pacman -Sy archlinux-keyring
pacman -Syu

sudo pacman -S zsh git
git config --global user.name akhialomgir
git config --global user.email akhialomgir362856@gmail.com
chsh -s /bin/zsh
```

Put zsh-autosuggestions and Vundle from the repository, then pull vimrc and zshrc from the remote.

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```


## Jupyter

install:

```sh
sudo pacman -S jupyterlab
```

Setting up soft links:

```sh
sudo ln -s /mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe /usr/bin/firefox
firefox https://github.com/
sudo ln -s /mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe /usr/bin/chrome
chrome https://github.com/
```

config:

```py
import webbrowser
webbrowser.register('chrome',None,webbrowser.GenericBrowser('/usr/bin/chrome'))
c.NotebookApp.browser = 'chrome'
c.ServerApp.use_redirect_file = False
```
