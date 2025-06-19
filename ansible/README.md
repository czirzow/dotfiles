
Configurations for my Network.


Structure for dirs:
==

      host-ansible/   # configuration for an ansible server
         bootstrap.yml
         inventory
         host_vars/
         roles/
      host-workbox/   # configuration for a box i work on.
         bootstrap.yml
         inventory
         host_vars/
         roles/

*note:* bootstrap.yml:
     make it do just the things always wanted done on all hosts.

     ie: ensure apt/dnf is up to date*

