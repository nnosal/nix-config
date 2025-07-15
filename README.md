# Nix Config Mac 
> Inspired from: ironicbadger/nix-config : Repo contains configuration for personal machines, mostly running nix-darwin. I have no idea what I'm doing, and the deeper I go the less of a clue I have apparently.

Test de configuration de mac via nix manager.

```bash
# Prepare
xcode-select --install && cd /tmp && git clone https://github.com/nnosal/nix-config && cd $_
#softwareupdate --install-rosetta
# Build
nix-config % nix --extra-experimental-features 'nix-command flakes'  build ".#darwinConfigurations.mbavm1.system"
# Run terraforming machine
sudo ./result/sw/bin/darwin-rebuild switch --flake ".#mbavm1"
```

## 💻 Machines

| Hostname | Model                  | Storage (Ram/HD) | Cores (CPU/GPU) |
|----------|------------------------|------------------|-----------------|
| `mbavm1` | Macbook Air M3 (VM1)   | 4GB / 100GB      | - / -           |

> Dans le dossier tools, vous trouverez des scripts supplémentaires pour vous aider à configurer votre machine.

```shell
# Set machine name... to one of the [names above](#machines)
chmod +x set_mac_name.sh && ./set_mac_name.sh
# Set user name... to one of the [names above](#machines)
chmod +x set_user_name.sh && ./set_user_name.sh
# See apps unmanaged by nix
chmod +x list_unmanaged_apps.sh && ./list_unmanaged_apps.sh
```

## 🔧 Troubleshoot

- `zsh compinit: insecure directories and files, run compaudit for list.
Ignore insecure directories and files and continue [y] or abort compinit [n]?` => `compaudit | xargs "sudo chown $(whoami) && sudo chmod go-w"`