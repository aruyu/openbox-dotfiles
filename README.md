# Openbox Dotfiles

Custom dotfiles for Openbox desktop setting which includes ZSH.

## Installation

> I highly recommend to use ***'rsync'*** for installation.

<details>
<summary><b>Install with rsync</b></summary>

#### Clone the repository to *'~/Documents'* and install with rsync.

```bash
git clone https://github.com/astaos/openbox-dotfiles.git ~/Documents/openbox-dotfiles/
```

> Use rsync to sync the dotfiles.

```bash
rsync -avxHAXP --exclude={'.*','tools','LICENSE','*.md'} ~/Documents/openbox-dotfiles/* ~/.config/
```

> Run *'install.sh'* to install essentials.

``` bash
bash ~/Documents/openbox-dotfiles/tools/install_themes.sh
bash ~/Documents/openbox-dotfiles/tools/install_zsh.sh
```

</details>

<details>
<summary><b>Direct installation</b></summary>

#### Clone the repository to *'~/.config'* directly.

```bash
git clone https://github.com/astaos/openbox-dotfiles.git ~/.config
```

> Run *'install.sh'* to install essentials.

```bash
bash ~/.config/tools/install_themes.sh
bash ~/.config/tools/install_zsh.sh
```

</details>

## *'install.sh'* script

Type one of belows.

- Arch
- Ubuntu
- Mac
- Font (*'JetBrainsMono NerdFont'* fonts installation)
