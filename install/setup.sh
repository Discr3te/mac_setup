#!/usr/bin/env bash
sudo -v

if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew"

    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    echo 'export HOMEBREW_BUNDLE_FILE=~/.Brewfile' >>$HOME/.zprofile
else
    echo "Homebrew already installed"

    if ! grep -Fx 'eval "$(/opt/homebrew/bin/brew shellenv)"' $HOME/.zprofile &>/dev/null; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

echo "Checking for brew updates and ready to brew"
brew update && brew doctor

if ! command -v git &>/dev/null; then
    brew install git
fi

if [ ! -d $HOME/Personal ]; then
    mkdir $HOME/Personal
fi

git clone https://github.com/Discr3te/mac_setup.git $HOME/Personal

pushd $HOME/Personal/mac_setup
./run
popd
