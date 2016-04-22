this_path=`readlink -m $(dirname $0)`

echo "source $this_path/vimrc.vim" >> ~/.vimrc
echo "source $this_path/bashrc.bash" >> ~/.bashrc
