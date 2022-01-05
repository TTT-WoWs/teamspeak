# Steps

1. Install Python
1. Install [`ansible`](https://docs.ansible.com/ansible/latest/installation_guide/index.html) and [`terraform`](https://www.terraform.io/downloads)
1. Create the `HCLOUD_TOKEN` variable
   - `export HCLOUD_TOKEN=<your_token>` on Linux/Mac, or
   - `Set-Variable -Name "HCLOUD_TOKEN" -Value ">your_token>" on Windows with PowerShell
1. `cd terraform`
1. `terraform init` (or `terraform init -upgrade` for updating modules)
1. `terraform apply`, then type 'yes' (aka: follow instructions)
1. `cd ..`, then `cd ansible`
1. `python -m pip install -r requirements.txt`
1. `ansible-galaxy install -r requirements.yaml`
1. `ansible-playbook update.yaml`
1. `ansible-playbook play.yaml`
1. Done!

