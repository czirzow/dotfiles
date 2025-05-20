
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
git clone dotfiles
'''

pip shouldn't be installed by default but if it is double check what version of python you have to ensure that is the correctp

'''
sudo apt install pip
pip install ansible
''

Add to ~/.bash_alias
export PATH="$PATH:/home/czirzow/.local/bin"
'''

'''
cd dotfiles
ansible-playbook bootstrap.yml
'''


