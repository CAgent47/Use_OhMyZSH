#!/bin/bash

packages=("zsh" "git" "curl")

for pkg in "${packages[@]}"; do
	if ! command -v $pkg &> /dev/null; then
		sudo dnf install -y -y $pkg
	else
		echo "[ Package Manager ]: there is $pkg"
	fi
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "OhMyZSH to be the default?"
read defaultShell
if [ $defaultShell == "y" ] || [ $defaultShell == "Y" ]; then
	chsh -s $(which zsh)
	echo $SHELL
else
	exit 0
fi
