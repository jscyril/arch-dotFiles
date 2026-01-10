# Arch Linux Configuration Dotfiles

This repository contains configuration files and settings used on my **Arch Linux** system. It includes custom setup for your shell, editor, and terminal workspace to help you get a consistent environment quickly on any fresh install.

These are commonly called *dotfiles* because they are hidden configuration files in Unix-like systems that control your shell, editor, and tool preferences. Managing them in a Git repository lets you sync your environment across machines and recreate your setup easily. ([ArchWiki][1])

## Table of Contents

* About
* Repository Structure
* Installation
* Usage
* Contributing
* License

## About

This repository holds personal config files for my Arch setup. These files configure things like:

* **Zsh shell**
* **Neovim editor**
* **Zellij terminal workspace**
* Any other general system configs

They help ensure my environment behaves consistently and saves time when setting up a new system.

## Repository Structure

Here’s how the repository is organized:

```
.
├── .gitignore
├── zsh/                    # Zsh shell configuration
├── nvim/.config/           # Neovim editor config
└── zellij/.config/zellij/  # Zellij terminal layout and settings
```

### Descriptions

* **.gitignore**
  Keeps certain files and directories out of version control.

* **zsh/**
  Contains Zsh configuration files like `.zshrc`, themes, aliases, and plugins.

* **nvim/.config/**
  Holds your Neovim setup including `init.vim` / `init.lua` and plugins.

* **zellij/.config/zellij/**
  Defines workspaces, layouts, and keybindings for the Zellij terminal multiplexer.

Adjust these paths based on where you clone the repository.

## Installation

Follow these steps to set up your Arch environment with these configs.

1. Clone this repo to your home directory (or any location you prefer):

   ```bash
   git clone https://github.com/jscyril/arch-dotFiles.git ~/.arch-dotfiles
   ```

2. Create symbolic links so that your system uses these configs:

   ```bash
   ln -s ~/.arch-dotfiles/zsh/.zshrc ~/.zshrc
   ln -s ~/.arch-dotfiles/nvim/.config/nvim ~/.config/nvim
   ln -s ~/.arch-dotfiles/zellij/.config/zellij ~/.config/zellij
   ```

3. Reload or start a new shell session:

   ```bash
   exec zsh
   ```

Adjust the commands above if you store the repo in a different place on your system.

## Usage

Once linked:

* Open a new terminal to load your Zsh config.
* Launch **Neovim** with your custom editor settings.
* Use **Zellij** to manage terminal panes and sessions.

If configs don’t load, double-check your symlinks and ensure directories like `~/.config/nvim` exist.

## Contributing

Feel free to fork, update, and submit pull requests. If you find bugs or want enhancements, open an issue describing your changes.
