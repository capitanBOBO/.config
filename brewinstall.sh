#! /bin/bash


function Goodbye {
	dialog --erase-on-exit --msgbox "Everytnig was installed!\nHave a gogd day!" 10 40
}


function InstallCasks {
	#Install casks from homebrew
	dialog --erase-on-exit --checklist "Select apps for install.\nUse Spacebar for selection." 20 80 30 \
		"goneovim" "Neovim GUI editor" 'off' \
		"macvim" "Vim GUI editor for Mac" 'off' \
		"alacritty" "GPU-accelerated terminal emulator" 'on' \
		"kitty" "GPU-based terminal emulator" 'on' \
		"iterm2" "Terminal emulator" 'on' \
		"brave-browser" "Chromium browser" 'on' \
		"firefox" "Fox browser" 'off' \
		"google-chrome" "La classique" 'off' \
		"qutebrowser" "Minimalistic browser for shorcut maniacs" 'off' \
		"qlmarkdown" "Terminal markdown reader" 'on' \
		"telegram" "Telegram app" 'on' \
		"libreoffice" "Free office" 'on' \
		"gimp" "Free photoshop" 'off' \
		"inkscape" "Vector graphics editor" 'off' \
		"visual-studio-code" "Open-source code editor" 'off' \
		"sublime-text" "Text editor for code" 'off' \
		"sublime-merge" "Git client" 'off' \
		"sourcetree" "GUI git client" 'off' \
		"gitkraken" "GUI git client" 'off' \
		"karabiner-elements" "Keyboard remap" 'on'\
		"copyq" "clipboard manager" 'on'\
		2> tempfile
	array=($(cat tempfile))
	for ((i = 0 ; i < ${#array[@]} ; i++)); do
		ShowInstallingMessage ${array[i]}
		brew install --cask ${array[i]}
	done
	rm tempfile
}

function ConfigureP10k {
	dialog --erase-on-exit --yesno "Configure p10k now?" 5 40
	response=$?
	if [[ "$response" == "0" ]]; then
		p10k configure
	fi
}

function FetchConfigs {
  #Fetch configs from repo
  ShowInstallingMessage "Fetching configs"
  [ -d "$HOME/.config" ] && mv "$HOME/.config" "$HOME/.config.bak"
  git clone git@github.com:capitanBOBO/.config.git $HOME/.config 

function InstallTools {
	dialog --erase-on-exit --checklist "Select tools for install.\nUse Spacebar for selection." 20 80 30 \
    "choose-gui" "Spotlight-like app launcher and not only..." 'on' \
		"neovim" "Vim editor" 'on' \
		"peco" "Filter tool" 'on' \
		"yank" "Terminal copy tool" 'on' \
		"htop" "Process viewer" 'off' \
		"btop" "Beter htop. Process viewer" 'on' \
		"vifm" "Vim-based file manager" 'on' \
    "midnight-commander" "Terminal-based file manager" 'off' \
		"tig" "TUI git client" 'off' \
    "lazygit" "TUI git client" 'on' \
		"exa" "Same as ls command" 'on' \
    "bat" "Better cat" 'on' \
		"ncdu" "Disc usage tool" 'off' \
		"koekeishiya/formulae/yabai" "Tile window manager" 'on' \
		"koekeishiya/formulae/skhd" "Hotkey tool" 'on' \
		2> tempfile
	array=($(cat tempfile))
	for ((i = 0 ; i < ${#array[@]} ; i++)); do
		ShowInstallingMessage ${array[i]}
		brew install ${array[i]}
	done
	rm tempfile
}

function InstallAll {
	#OhMyZsh
	ShowInstallingMessage "OnMyZsh"
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ehco "Copy .zshrc..."
  cp $HOME/.zshrc $HOME/.zshrc.bak
  echo "source $HOME/.config/zsh/zshrc" > $HOME/.zshrc
	#OhMyZsh prompt
	ShowInstallingMessage "powerlevel10k"
	brew install romkatv/powerlevel10k/powerlevel10k
	echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> $HOME/.config/zsh/zshrc
	ShowInstallingMessage "zsh-autosuggestions"
	brew install zsh-autosuggestions
	InstallCasks
	InstallTools
	ConfigureP10k
	Goodbye
}

function Warning {
	dialog --erase-on-exit --title "Warning" --msgbox "You password may be required!" 5 40
	InstallAll
}

function StartDialog {
	dialog --erase-on-exit --yesno "This script will install all required apps.\nFor apps list check brewinstall.sh\n\nContinue?" 10 35
	response=$?
	case $response in
		0) Warning;;
		1) echo "Whyyyy?!";;
		255) echo "So rude...";;
	esac
}

function Init {
	#Homebrew
	ShowInstallingMessage "Homebrew"
  if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is installed"
  else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
	#Shell dialog box
	ShowInstallingMessage "dialog"
	brew install dialog
}

function ShowInstallingMessage {
	echo "
	==> Installing $1 
	"
}

Init &&
StartDialog
