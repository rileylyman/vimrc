set -e

if [ -f ~/.vimrc ]; then
  echo "Error: ~/.vimrc already exists and would be overwritten."
  exit 1
fi

if [ -f ~/.bashrc ]; then
  echo "Error: ~/.bashrc already exists and would be overwritten."
  exit 1
fi

if [ -f ~/.config/nvim/init.vim ]; then
  echo "Error: ~/.config/nvim/init.vim already exists and would be overwritten."
  exit 1
fi

echo "Install .bashrc and .vimrc"
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc

mkdir -p ~/.config/nvim/
echo 'runtimepath^=~/.vim runtimepath+=~/.vim/after' >> ~/.config/nvim/init.nvim
echo 'let &packpath = &runtimepath' >> ~/.config/nvim/init.nvim
echo 'source ~/.vimrc' >> ~/.config/nvim/init.nvim

echo "Installing vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
