# Learning DevOps Manually
This code is me following along with the Udemy course by **Imran Teli** named [DevOps Projects | 20 Real Time DevOps Projects](https://www.udemy.com/course/devopsprojects/) except that my lab is using VMWare Workstation Pro.

This is the second part of the project which is learning how to setup the environment with bash scripts for automation.

# Prerequisites if using Vagrant with VMWare Workstation Pro
- You will need to install the Vagrant VMware provider [link](https://www.vagrantup.com/docs/providers/vmware/installation)
- You will need to install the Vagrant VMWare Utility [link](https://www.vagrantup.com/docs/providers/vmware/vagrant-vmware-utility)

# Setup
## Install Vagrant
- Follow the steps [Here](https://learn.hashicorp.com/tutorials/vagrant/getting-started-install?in=vagrant/getting-started) or follow the course to get started

# Configure Vagrant config
- You will need to change your config file to reference VMware at the start of the config
  ```vagrant
  Vagrant.configure("2") do |config|
    config.vm.provider "vmware_desktop" do |v|
        v.gui = true
    end
    config.hostmanager.enabled = true 
    config.hostmanager.manage_host = true
  ```

# Notes
- Not all Vagrant boxes work with your provider. You can use the Vagrant Marketplace to find boxes that are compatible. [Here](https://app.vagrantup.com/boxes/search?provider=vmware)