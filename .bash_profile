# Bourne Again Shell Profile
# Jonas Gorauskas - 2007-03-17 22:38:46
# Modified: 2014-04-27 22:37:36

PATH=$PATH:/usr/sbin/
BASH_ENV=$HOME/.bashrc

export BASH_ENV PATH
#unset USERNAME

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# export SSH_ENV="$HOME/.ssh/environment"

# function start_agent () {
#     echo "Initializing new SSH agent..."
#     /usr/bin/ssh-agent -s | sed 's/^echo/#echo/' > "${SSH_ENV}"
#     echo "Agent running!"
#     chmod 600 "${SSH_ENV}"
#     . "${SSH_ENV}" > /dev/null
#     /usr/bin/ssh-add;
# }

# Source SSH Settings if applicable
# if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#         start_agent;
#     }
# else
#     start_agent;
# fi

#EOF
