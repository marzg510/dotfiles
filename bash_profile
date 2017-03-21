# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# aws cli completion
AWSCOMP=`which aws_completer`
[ "${AWSCOMP}" != "" ] && complete -C ${AWSCOMP} aws

