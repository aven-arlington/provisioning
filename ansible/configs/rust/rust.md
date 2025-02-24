# Rust, Rustup, and Cargo configurations
## Shell Completions for Rustup
The following are generated from the `rustup completions` command output.

```cmd
rustup completions bash rustup >> /tmp/rustup
rustup completions bash cargo >> /tmp/cargo
sudo cp /tmp/rustup /etc/bash_completion.d/rustup
sudo cp /tmp/cargo /etc/bash_completion.d/cargo
```
