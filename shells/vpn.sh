wget https://github.com/Timac/VPNStatus/releases/latest/download/vpnutil.zip
unzip vpnutil.zip
sudo mv vpnutil /usr/local/bin/
rm -f vpnutil
vpnutil list
echo "Enter one of the VPN name in above list:"
read vpnname
echo "You select: $vpnname"

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
    echo "alias vpnstart='vpnutil start \"$vpnname\"'" >> $HOME/.zshrc
    echo "alias vpnstop='vpnutil stop \"$vpnname\"'" >> $HOME/.zshrc
    source $HOME/.zshrc
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
   echo "alias vpnstart='vpnutil start \"$vpnname\"'" >> $HOME/.bash_profile
    echo "alias vpnstop='vpnutil stop \"$vpnname\"'" >> $HOME/.bash_profile
    source $HOME/.bash_profile
fi

echo "Type vpnstart or vpnstop to use vpn..."