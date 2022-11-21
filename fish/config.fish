..
######## Aliases ########

# Basics
alias c "clear"
alias . "cd"
alias .. "cd ../"
alias ... "cd ../../"

# Permissions
alias givePerm "sudo chmod -R ugo+rwx"

# Listing
alias ll "exa -l -g --icons"
alias l "exa -g --icons"
alias la "l  -a"
alias lla "ll  -a"

# List only folders
alias ld "l -d */"
alias lld "ll -d */"

# List only files
alias lf "ls -p | grep -v /"

# Tree view
alias lt "l --tree --level=1"
alias ltt "l --tree --level=2"
alias lttt "l --tree --level=3"
alias lt4 "l --tree --level=4"
alias lta "l --tree --level=1 -a"

# Filter dot files
alias dot "l -d .*"
alias dott "l -d .* --tree --level=2"

# Filter by extensions
alias js "lt *.js"
alias json "lt *.json"
alias html "lt *.html"
alias css "lt *.css"
alias md "lt *.md"
alias php "lt *.php"
alias jpg "lt *.jpg"

# Filter files by name.
alias flt "ls | grep"

# Search commands history
alias sh "history"
alias shg "history | grep"

# Pacman commands
alias sp "sudo pacman -S"
alias spu "sudo pacman -Syu"
alias spd "sudo pacman -Rncs"

# npm
# alias npm "sudo npm"

# vim/nvim
alias v "vim"
# alias nv "~/.config/squashfs-root/usr/bin/nvim"
alias nv "nvim"
alias lunarconf "cd .local/share/lunarvim/lvim"
alias lv "lvim"

# Sound input/output
alias pavu "pavucontrol"

# Destinations
alias conf "cd ~/.config"
alias fishconf "nvim ~/.config/fish/config.fish"
alias i3conf "nvim ~/.config/i3/config"
alias picomconf "nvim ~/.config/picom/picom.conf" 
alias alacrittyconf "nvim ~/.config/alacritty/alacritty.yml"

# Folder handling
alias del "rm -rf"
alias sdel "sudo rm -rf"
alias size "du -sh"

# Git
alias gch "git checkout"
alias gmake "git checkout -b"
alias gc "git commit -m"
alias ga "git add ."
alias gmaster "git checkout master"
alias gp "git push -u origin master"

#XAMPP
alias panel "sudo /opt/lampp/manager-linux-x64.run"
alias mysql "sudo xampp startmysql"
alias apache "sudo xampp startapache"
alias mysqlstop "sudo xampp stopmysql"
alias apachestop "sudo xampp stopapache"

# Haruna
alias video "Haruna"

# CoreImage
alias img "coreimage"

# Switch keyboard layouts
alias aad "setxkbmap us -v dvorak & xmodmap ~/.Xmodmap"
alias aaq "setxkbmap us & xmodmap ~/.Xmodmap"


########################################

## --- Auto start --- ##
neofetch

## --- theme --- ##
#set -g theme_svn_prompt-enabled yes
#
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if status is-interactive
    # Commands to run in interactive sessions can go here
    cd $HOME
end

# pnpm
set -gx PNPM_HOME "/home/luis/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
