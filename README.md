# Arman_setup

### Steps to follow
1. Install [iterm2](https://iterm2.com/)
2. Install homebrew in iterm2 with this command (It will automatically install XCode too) - 
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
3. Necessary requirements for [current .zshrc](#contents-of-zshrc) &rarr; Install a nerdfont, pyenv, fzf, vimplug
```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install git pyenv nodenv fzf
nodenv install --list
# Manually install latest/required node version
nodenv install 23.11.1 && nodenv global 23.11.1
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
``` 
4. Just copy the `.zshrc` and `.vimrc`


#### Contents of .zshrc
> Copy paste the .zshrc
> `source ~/.zshrc`
1. [`Zinit`](https://github.com/zdharma-continuum/zinit) as plugin manager.
2. [`NerdFont`]() as Font manager. (Need to be installed manually)
3. [`PowerLevel10K`]() as prompt theme manager. (Installed by zinit)
4. Then we have zinit plugins for syntax-highlighting, tab-completion and auto-suggestions.
5. Then we have custom modified historical searching.
6. [`fzf`]() Fuzzyfinder (customized)
7. Can add OMZ plugins that you like, e.g for git completions.
8. [`zoxide`]()


#### Contents of .vimrc
> Copy paste the .vimrc
> Open vim by entering `vim` in terminal. Then run the commmand `:PlugInstall`