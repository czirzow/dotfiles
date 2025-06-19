
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

note:
   . bootstrap.yml:
     make it do just the things always wanted done on all hosts.
         ie: atp/dnf update.

TODO:
==
   . Evaluate my standard configs.
      . add all the rest of the .* files to repo
      . add other stuff not listed.

