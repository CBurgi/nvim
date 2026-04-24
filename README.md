# nvim extra installation steps
**This guide assumes a debian/ubuntu environmentz**

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

## Fix cliboard
1. run `vim --version | grep clipboard` to see if version has clipboard access
   a. if you see '+clipboard', you're good
   b. if you see '-clipboard':
      - run `sudo apt install vim-gtk3` to install a version with clipboard access
      - run `sudo apt install wl-clipboard` to install the Wayland clipboard tool that nvim can use
   

# Installing languages
## Node.js and npm
1. enter the following into command line
   - `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash`
   - `nvm install node`
  
## Python and pip
1. check python version with `python3 --version`
   a. if not there, run `sudo apt install python3`
2. run `sudo apt install python3-venv python3-pip`

# First run
1. Many errors may appear
2. Run `:Lazy update`
3. Run `:TSInstall all`
