## Usage
```
cd $HOME
git clone --recursive git@github.com:friolero/.vim.git
ln -sf .vim/.vimrc
sudo apt-get install black pylint flake8 isort pycodestyle pydocstyle
sudo apt-get install clang-format clang-tidy
python3 .vim/bundle/YouCompleteMe/install.py
vim +PluginInstall +qall
```
