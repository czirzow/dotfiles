
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
    # user managment

    -- hosts: all
      become: true
      tasks:

    # Only in bootstrap.yml
      - name: create simone user
        tags: always
        usesr: simone
        groups: root

      - name: add ssh key for simone
        tags: always
        authorized_key:
          user: simone
          # ~/.ssh/simone.ansible.pub
          key: "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHHan3MHYkfw7j9uvjuvUGZ73ixlZMCPX0AOy/6f+hf7 simone@ansible"

       - name: add suders file for simone
         tags: always
         copy: 
           src: suder_simone
           dest: /etc/sudusers.d/simone
           owner: root
           owner: root
           mode: 0440
    #/ Only in bootstrap.yml

    # create ansible.cfg
    [defaults]
    inventory = inventory
    private_key_file = ~/.ssh/simone.ansible
    remote_user = simone

    # bootstrap.yml
    # add requirements for setup in bootstrap.yml
    # make a site.yml

  ## video14
  # create roles with site.yml
    # dir structure:
    # hostgroup/roles/host_type/
               /roles/host_type/tasks/
               /roles/host_type/tasks/main.yml
               /roles/host_type/files/
               /ansible.cfg
                ...
    # roles/tasks/main.yml

  ## video15
  # Host Variables
     mkdir host_vars
     cat inventory

     host_vara/IP_ADDRESS-1.yml:
     # centos
     apache_package_name: apache2
     pache_service: apache2
     php_package_name: livapache2-php-mod

     host_vars/IP_ADDRESS-2.yml
     # ubuntu
     apache_service: httpd
     apache_service: apache
     php_package_name: php

  # Handler
  # if a change is happened.
    # notify: restart_apache

  ## video16
  # Templates
    # Setting up roles/base/templates
    # cp file /etc/sshd_config roles/base/templates/sshd_config_ubuntu.j2
    # add: 
    #
    #     AllowUsers {{ ssh_users }}
    #
    #  in hosts_vars/IP_address.yml
    #
    # add variable:
    #
    #     ssh_users:"simone"
    #     ssh_config_file: sshd_config_ubuntu.j2
    #


    
    






    
  



 
 



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


