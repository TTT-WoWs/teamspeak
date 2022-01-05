# Preface

This repository is for easily running and managing an affordable TeamSpeak server on Hetzner Cloud.

Made for the World of Warships clan Tora Tora Tora! for fun and science.

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
1. `python -m pip install --user -r requirements.txt` or (preferred) use a `pipenv`/`virtualenv` and `pip install -r requirements.txt` directly
1. `ansible-galaxy install -r requirements.yaml`
1. `ansible-playbook update.yaml`, it is possible you have to type "yes" here
1. `ansible-playbook play.yaml`
1. Done!

# Other

## Troubleshooting

### Failed to connect to the host via ssh

In the case of the following error:

`Failed to connect to the host via ssh: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\r\n@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!`

Either

a) someone has probably gained access to the server, in which case, call in some help! Unless you're a Linux admin, in which case I trust your judgement.
b) you just did a re-deploy and the cloud provider has given the new machine the same IP address, in which case you can safely proceed with the following:

You must first find the IP address of the host:

`ansible-inventory --host teamspeak`

Then run `ssh-keygen -R <ip-address>`. After this, you can retry whatever you were doing.

## Removing

You can safely remove the VM without immediately losing data:

```sh
cd terraform
terraform destroy
```

You will need to manually remove the data volume in the web interface of Hetzner Cloud.

## TODO

Automated backups!

