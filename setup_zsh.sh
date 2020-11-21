#!/bin/bash
apt-get update
apt-get install -y zsh
chsh -s $(which zsh)
