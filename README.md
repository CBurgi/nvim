# nvim extra installation steps

# Installing neovim
1. Enter following lines into command line
    - `curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz`
    - `sudo rm -rf /opt/nvim`
    - `sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz`
    - `rm nvim-linux-x86_64.tar.gz`
2. Open .bashrc (usually in ~/.bashrc)
3. Add following line to put in path
    - `export PATH="$PATH:/opt/nvim-linux-x86_64/bin"`

## Nerd Font (wsl)
1. Export font file from resources into 'C:\Windows\Fonts'
2. In terminal, hit Ctrl+, to get to terminal settings
3. Find desired profile, then go to Appearance
4. Change font to 'CaskaydiaMono Nerd Font'

## Ripgrep (for file searching)
1. In command line enter `sudo apt install ripgrep`

## Config location
1. cd into `~/.config`
2. git clone

# Installing languages
## Node.js and npm
1. enter the following into command line
   - `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash`
   - `nvm install node`

# First run
1. Many errors may appear
2. Run `:Lazy update`
3. Run `:TSInstall all`
