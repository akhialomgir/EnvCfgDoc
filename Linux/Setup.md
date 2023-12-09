# Setup

## Git setup

```sh
sudo pacman -S git
git config --global user.name akhialomgir
git config --global user.email akhialomgir362856@gmail.com
git config --global core.editor nvim
git config --global credential.helper libsecret # https credential helper
ssh-keygen
# copy to Github
cat ~/.ssh/id_rsa.pub # or
 cat ~/.ssh/id_ed25519.pub
# or use xclip directly
xclip -sel clip < ~/.ssh/id_rsa.pub # or
 xclip -sel clip < ~/.ssh/id_ed25519.pub
# when using v2raya: https://docs.github.com/en/authentication/troubleshooting-ssh/using-ssh-over-the-https-port
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

cat ~/EnvCfgDoc/Linux/cfgs/.zshrc ~/EnvCfgDoc/Linux/cfgs/.zshrc_clash_win > ~/.zshrc && zsh # WSL2

chsh -s $(which zsh)
```

## TMUX setup

```sh
 sudo pacman -S tmux xclip
 cp ~/EnvCfgDoc/Linux/cfgs/.tmux.conf ~
```

# VIM setup

```sh
sudo pacman -S gvim
cp ~/EnvCfgDoc/Linux/cfgs/.vimrc ~
vim
```

# NeoVIM setup

```sh
sudo pacman -S neovim
cp -r ~/EnvCfgDoc/Linux/cfgs/nvim ~/.config/
sudo pacman -S ttf-firacode-nerd # set as default font in console profile
nvim
rm -rf ~/.local/share/nvim/lazy # if module 'lazy' not found
```

