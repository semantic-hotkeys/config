# config

## Disclaimer

None of these configs are ready to be used. I'm still working towards an initial working prototype

## Summary

Contains some initial configuration for the idea of semantic hotkeys

- Terminal Multiplexers
  - [GNU Screen](https://git.savannah.gnu.org/cgit/screen.git) [config](./screen/screenrc.conf)
  - [tmux](https://github.com/tmux/tmux) [config](./tmux//tmux.conf)
  - ~~[byobu](https://bazaar.launchpad.net/~kirkland/byobu/trunk/files) (config not applicable)~~
  - ~~[mtm](https://github.com/deadpixi/mtm) (no config file)~~
  - ~~[3mux](https://github.com/aaronjanse/3mux) (config file is C header)~~
  - ~~[dvtm](https://github.com/martanne/dvtm) (config file is C header)~~

- Terminal Editors
  - [Micro](https://github.com/zyedidia/micro) [config](./micro/micro.json)
  - [Vim](https://github.com/vim/vim) [config](./vim/.vimrc)

## Keybindings

The goal is to make all shortcuts available with one hand. Bindings are mirrored to enable faster access.

### Types of Modes

- _oneshot_: After shortcut, resets
- _temporary mode_: Pressing keys within one keeps hotkey state within the same chord, until an unknown one (or escape?) is pressed
- _full mode_: Full mode change, and is changed through cycling rather than a keypress

A common set of keybindings

- `Trigger-y`: Help (oneshot)
  - `h`: Help for A
  - `j`: Help for B (ex. tmux Pane)
  - `k`: Help for C (ex. tmux Window)
  - `l`: Help for D
  - `y`: General help

- `Trigger-n`: New (oneshot)
  - `h`: Level A
  - `j`: Level B (ex. tmux Pane)
  - `k`: Level C (ex. tmux Window)
  - `l`: Level D
  - `$key`
    - `h`: New on Left
    - `l`: New on Right
    - `k`: New on Top
    - `j`: New on Bottom

- `Trigger-u`: Navigate (temporary mode)
  - `h`: Level A
  - `j`: Level B (ex. tmux Pane)
  - `k`: Level C (ex. tmux Window)
  - `l`: Level D
  - `$key`
    - `h`: Navigate to Left
    - `l`: Navigate to Right
    - `k`: Navigate to Top
    - `j`: Navigate to Bottom

- `Trigger-i`: Move (temporary mode)
  - `h`: Level A
  - `j`: Level B (ex. tmux Pane)
  - `k`: Level C (ex. tmux Window)
  - `l`: Level D
  - `$key`
    - `h`: Move to Left
    - `l`: Move to Right
    - `k`: Move to Top
    - `j`: Move to Bottom

- `Trigger-m`: Edit shape (temporary mode)
  - `h`: Level A
  - `j`: Level B (ex. tmux Pane)
  - `k`: Level C (ex. tmux Window)
  - `l`: Level D
  
- `Trigger-h`: Edit Attributes (temporary mode)
  - `h`: Level A
  - `j`: Level B (ex. tmux Pane)
  - `k`: Level C (ex. tmux Window)
  - `l`: Level D
  - `$key`
    - `$key` edits something

- `Trigger-o`: Find in

- `Trigger-p`: Pallete
