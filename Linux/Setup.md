# Set

## ZSH setup

```sh
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting -y

cp ~/EnvCfgDoc/Linux/RCs/.zshrc ~ \
&& source ~/.zshrc  # common Linux

cat ~/EnvCfgDoc/Linux/RCs/.zshrc ~/EnvCfgDoc/Linux/RCs/.zshrc_WSL2 > ~/.zshrc \
&& source ~/.zshrc  # WSL2
```

## TMUX setup

```sh
 sudo pacman -S tmux
 cp ~/EnvCfgDoc/Linux/RCs/.tmux.conf ~
```

# VIM setup

```sh
sudo pacman -S vim
cp ~/EnvCfgDoc/Linux/RCs/.vimrc ~
vim
```

# NeoVIM setup

```sh
sudo pacman -S neovim
cp -r cp -r ~/EnvCfgDoc/Linux/RCs/nvim ~/.config/
neovim
```
