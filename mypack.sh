mkdir -p ~/.vim/pack/mypack/start/
mkdir -p ~/.vim/pack/mypack/opt/
cd ~/.vim/pack/mypack/start/
# neocomplete
git clone https://github.com/Shougo/neocomplete.vim.git
# neosnippet
git clone https://github.com/Shougo/neosnippet.vim.git
git clone https://github.com/Shougo/neosnippet-snippets.git

# vim-endwise
git clone https://github.com/tpope/vim-endwise.git

# vim-ref
git clone https://github.com/thinca/vim-ref.git
gem install refe2
bitclust setup

#vim rails
git clone git://github.com/tpope/vim-rails.git
git clone git://github.com/tpope/vim-bundler.git

#vim-fugitive
git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

# molokai
cd /tmp
git clone https://github.com/tomasr/molokai
mv /tmp/molokai/colors/molokai.vim ~/.vim/colors/.
rm -rf /tmp/molokai

# memolist
git clone https://github.com/glidenote/memolist.vim.git


# vimshell
git clone https://github.com/Shougo/vimshell.vim.git

