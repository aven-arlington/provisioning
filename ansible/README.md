# Ansible

## Ubuntu

1. Install Ubuntu 24.04 LTS from a USB Boot drive. Optionally use the autoinstall feature to have SSH ready to go etc.
1. Clear out the `known_hosts` file so that a new connection can be made to the freshly installed instance.
1. Run the Ubuntu playbook from WSL-Ubuntu24.04. 

    ```bash
    cd repos/.../provisioning/ansible
    ansible-playbook ./playbooks/ubuntu24.yaml --ask-become-pass -i ./inventory

    # with verbose option
    ansible-playbook ./playbooks/ubuntu24.yaml --ask-become-pass -v(v)(v) -i ./inventory
    ```
