Vagrant.configure("2") do |config|
    config.vm.provider "vmware_desktop" do |v|
        v.gui = true
    end
    config.hostmanager.enabled = true 
    config.hostmanager.manage_host = true
#VM need to be built in order for the automation to work

  ### DB vm  ####
  config.vm.define "db01" do |db01|
    db01.vm.box = "generic/centos8"
    db01.vm.hostname = "db01"
    db01.vm.network "private_network", ip: "192.168.33.15"
    db01.vm.provision "shell", path: "mysql.sh"
  end

  ### Memcache vm  #### 
  config.vm.define "mc01" do |mc01|
    mc01.vm.box = "generic/centos8"
    mc01.vm.hostname = "mc01"
    mc01.vm.network "private_network", ip: "192.168.33.14"
    mc01.vm.provision "shell", path: "memcache.sh"
    mc01.vm.provision "shell", path: "fix_memcache.sh"
  end

  ### RabbitMQ vm  ####
  config.vm.define "rmq01" do |rmq01|
    rmq01.vm.box = "generic/centos8"
    rmq01.vm.hostname = "rmq01"
    rmq01.vm.network "private_network", ip: "192.168.33.16"
    rmq01.vm.provision "shell", path: "rabbitmq.sh"
  end
    
  ### tomcat vm ###
     config.vm.define "app01" do |app01|
      app01.vm.box = "generic/centos8"
      app01.vm.hostname = "app01"
      app01.vm.network "private_network", ip: "192.168.33.12"
      app01.vm.provision "shell", path: "tomcat.sh"
      app01.vm.provider "vmware_desktop" do |v|
       v.vmx["memsize"] = "1024"
       end
     end

   ### Nginx VM ###
   config.vm.define "web01" do |web01|
    web01.vm.box = "bento/ubuntu-16.04"
    web01.vm.hostname = "web01"
    web01.vm.network "private_network", ip: "192.168.33.11"
    web01.vm.provision "shell", path: "nginx.sh"
  end
end