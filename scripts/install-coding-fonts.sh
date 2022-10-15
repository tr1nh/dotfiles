
INSTALL_FOLDER=install-font

mkdir $INSTALL_FOLDER 
cd $INSTALL_FOLDER
echo "created $PWD/$INSTALL_FOLDER/"

if [ ! -d ~/.local/share/fonts ];then
  mkdir -p ~/.local/share/fonts
  echo "created ~/.local/share/fonts"
fi

curl -L https://fonts.google.com/download?family=Roboto%20Mono -o roboto-mono.zip
7z x roboto-mono.zip -o"$HOME/.local/share/fonts/Roboto-Mono"
echo "download font roboto mono"

curl -L https://fonts.google.com/download?family=Roboto -o roboto.zip
7z x roboto.zip -o"$HOME/.local/share/fonts/Roboto"
echo "download font roboto"

curl -L https://fonts.google.com/download?family=JetBrains%20Mono -o jet-brains.zip
7z x jet-brains.zip -o"$HOME/.local/share/fonts/JetBrains-Mono"
echo "download font jetbrains mono"

curl -L https://github.com/pensnarik/consolas-font/archive/master.zip -o consolas.zip
7z x consolas.zip -o"$HOME/.local/share/fonts/Consolas"
echo "download font consolas"

cd ..

_clean() {
  if [ -d "$PWD/$INSTALL_FOLDER" ]; then
    rm -rf "$PWD/$INSTALL_FOLDER"
    echo "cleaned"
  fi
}

trap _clean EXIT

