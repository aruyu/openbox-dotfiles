# Openbox Dotfiles

Custom dotfiles for Openbox desktop setting which includes ZSH.

## Installation

<details>
<summary><b>Direct installation</b></summary>

#### Clone the repository to *'~/.config'* directly.

```bash
git clone https://github.com/astaos/openbox-dotfiles.git ~/.config
```

> Run *'install.sh'* to install essentials.

```bash
bash ~/.config/.scripts/install.sh
```

</details>

<details>
<summary><b>Install with rsync</b></summary>

#### I highly recommend to clone the repository to *'~/Documents'* with rsync.

```bash
git clone https://github.com/astaos/openbox-dotfiles.git ~/Documents/openbox-dotfiles/
```

> Use rsync to sync the dotfiles.

```bash
rsync -avxHAXP --exclude={'.git*/','.script','*.git','LICENSE','*.md'} ~/Documents/openbox-dotfiles/* ~/.config/
```

> Run *'install.sh'* to install essentials.

``` bash
bash ~/Documents/openbox-dotfiles/.scripts/install.sh
```

</details>

## *'install.sh'* script

Type one of belows.

- Arch
- Ubuntu
- Mac
- Font (*'JetBrainsMono NerdFont'* fonts installation)
