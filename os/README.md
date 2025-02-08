# OS Setup

## Ubuntu 24.04 LTS with Auto-install

This documentation is meant to help guide a complete custom Ubuntu 24.04 installation with auto-install.
It will mostly install Ubuntu with defaults and then run a setup script during the "late-commands" stage.

### Auto-install

1. Create a USB boot disk [specifically with Rufus](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview). The recommended Balena Etcher method didn't work for me the first time.
1. Eject and insert the USB boot disk back into the Windows machine to open it up in explorer.
1. Copy the `autoinstall.yaml` file into the root directory, as a sibling to `autorun.ico`
1. Eject the USB boot disk and install Ubuntu on the target machine.

The auto-install will create an post-installation script to perform additional configuration and enable 2FA with Yubico FIDO keys.

### Post auto-install:

Instructions for executing the post-installation script can be displayed with the command `sudo run-parts /etc/update-motd.d/` and copied directly from the terminal.

- #### Yubiko Keys

  With the primary key inserted, execute `pamu2fcfg | tee -a ~/.config/u2f_keys`.
  It will then prompt for the key's passphrase and confirmation with a touch.

  Next repeat the process with a backup key but make sure to use the `-n` flag to append... `pamu2fcfg -n | tee -a ~/.config/u2f_keys`

- #### GitHub

  Copy ssh keys with scp OR [create a new one](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account?platform=linux&tool=webui) and verify functioning access with `ssh -T git@github.com`.
  If `Permission denied (publickey)` occurs, make sure the agent is started and the key has been added with `eval $(ssh-agent)` and `ssh-add private-key-name`.

  ```bash
  chmod 600 key_name.pub
  chmod 600 key_name
  eval `ssh-agent -s`
  ssh-add key_name
  ```

- #### Execute

  Execute the post-install script with `sudo /etc/post_install.sh`

[Additional information on auto-install can be found here.](https://canonical-subiquity.readthedocs-hosted.com/en/latest/intro-to-autoinstall.html)

[Additional information about securing Linux login with Yubikey and FIDO can be found here](https://support.yubico.com/hc/en-us/articles/360016649099-Ubuntu-Linux-Login-Guide-U2F)
