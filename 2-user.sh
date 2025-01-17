#!/usr/bin/env bash
#-----------------------------------------------------------
#██████╗ ██████╗ ██╗   ██╗██╗██╗  ██╗██╗███╗   ██╗ ██████╗
#██╔══██╗██╔══██╗██║   ██║██║██║ ██╔╝██║████╗  ██║██╔════╝
#██████╔╝██████╔╝██║   ██║██║█████╔╝ ██║██╔██╗ ██║██║  ███╗
#██╔══██╗██╔══██╗╚██╗ ██╔╝██║██╔═██╗ ██║██║╚██╗██║██║   ██║
#██║  ██║██████╔╝ ╚████╔╝ ██║██║  ██╗██║██║ ╚████║╚██████╔╝
#╚═╝  ╚═╝╚═════╝   ╚═══╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝
#-----------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~
touch "$HOME/.cache/zshhistory"
git clone "https://github.com/ChrisTitusTech/zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
ln -s "$HOME/zsh/.zshrc" $HOME/.zshrc

PKGS=(
'autojump'
'awesome-terminal-fonts'
'brave-bin' # Brave Browser
'dxvk-bin' # DXVK DirectX to Vulkan
'github-desktop-bin' # Github Desktop sync
'lightly-git'
'lightlyshaders-git'
'mangohud' # Gaming FPS Counter
'mangohud-common'
'nerd-fonts-fira-code'
'nordic-darker-standard-buttons-theme'
'nordic-darker-theme'
'nordic-kde-git'
'nordic-theme'
'noto-fonts-emoji'
'papirus-icon-theme'
'plasma-pa'
'ocs-url' # install packages from websites
'sddm-nordic-theme-git'
'snapper-gui-git'
'ttf-droid'
'ttf-hack'
'ttf-meslo' # Nerdfont package
'ttf-roboto'
'zoom' # video conferences
'snap-pac'
'timeshift' # A system restore utility for Linux
'timeshift-autosnap' # Timeshift auto-snapshot script which runs before package upgrade using Pacman hook.
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

export PATH=$PATH:~/.local/bin
cp -r $HOME/ArchViking/dotfiles/* $HOME/.config/
pip install konsave
konsave -i $HOME/ArchViking/kde.knsv
sleep 1
konsave -a kde

echo -e "\nDone!\n"
exit
