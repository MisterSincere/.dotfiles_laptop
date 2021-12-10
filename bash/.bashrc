# color the prompt
force_color_prompt=yes

# default variant from arch linux i guess
DEFAULT='[\u@\h \W]\$ '

# u@h:W $
PROMPT1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W \[\033[00m\]\$ '

# u:W $
PROMPT2='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W \[\033[00m\]\$ '

# u:w $
PROMPT3='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]\$ '

# u@h W$
PROMPT4='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W\[\033[0m\]\$ '

PS1=$PROMPT4


# aliases
alias ls="ls --color"
alias la="ls -a"
alias ll="ls -al"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias cg="bash ~/programming/cg_helper_script.sh"
