# Openbox Dotfiles

Custom dotfiles for Openbox WM for xorg with ZSH.

## Installation

> I highly recommend to use ***'rsync'*** for installation.

<details>
<summary><b>Install with rsync</b></summary>

#### Clone the repository to *'~/Documents'* and install with rsync.

```bash
git clone https://github.com/aruyu/openbox-dotfiles.git ~/Documents/openbox-dotfiles/
```

> Use rsync to sync the dotfiles.

```bash
rsync -avxHAXP --exclude={'.git*','tools','LICENSE','*.md'} ~/Documents/openbox-dotfiles/. ~/
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
git clone https://github.com/aruyu/openbox-dotfiles.git ~/Downloads/openbox-dotfiles/
cp -rf ~/Downloads/openbox-dotfiles/.* ~/
```

> Run *'install.sh'* to install essentials.

```bash
bash ~/Downloads/openbox-dotfiles/tools/install_themes.sh
bash ~/Downloads/openbox-dotfiles/tools/install_zsh.sh
```

</details>

## *'install.sh'* script

Type one of belows.

- Arch
- Ubuntu
- Mac
- Font (*'JetBrainsMono NerdFont'* fonts installation)
