#!/bin/bash

sudo apt update
if ! command -v zsh &> /dev/null; then
	sudo apt install -y zsh
else
	echo "ZSH Exists, Cloning OhMyZSH"
fi