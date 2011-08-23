
OLD=$PWD
cd $HOME
ln -sf .vim/vimrc .vimrc
cd .vim
mkdir -p bundle
for b in available-bundles/*; do
	ln -sf "../$b" bundle
done
rm -f bundle/pathogen
echo "Activated bundles:"
ls bundle
cd "$OLD"
