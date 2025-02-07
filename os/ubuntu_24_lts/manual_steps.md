# Manual Steps

This documentation is meant to help guide a complete custom Ubuntu 24.04 installation with Autoinstall.
It will mostly install Ubuntu with defaults and then run a setup script during the "late-commands" stage.

[Additional information on autoinstall can be found here.](https://canonical-subiquity.readthedocs-hosted.com/en/latest/intro-to-autoinstall.html)

The autoinstall will create an executable post-install script to perform additional configuration.
That script requires that that GitHub is configured to allow SSH access AND that the Yubico FIDO keys are setup.

### GitGub Setup

Copy an SSH key from working a machine. This should be relatively easy if SSH was properly setup in the autoinstall.yaml. If SSH access isn't setup, that will need to be handled first.

```
scp .\key_name username@hostname:~\.ssh
scp .\key_name.pub username@hostname:~\.ssh
```

Update permission levels, start agent, and add the key

```
chmod 600 key_name.pub
chmod 600 key_name
eval `ssh-agent -s`
ssh-add key_name
```

[Or create a new SSH key and add it to GitHub.](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account?platform=linux&tool=webui)

### Yubikey Setup

[Additional information about securing Linux login with Yubikey and FIDO can be found here](https://support.yubico.com/hc/en-us/articles/360016649099-Ubuntu-Linux-Login-Guide-U2F)

- With key inserted, run `pamu2fcfg | tee -a ~/.config/u2f_keys`
- Repeat for backup key(s) with the append flag set `pamu2fcfg -n | tee -a ~/.config/u2f_keys`


### Run "post_install"
Execute the post-install script with `sudo /etc/post_install.sh`