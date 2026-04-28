# toolbox-ide

This repository contains my personal development environment setup, primarily designed for [Fedora Silverblue](https://fedoraproject.org/silverblue/) using [Toolbox](https://github.com/containers/toolbox).

## Installation

It is recommended to run this setup within a new `registry.fedoraproject.org/fedora-toolbox:latest` toolbox container:

```bash
toolbox create --image registry.fedoraproject.org/fedora-toolbox:latest toolbox-ide
toolbox enter toolbox-ide
```

Once inside the toolbox, run the setup script:

```bash
sudo ./setup.sh
```
