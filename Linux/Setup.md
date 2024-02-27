# Setup

## Git setup

```sh
sudo pacman -S git
git config --global user.name akhialomgir
git config --global user.email akhialomgir362856@gmail.com

git config --global credential.helper libsecret # https credential helper

git config --global core.editor nvim
git config --global merge.tool nvimdiff
git config --global mergetool.nvimdiff trustExitCode true
git config --global mergetool.keepBackup false

git config --global pull.rebase false

ssh-keygen
# copy to Github
cat ~/.ssh/id_rsa.pub # or
 cat ~/.ssh/id_ed25519.pub
# or use xclip directly
xclip -sel clip < ~/.ssh/id_rsa.pub # or
 xclip -sel clip < ~/.ssh/id_ed25519.pub
# when using v2raya: https://docs.github.com/en/authentication/troubleshooting-ssh/using-ssh-over-the-https-port
# use v2rayn proxy  INFO: not working
git config --global http.proxy 'socks5://127.0.0.1:20170'
git config --global https.proxy 'socks5://127.0.0.1:20170'
# Use SSH over the HTTPS port
vim ~/.ssh/config
    Host github.com
        Hostname ssh.github.com
        Port 443
        User git
ssh -v git@github.com #TODO: not working well with v2raya
```

## ZSH setup

```sh
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting -y

cp ~/EnvCfgDoc/Linux/cfgs/.zshrc ~ && zsh # common Linux

cat ~/EnvCfgDoc/Linux/cfgs/.zshrc ~/EnvCfgDoc/Linux/cfgs/.zshrc_clash_win \
  > ~/.zshrc && zsh # WSL2

chsh -s $(which zsh)
```

## TMUX setup

```sh
 sudo pacman -S tmux xclip
 cp ~/EnvCfgDoc/Linux/cfgs/.tmux.conf ~
```

## VIM setup

```sh
sudo pacman -S gvim
cp ~/EnvCfgDoc/Linux/cfgs/.vimrc ~
vim
```

## NeoVIM setup

```sh
sudo pacman -S neovim
cp -r ~/EnvCfgDoc/Linux/cfgs/nvim ~/.config/
sudo pacman -S ttf-firacode-nerd # set as default font in console profile
nvim
rm -rf ~/.local/share/nvim/lazy # if module 'lazy' not found
```

## qq

```sh
yay -S linuxqq
```

## spectacle

```sh
sudo pacman -S spectacle
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

## VLC

```sh
sudo pacman -S vlc # 不要下开发分支
```

## NeoMutt

```sh
sudo pacman -S neomutt msmtp pass notmuch urlview lynx cronie
yay -S abook pam-gnupg
mkdir -p ~/Downloads/gitthings/
git clone https://github.com/LukeSmithxyz/mutt-wizard ~/Downloads/gitthings/mutt-wizard/
cd ~/Downloads/gitthings/mutt-wizard/
sudo make install
gpg --full-generate-key
pass init akhialomgir362856@gmail.com
mw -a akhialomgir362856@gmail.com # google app specific password
mailsync akhialomgir362856@gmail.com
neomutt #TODO:开启时自动同步邮件、folder显示问题（isync

nvim ~/.config/mutt/muttrc
```

## Rsync

<!--TODO: 待配置-->

## Chrome

```sh
yay -S google-chrome
alias chrome="google-chrome-stable"
