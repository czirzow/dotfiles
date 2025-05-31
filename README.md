
TODO:
==
   . add all the rest of the .* files to repo
   . version the tree main, old-config
   . add other stuff not listed.
   . apps for mac, ?



website reference

  https://phelipetls.github.io/posts/introduction-to-ansible/


Intro
==



Installation
==


'''
git clone https://github.com/czirzow/dotfiles.git
cd dotfiles
git checkout add-ansible
'''

pip shouldn't be installed by default but if it is double check what version of python you have to ensure that is the correctp


'''
install_app=dnf
sudo $(install_app) -y install pip
sudo $(install_app) -y install python3-libdnf5
pip install ansible
''

Add to ~/.bash_alias
'''
echo export PATH="$PATH:/home/czirzow/.local/bin" > ~/.bash_alias
'''

'''
cd dotfiles
ansible-playbook bootstrap.yml
'''


