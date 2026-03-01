#!/bin/bash


chmod +x mobile.sh


mkdir -p ~/.local/bin
cp mobile.sh ~/.local/bin/


cd ~/.local/bin || exit


mv -f mobile.sh mobile
chmod +x mobile

echo
echo "Installation completed successfully."
echo "Running mobile script now..."
echo

exec ~/.local/bin/mobile
