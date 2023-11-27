# Setup

## Git setup

```sh
sudo pacman -S git
git config --global user.name akhialomgir
git config --global user.email akhialomgir362856@gmail.com
ssh-keygen
# copy to Github
cat ~/.ssh/id_rsa.pub # or
 cat ~/.ssh/id_ed25519.pub
# or use xclip directly
xclip -sel clip < ~/.ssh/id_rsa.pub # or
 xclip -sel clip < ~/.ssh/id_ed25519.pub
# when using VPN: https://docs.github.com/en/authentication/troubleshooting-ssh/using-ssh-over-the-https-port
# Using SSH over the HTTPS port
vim ~/.ssh/config
    Host github.com
        Hostname ssh.github.com
        Port 443
        User git
ssh -v git@github.com
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
 sudo pacman -S tmux
 cp ~/EnvCfgDoc/Linux/cfgs/.tmux.conf ~
```

# VIM setup

```sh
sudo pacman -S vim
cp ~/EnvCfgDoc/Linux/cfgs/.vimrc ~
vim
```

# NeoVIM setup

```sh
sudo pacman -S neovim
cp -r ~/EnvCfgDoc/Linux/cfgs/nvim ~/.config/
sudo pacman -S ttf-firacode-nerd # set as default in console profile
nvim
rm -rf ~/.local/share/nvim/lazy # if module 'lazy' not found
```

## Plugins

- Lazy.nvim: 包管理器

### Git

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)

### Theme

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
