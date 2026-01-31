# ![](https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/32x32/apps/distributor-logo-madlinux.svg) [Linux RDX](https://github.com/rauldipeas/linux-rdx)

This is my personal build of the [**Linux kernel**](https://kernel.org), using the [**Debian**](https://salsa.debian.org/kernel-team/linux/-/blob/debian/latest/debian/config/amd64/config) configuration file and some fixes specific to my hardware that have not yet been incorporated into the main source code.

## Download:

[![linux-rdx](https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps/tux.svg "Linux RDX")![](https://img.shields.io/github/actions/workflow/status/rauldipeas/linux-rdx/linux-rdx.yml?branch=main&logo=GitHub&label=Linux%20RDX&style=for-the-badge "Linux RDX")](https://nightly.link/rauldipeas/linux-rdx/workflows/linux-rdx/main/linux-rdx.zip)


## APT repository

```bash
curl -sSL https://apt.rauldipeas.com.br/gpg.key | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/rauldipeas.gpg
cat <<EOF |sudo tee /etc/apt/sources.list.d/rauldipeas.sources>/dev/null
X-Repolib-Name: Raul Dipeas APT repository
Enabled: yes
Types: deb
URIs: https://apt.rauldipeas.com.br
Suites: /
Signed-By: /etc/apt/trusted.gpg.d/rauldipeas.gpg
EOF
sudo apt update
sudo apt install linux-rdx
```