#!/bin/bash

if [ -f "hi.txt" ]; then
    cat hi.txt
else
    echo "hi.txt file not found!"
fi

echo -e "\n🔍 Searching for connected devices via KDE Connect..."
kdeconnect-cli -l

echo -e "\n⚙️ Installing mobile indicator script..."
mkdir -p ~/.local/bin
cp mobile.sh ~/.local/bin/mobile
chmod +x ~/.local/bin/mobile

echo -e "\n✅ Installation completed successfully!"
echo "Please check README.md to configure Waybar."
echo "Running test output:"
~/.local/bin/mobile
echo