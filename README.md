<div align="center">

# 🐚 Zsh + Oh My Zsh — The Complete Setup Guide

**Turn your boring terminal into something you actually enjoy using.**

![License](https://img.shields.io/badge/license-MIT-green)
![Shell](https://img.shields.io/badge/shell-zsh-89e051)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS-blue)
![Level](https://img.shields.io/badge/level-beginner--friendly-orange)

</div>

---

## 📖 What Is This?

**Zsh** (Z shell) is a command-line shell — a drop-in upgrade over Bash with better autocompletion, smarter history search, and a plugin ecosystem.

**Oh My Zsh** is an open-source framework for managing Zsh configuration — it gives you themes, plugins, and sane defaults without hand-editing config files from scratch.

This guide gets you from a plain terminal to a fully themed, plugin-powered Zsh setup — and it doesn't matter whether you're starting from Bash or already have Zsh installed. Both paths are covered below.

---

## 📋 Table of Contents

- [Before You Start](#-before-you-start)
- [Path A — You're currently on Bash](#-path-a--youre-currently-on-bash)
- [Path B — You already have Zsh installed](#-path-b--you-already-have-zsh-installed)
- [Installing Oh My Zsh](#-installing-oh-my-zsh-both-paths-continue-here)
- [Setting Zsh as Your Default Shell](#-setting-zsh-as-your-default-shell)
- [Recommended Plugins](#-recommended-plugins)
- [Recommended Theme](#-recommended-theme)
- [Troubleshooting](#-troubleshooting)
- [Uninstalling](#-uninstalling-going-back-to-bash)
- [License](#-license)

---

## ✅ Before You Start

Check which shell you're currently running:

```bash
echo $SHELL
```

- If it prints `/bin/bash` or `/usr/bin/bash` → go to **Path A**
- If it prints `/bin/zsh` or `/usr/bin/zsh` → go to **Path B**

---

## 🅰️ Path A — You're Currently on Bash

You need to install Zsh first.

### Debian / Ubuntu / Pop!_OS
```bash
sudo apt update
sudo apt install -y zsh
```

### Fedora / RHEL / CentOS
```bash
sudo dnf install -y zsh
```

### Arch / Manjaro / EndeavourOS
```bash
sudo pacman -S zsh
```

### macOS (with Homebrew)
```bash
brew install zsh
```

### Verify the install
```bash
zsh --version
```
You should see something like `zsh 5.9 (x86_64-pc-linux-gnu)`.

➡️ Once installed, jump to [Installing Oh My Zsh](#-installing-oh-my-zsh-both-paths-continue-here).

---

## 🅱️ Path B — You Already Have Zsh Installed

Nothing to install — skip straight to setting up Oh My Zsh below. You can confirm your version anytime with:

```bash
zsh --version
```

➡️ Continue to [Installing Oh My Zsh](#-installing-oh-my-zsh-both-paths-continue-here).

---

## 🎨 Installing Oh My Zsh (Both Paths Continue Here)

Make sure `curl` or `wget` and `git` are installed first:

```bash
sudo apt install -y curl git      # Debian/Ubuntu
sudo dnf install -y curl git      # Fedora
sudo pacman -S curl git           # Arch
```

Now run the official install script:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Or with `wget` instead of `curl`:

```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

The installer will:
1. Clone Oh My Zsh into `~/.oh-my-zsh`
2. Back up any existing `~/.zshrc` to `~/.zshrc.pre-oh-my-zsh`
3. Create a fresh `~/.zshrc` with sane defaults
4. **Ask if you want to switch your default shell to Zsh** — say yes if you're on Path A

---

## 🔧 Setting Zsh as Your Default Shell

If the installer didn't already do this for you (or you said no), do it manually:

```bash
chsh -s $(which zsh)
```

You'll be asked for your password. **Log out and log back in** (or restart your terminal) for the change to fully apply.

### Verify it worked
```bash
echo $SHELL
```
Should now print `/usr/bin/zsh` or `/bin/zsh`.

---

## 🔌 Recommended Plugins

Oh My Zsh ships with dozens of built-in plugins. Two of the most useful aren't enabled by default and need a quick manual install:

### zsh-autosuggestions (suggests commands as you type, based on history)
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### zsh-syntax-highlighting (highlights valid/invalid commands as you type)
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Then open `~/.zshrc` and update the plugins line:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

Save, then reload your config:
```bash
source ~/.zshrc
```

---

## 🖌️ Recommended Theme

The default theme is called `robbyrussell` — clean and minimal. For something more feature-rich, **Powerlevel10k** is the most popular upgrade:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

Then set it in `~/.zshrc`:
```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Reload your shell:
```bash
source ~/.zshrc
```

Powerlevel10k will launch a configuration wizard automatically the first time — just answer the prompts to pick your preferred style.

> 💡 **Font tip:** Powerlevel10k needs a [Nerd Font](https://www.nerdfonts.com/) to render icons correctly. Install one (e.g. "MesloLGS NF") and set it as your terminal's font, or the wizard will guide you through it.

---

## 🩹 Troubleshooting

| Problem | Fix |
|---|---|
| `chsh: PAM: Authentication failure` | Make sure you're typing your **login password**, not sudo cache; retry directly at a real terminal (not inside tmux/screen) |
| Terminal still opens in Bash after restart | Log out completely and back in — some terminal emulators cache the shell per-session |
| `zsh: command not found: zsh` after `chsh` | Zsh isn't in `/etc/shells`; add it with `echo $(which zsh) | sudo tee -a /etc/shells` then retry `chsh` |
| Broken icons/boxes in prompt | Install and select a Nerd Font in your terminal emulator's preferences |
| Oh My Zsh install script hangs on git clone | Check your internet connection or try the `wget` variant instead of `curl` |

---

## ↩️ Uninstalling (Going Back to Bash)

```bash
uninstall_oh_my_zsh
chsh -s $(which bash)
```

Log out and back in to confirm Bash is your shell again.

---

## 📜 License

Distributed under the **MIT License**. Free to use, modify, and share.

---

<div align="center">

Made with 🐚 by **CAgent_47**
[GitHub](https://github.com/CAgent47) · [LinkedIn](https://www.linkedin.com/in/mohammad-shaygan-2a96a8387) · [X](https://x.com/CAgent_47)

</div>
---

[#CAgent_47](https://github.com/topics/CAgent47)

---

![Banner](banner.png)
