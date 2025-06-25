#tmux plugins 
#mkdir -p .tmux/plugins
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'jaclu/tmux-menus'
# NOTE: need to cmake && make && make install this tool after 
#       plugin is installed
set -g @plugin 'thewtex/tmux-mem-cpu-load'

# INSTALL:
# see: https://github.com/tmux-plugins/tpm
#   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# press prefix+I to install plugins
run '~/.tmux/plugins/tpm/tpm'

