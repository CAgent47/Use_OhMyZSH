<div align="center">

# 🐚 UseOhMyZSH

**Oh My Zsh on a fresh Linux install, in one command.**

![Shell](https://img.shields.io/badge/shell-bash-4EAA25?logo=gnubash&logoColor=white)
![Arch](https://img.shields.io/badge/Arch-supported-1793D1?logo=archlinux&logoColor=white)
![Debian](https://img.shields.io/badge/Debian-supported-A81D33?logo=debian&logoColor=white)
![Fedora](https://img.shields.io/badge/Fedora-supported-51A2DA?logo=fedora&logoColor=white)

</div>

---
**Creating Automation For Detect your os for install OhMyZSH**
---

## ✨ What is this?

Setting up [Oh My Zsh](https://ohmyz.sh/) by hand means installing a few packages, running the installer, and changing your default shell. **UseOhMyZSH** does all of that for you.

Pick the script for your distro, run it, answer one question, and you are done.

## 🐧 Supported distros

| Distro | Script | Package manager |
|--------|--------|-----------------|
| Arch Linux (and derivatives: Manjaro, EndeavourOS, ...) | `arch.sh` | `pacman` |
| Debian (and derivatives: Ubuntu, Pop!_OS, Kali, ...) | `debian.sh` | `apt` |
| Fedora | `fedora.sh` | `dnf` |

All three scripts follow the same steps. Only the package-manager commands differ.

## 🚀 Quick start

```bash
git clone https://github.com/CAgent47/UseOhMyZSH.git
cd UseOhMyZSH
```

Then run the script for your distro:

```bash
# Arch
bash arch.sh

# Debian / Ubuntu
bash debian.sh

# Fedora
bash fedora.sh
```

> **Note:** the script uses `sudo`, so your user needs sudo rights and will be asked for a password.

## ⚙️ What the script does

1. **Updates your system** with your distro's package manager.
2. **Checks for the required packages:** `zsh`, `git` and `curl`. It installs only the ones that are missing and skips the rest.
3. **Installs Oh My Zsh** using the official installer from the [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) repository.
4. **Asks if Oh My Zsh should be your default shell.**
   - Type `y` to run `chsh -s $(which zsh)`.
   - Type anything else to keep your current shell.

## 🔄 After the install

Changing the default shell takes effect on your **next login**, so log out and back in (or reboot).
To check it worked:

```bash
echo $SHELL
```

It should print the path to `zsh`, for example `/usr/bin/zsh`.

## 🛠️ Manual installation

If you prefer to do it yourself, the script boils down to this (Arch example):

```bash
# 1. Install the dependencies
sudo pacman -Syu
sudo pacman -S zsh git curl

# 2. Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. Make zsh your default shell
chsh -s $(which zsh)
```

On Debian use `sudo apt update && sudo apt install zsh git curl`, and on Fedora use `sudo dnf install zsh git curl`.

## 🧯 Troubleshooting

| Problem | Fix |
|---------|-----|
| `chsh: PAM: Authentication failure` | Enter your own user password, not root's. |
| Shell did not change after the script | Log out and log in again, then run `echo $SHELL`. |
| `curl: command not found` | Install `curl` with your package manager and run the script again. |
| You want to undo it | Run `chsh -s $(which bash)` and delete `~/.oh-my-zsh`. |

## 🤝 Contributing

Found a bug or want to add another distro (openSUSE, Alpine, ...)? Open an issue or a pull request. A new distro only needs a copy of an existing script with the package-manager commands swapped.

## 🙏 Credits

[Oh My Zsh](https://ohmyz.sh/) is made by the [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) community. This repository is only a helper that automates its setup.

---

<div align="center">

Made with ❤️ by [CAgent47](https://github.com/CAgent47)

</div>

![banner](banner.png)
