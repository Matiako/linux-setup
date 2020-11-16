# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/Apps/zsh-config-files/zshconfig/history
setopt SHARE_HISTORY
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		
# Include hidden files.
# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/Apps/zsh-config-files/zshconfig/shortcutrc" ] && source "$HOME/Apps/zsh-config-files/zshconfig/shortcutrc"
[ -f "$HOME/Apps/zsh-config-files/zshconfig/aliasrc" ] && source "$HOME/Apps/zsh-config-files/zshconfig/aliasrc"


#change catalog without cd
setopt auto_cd

#Load autocomplete
source ~/Apps/zsh-config-files/zshplugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

#Load autosugestions
source ~/Apps/zsh-config-files/zshplugins/zsh-autosugestions/zsh-autosugestions.zsh

# Load zsh-syntax-highlighting; should be last.
source ~/Apps/zsh-config-files/zshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

#od krzyska

# export MAVEN_OPTS_HOTSPOT="-Xnoclassgc -Xms1g -Xmx2g -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+UseParallelGC -Xverify:none -Xshare:on"

# jdk_11_hotspot() {
	export JAVA_HOME=/home/vagrant/Apps/jdks/hotspot/oracle-java-11/jdk-11.0.8
	export PATH="$JAVA_HOME/bin:$PATH"
	# export MAVEN_OPTS="$MAVEN_OPTS_HOTSPOT"
# }

# jdk_11_hotspot

# export MAVEN_OPTS_OPENJ9="-Xquickstart -Xshareclasses:name=mvn -DargLine=-Xquickstart -Xverify:none"

# jdk_11_openj9() {
# 	export JAVA_HOME=/home/vagrant/Apps/jdks/openj9/adaptopenjdk/jdk-11.0.7+10
# 	export PATH="$JAVA_HOME/bin:$PATH"
# 	export MAVEN_OPTS="$MAVEN_OPTS_OPENJ9"
# }


export M2_HOME=/home/vagrant/Apps/maven/apache-maven-3.6.3
export MAVEN_HOME=/home/vagrant/Apps/maven/apache-maven-3.6.3
export PATH="$M2_HOME/bin:$PATH"

export PAYARA_MICRO_HOME=/home/vagrant/Apps/payara-micro

export DOCKER_GATEWAY_HOST=172.17.0.export DOCKER_GATEWAY_HOST=172.17.0.11


# export MAVEN_OPTS_HOTSPOT="-Xnoclassgc -Xms1g -Xmx2g -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+UseParallelGC -Xverify:none -Xshare:on"
