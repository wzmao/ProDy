
read -p "Enter tutorial title (e.g. ENM Analysis using ProDy): " TITLE
while [ -z "$TITLE" ]
do
	read -p "Enter tutorial title: " TITLE
done
read -p "Enter a short title (e.g. ENM Analysis): " SHORT
while [ -z "$SHORT" ]
do
	read -p "Enter a short title: " SHORT
done
read -p "Enter author name (seperate multiple names with comma): " AUTHOR
while [ -z "$AUTHOR" ]
do
	read -p "Enter author name: " AUTHOR
done
SHORT=${SHORT,,}
TUTORIAL=${SHORT// /_}
REFERENCE=${SHORT// /-}


mkdir -p $TUTORIAL
mkdir -p $TUTORIAL/$TUTORIAL\_files
ln -fs ../../_pkginv $TUTORIAL
ln -fs ../../_static $TUTORIAL
ln -fs ../../_templates $TUTORIAL
ln -fs ../../funding.rst $TUTORIAL/acknowledgments.rst
ln -fs ../template/Makefile $TUTORIAL
cp -f template/Makefile $TUTORIAL
sed 's/AUTHOR/'"$AUTHOR"'/g' template/conf.py > $TUTORIAL/conf.py
sed -i 's/TITLE/'"$TITLE"'/g' $TUTORIAL/conf.py
sed 's/TITLE/'"$TITLE"'/g' template/index.rst > $TUTORIAL/index.rst
sed -i 's/REFERENCE/'"$REFERENCE"'/g' $TUTORIAL/index.rst
sed 's/TUTORIAL/'"$TUTORIAL"'/g' template/intro.rst > $TUTORIAL/intro.rst
echo
echo "Tutorial folders and files are prepared, see $TUTORIAL"