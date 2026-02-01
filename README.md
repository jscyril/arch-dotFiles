# Arch Linux Dotfiles

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Niri](https://img.shields.io/badge/Niri-WM-blue?style=for-the-badge)
![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)

Personal configuration files for my **Arch Linux** setup, managed with [GNU Stow](https://www.gnu.org/software/stow/).

<!-- Add your screenshot here -->
<!-- ![Desktop Screenshot](./screenshots/desktop.png) -->

## ✨ What's Included

| Package | Description |
|---------|-------------|
| **niri** | Scrollable tiling Wayland compositor config |
| **noctalia** | Custom theme/settings |
| **nvim** | Neovim editor with lazy.nvim plugin manager |
| **zsh** | Zsh shell config, aliases, and plugins |
| **zellij** | Terminal multiplexer layouts and keybindings |
| **alacritty** | GPU-accelerated terminal emulator |
| **btop** | System monitor config and themes |
| **hypridle** | Idle daemon for Hyprland/Wayland |
| **hyprlock** | Lock screen for Hyprland/Wayland |

## 📁 Repository Structure

```
~/.dotfiles/
├── alacritty/.config/alacritty/
├── btop/.config/btop/
├── hypridle/.config/hypr/hypridle.conf
├── hyprlock/.config/hypr/hyprlock.conf
├── niri/.config/niri/
├── noctalia/.config/noctalia/
├── nvim/.config/nvim/
├── zellij/.config/zellij/
└── zsh/
```

## 🚀 Installation

### Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/) (`sudo pacman -S stow`)
- Git

### Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/jscyril/arch-dotFiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Stow the packages you want:**
   ```bash
   # Stow individual packages
   stow nvim
   stow zsh
   stow niri
   stow noctalia
   stow btop
   stow hypridle
   stow hyprlock
   stow alacritty
   stow zellij
   
   # Or stow everything at once
   stow */
   ```

3. **Reload your shell:**
   ```bash
   exec zsh
   ```

### Removing a package

```bash
stow -D <package-name>
```

## 📝 Notes

- **Niri** is the primary Wayland compositor
- **Hypridle/Hyprlock** handle idle management and screen locking
- Configs use transparent backgrounds where supported
