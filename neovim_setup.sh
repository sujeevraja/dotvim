#!/bin/zsh

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

# Function to setup Neovim
setup_neovim() {
    local os=$1
    if [ "$os" = "unix" ]; then
        echo "Setting up Neovim for Unix-like system (Linux/Mac)..."
        
        # Backup existing config if it exists
        if [ -d ~/.config/nvim ]; then
            mv ~/.config/nvim ~/.config/nvim.backup
            echo "Backed up existing ~/.config/nvim to ~/.config/nvim.backup"
        fi

        # Create config directory
        mkdir -p ~/.config/nvim
        cp init.vim ~/.config/nvim/
        echo "copied init.vim to ~/.config/nvim/"
        
        # Create package directories
        mkdir -p ~/.local/share/nvim/site/pack/plugins/start
        mkdir -p ~/.local/share/nvim/site/pack/plugins/opt
        
        # Copy plugins to start directory (loaded automatically)
        echo "Installing plugins..."
        for plugin in vim/bundle/*; do
            if [ -d "$plugin" ]; then
                plugin_name=$(basename "$plugin")
                echo "Installing $plugin_name..."
                cp -r "$plugin" ~/.local/share/nvim/site/pack/plugins/start/
            fi
        done
        echo "Plugins installed successfully"
    else
        echo "Setting up Neovim for Windows..."
        
        # Backup existing config if it exists
        if [ -d ~/AppData/Local/nvim ]; then
            mv ~/AppData/Local/nvim ~/AppData/Local/nvim.backup
            echo "Backed up existing nvim config to nvim.backup"
        fi

        # Create config directory
        mkdir -p ~/AppData/Local/nvim
        cp init.vim ~/AppData/Local/nvim/
        echo "copied init.vim to ~/AppData/Local/nvim/"
        
        # Create package directories
        mkdir -p ~/AppData/Local/nvim-data/site/pack/plugins/start
        mkdir -p ~/AppData/Local/nvim-data/site/pack/plugins/opt
        
        # Copy plugins to start directory (loaded automatically)
        echo "Installing plugins..."
        for plugin in vim/bundle/*; do
            if [ -d "$plugin" ]; then
                plugin_name=$(basename "$plugin")
                echo "Installing $plugin_name..."
                cp -r "$plugin" ~/AppData/Local/nvim-data/site/pack/plugins/start/
            fi
        done
        echo "Plugins installed successfully"
    fi
}

# Main script
echo "Starting Neovim setup..."

# Detect OS
OS=$(detect_os)
if [ "$OS" = "unknown" ]; then
    echo "Unsupported operating system"
    exit 1
fi

# Setup Neovim
setup_neovim "$OS"

echo "Neovim setup completed successfully!" 