Clone dotfiles project
`git clone git@github.com:luetkemj/dotfiles.git ~/.dotfiles`

Create .vimrc file here:
`touch ~/.vimrc`

With the following contents:
`source ~/.dotfiles/vim/.vimrc`

Setup .vim directory:

```
~/
  .vim
    autoload
    backup
    colors
    plugged
```

[Download](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) plug.vim and place it in the autoload directory


Install plugins with Plug by running the following command in vim

`:PlugInstall`

To go from vim to nvim, install nvim and run this from nvim `:help nvim-from-vim`

```
                    .
    ##############..... ##############
    ##############......##############
      ##########..........##########
      ##########........##########
      ##########.......##########
      ##########.....##########..
      ##########....##########.....
    ..##########..##########.........
  ....##########.#########.............
    ..################JJJ............
      ################.............
      ##############.JJJ.JJJJJJJJJJ
      ############...JJ...JJ..JJ  JJ
      ##########....JJ...JJ..JJ  JJ
      ########......JJJ..JJJ JJJ JJJ
      ######    .........
                  .....
                    .
```

## Todos:

- [x] auto format
- [ ] go to definition
- [ ] add https://github.com/tpope/vim-surround
- [ ] investigate https://github.com/preservim/nerdcommenter
- [ ] https://github.com/mattn/emmet-vim
- [ ] https://github.com/ycm-core/YouCompleteMe
