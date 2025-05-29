#!/bin/bash

# Function to detect OS
detect_os() {
    case "$(uname -s)" in
        Linux*)     echo "unix";;
        Darwin*)    echo "unix";;
        MINGW*)     echo "windows";;
        MSYS*)      echo "windows";;
        CYGWIN*)    echo "windows";;
        *)          echo "unknown";;
    esac
}

# Function to setup Vim
setup_vim() {
    local os=$1
    if [ "$os" = "unix" ]; then
        echo "Setting up Vim for Unix-like system (Linux/Mac)..."
        # Backup existing config if it exists
        if [ -d ~/.vim ]; then
            mv ~/.vim ~/.vim.backup
            echo "Backed up existing ~/.vim to ~/.vim.backup"
        fi
        if [ -f ~/.vimrc ]; then
            mv ~/.vimrc ~/.vimrc.backup
            echo "Backed up existing ~/.vimrc to ~/.vimrc.backup"
        fi

        # Copy new config
        cp -r vim ~/.vim
        echo "copied vim folder to ~/.vim"
        cp vimrc ~/.vimrc
        echo "copied vimrc to ~/.vimrc"
    else
        echo "Setting up Vim for Windows..."
        # Backup existing config if it exists
        if [ -d ~/vimfiles ]; then
            mv ~/vimfiles ~/vimfiles.backup
            echo "Backed up existing vimfiles to vimfiles.backup"
        fi
        if [ -f ~/.vimrc ]; then
            mv ~/.vimrc ~/.vimrc.backup
            echo "Backed up existing .vimrc to .vimrc.backup"
        fi

        # Copy new config
        cp -r vim ~/vimfiles
        cp vimrc ~/.vimrc
        echo "copied vim folder to ~/vimfiles and vimrc to ~/.vimrc"
    fi
}

# Main script
echo "Starting Vim setup..."

# Detect OS
OS=$(detect_os)
if [ "$OS" = "unknown" ]; then
    echo "Unsupported operating system"
    exit 1
fi

# Setup Vim
setup_vim "$OS"

echo "Vim setup completed successfully!" 