
TODO:
==
   . add all the rest of the .* files to repo
   . version the tree main, old-config
   . add other stuff not listed.
   . apps for mac, ?
   . rename repo to myAnsible


TASKS:
----
configuring a ansible network for booting up

   . openssh
     . connect to each vm from the ansible server.
     . ssh-keygen -type Ed25519 on each vm.
     . ssh-copy-id [the generated key] server
     . create a ansible-key.
     . ssh-copy-id ansible-key to server
     . eval $(ssh-agent) to run the ssh agent for passphrase management.

   . apt install ansible
   . create 'inventory file', a list of ip addresses
   . ping all the servers in inventory file.
   . create a ansible.cfg file:
       '''
         [defaults]
         inventory = inventory
         priveate_key_file = ~/.ssh/ansible
       '''
    . */etc/ansible

   . condense playbooks
     . use variables.
   . running on specific hosts:
     the inventory file:
       . is an ini file:
         '''
         [web_servers]
         ip-address1
         ip-address2
         [db servers]
         ip-address3

      playbook:
        hosts: [web_servers]

  ## video11
   #add tags
     #tag: group_name,host_type,package_name,server_type
     # ie.,
     #   myblog,db,mariadb,ubuntu
     #   myblog,web,apache,fedora

     # make a host file that is added to server
     #files/etc/host -> hostgroup:/etc/hosts
     - name: copy file
       tags: grp1,db,mariadb,httpd
       copy:
         src: etc/hosts
         dest: /etc/hosts
         owner: root
         group: root
         mode: 0644

    #
    # Look into terraform
    # setting up a server farm?
       
   ## video12
    # ensure that centos has httpd enabled and started.
    -name: start httpd (CentOS)
      tags: grp2,web,httpd,centos
      service:
        name: httpd
        state: started
        enabled: yes
    when: ansible_distribution == "CentOS"

    ## video13



website referenc

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


