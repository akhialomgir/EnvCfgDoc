# Setup

## Git setup

```sh
sudo pacman -S git
git config --global user.name "akhialomgir"
git config --global user.email “akhialomgir362856@gmail.com”
ssh-keygen
cat ~/.ssh/id_rsa.pub # copy to Github
# or
cat ~/.ssh/id_ed25519.pub # copy to Github
ssh -T git@github.com
```


## ZSH setup

```sh
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting -y

cp ~/EnvCfgDoc/Linux/cfgs/.zshrc ~ && zsh # common Linux

cat ~/EnvCfgDoc/Linux/cfgs/.zshrc ~/EnvCfgDoc/Linux/cfgs/.zshrc_WSL2 > ~/.zshrc && zsh # WSL2

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
neovim
```
