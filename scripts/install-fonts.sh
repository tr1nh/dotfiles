cd /tmp/

mkdir install
cd install

if [ ! -d ~/.local/share/fonts ];then
  mkdir -p ~/.local/share/fonts
fi

curl -L https://fonts.google.com/download?family=Roboto%20Mono -o roboto-mono.zip
7z x roboto-mono.zip -o"$HOME/.local/share/fonts/Roboto-Mono"

curl -L https://fonts.google.com/download?family=Roboto -o roboto.zip
7z x roboto.zip -o"$HOME/.local/share/fonts/Roboto"

curl -L https://fonts.google.com/download?family=JetBrains%20Mono -o jet-brains.zip
7z x jet-brains.zip -o"$HOME/.local/share/fonts/JetBrains-Mono"

curl -L https://github.com/pensnarik/consolas-font/archive/master.zip -o consolas.zip
7z x consolas.zip -o"$HOME/.local/share/fonts/Consolas"

