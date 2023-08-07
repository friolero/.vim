## Usage
```
cd $HOME
sudo apt-get update && sudo apt-get install build-essential
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get install vim
git clone --recursive git@github.com:friolero/.vim.git
ln -sf .vim/.vimrc
sudo apt-get install black pylint flake8 isort pycodestyle pydocstyle
sudo apt-get install clang-format clang-tidy
sudo apt-get install python3-dev cmake
python3 .vim/bundle/YouCompleteMe/install.py
vim +PluginInstall +qall
```
