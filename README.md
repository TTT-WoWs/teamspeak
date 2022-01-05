# Prerequisites

- An account at [Hetzner Cloud](https://console.hetzner.cloud/)
- In Hetzner's Cloud Console:
  - A Project, or access to an existing project
  - Your SSH key added to said project
  - An API token created for said project (this is `HCLOUD_TOKEN` during execution)
    - **Save it somewhere!** I use [direnv](https://direnv.net) and have a `.envrc` with the token in the root of this project.
- [Python](https://www.python.org/downloads/)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
- [Terraform](https://www.terraform.io/downloads)
- A terminal
  - On Windows I recommend [Windows Terminal](https://docs.microsoft.com/en-gb/windows/terminal/), although the default PowerShell should suffice
  - On Linux or Mac I assume you more or less know what you are doing.

# Steps

1. Create the `HCLOUD_TOKEN` variable
   - `export HCLOUD_TOKEN=<your_token>` on Linux/Mac, or
   - `Set-Variable -Name "HCLOUD_TOKEN" -Value "<your_token>"` on Windows with PowerShell
1. `cd terraform`
1. `terraform init` (or `terraform init -upgrade` for updating modules)
1. `terraform apply`, then type 'yes' (aka: follow instructions)
1. `cd ..`, then `cd ansible`
1. `python -m pip install --user -r requirements.txt` or (preferred) use `pipenv`/`virtualenv`
1. `ansible-galaxy install -r requirements.yaml`
1. `ansible-playbook update.yaml`
1. `ansible-playbook play.yaml`
1. Done!

