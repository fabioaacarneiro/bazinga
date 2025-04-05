# 💤 Bazinga Neovim DotFile, by Fabio Carneiro

This is my effort to fully integrate LazyVim setup with Laravel and all Laravel related tools, this. It works great with Livewire v3, Volt and Folio. When using Volt, use the class-based syntax for better compatibility. The functional Volt also works, but has issues with $this.

This project was originally a [fork of LazyVim tailored for Laravel developers](https://github.com/kauffinger/lazyvim), but it was modified to remove the dependency on LazyVim to follow a completely independent path from LazyVim, keeping the core functionalities and adding new improvements and features.

You can still refer to the LazyVim documentation for keyboard shortcuts, I would venture to say that 90% of the shortcuts used in LazyVim have been kept.

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Please refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Laravel Native

This setup is configured with the best development tools available for laravel

- Intelephense
- Blade language support
- Blade formatter
- Pint
- Phpstan (make sure to configure larastan in your project)
- Rustywind
- Tailwind LS
- XDebug with Laravel Sail configuration
- Treesitter beta for included blade files

## Additions

I also use it for developing other stacks with Rails, Go with Gin and Goyave, React, Astro, and more.

For default, this dotfile give a Codeium plugin, similar to Copilot, to help us with
AI coge generations and chat, you need a account and run *:Codeium Auth* to make
a login and use the full features of plugin

### Requirements

If you encounter an issue with `Intelephense` not recognizing facade or template function calls, you will need to install [Laravel IDE Helper](https://github.com/barryvdh/laravel-ide-helper) in your project and run the relevant artisan commands. Thanks to [@ermand](https://github.com/ermand) for bringing up the issue and also the solution.

Make sure you install all of TreeSitter's parsers by doing:
`:TSInstall all` and `:TSInstall php_only`.
This will install the experimental blade parser, whose configuration is included in this configuration, as well as the php_only parser, which is required for it to work fully.
For some reason, php_only is not included in `all`.

Optional:

- lazygit
- lazydocker

(you should use both, they are great)

### LSP

- Tailwind support
- Intelephense for php (best in class for Laravel development)

### Theme

The main themes are:
- [Solarized Osaka](https://github.com/craftzdog/solarized-osaka.nvim)
- [catppuccin](https://github.com/catppuccin/nvim)

The catppuccin theme has not changed at all, but as for Solarized Osaka, I made changes to better suit the [ghostty](https://ghostty.org/) background blur with transparency
