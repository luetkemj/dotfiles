`git clone git@github.com:luetkemj/vim.git ~/.vim`

create a .vimrc that points to the actual .vimrc file in the .vim directory

`touch ~/.vimrc`

.vimrc contents:

`source ~/.vim/.vimrc`

install plugins with Plug

`:PlugInstall`

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
