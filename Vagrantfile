#Aqui se define la configuración y creación de la máquina virtual
Vagrant.configure("2") do |m| #Identificador de la máquina

  m.vm.box = "ubuntu/jammy64" #Tipo de máquina que es

  m.vm.network "private_network", ip: "192.168.56.10" #Tipo de red

  m.vm.provider "virtualbox" do |c| #Configuración de memoria
    c.memory = "2048" #RAM
    c.cpus = 2 #CPUs
  end

  # Provisión automática con el script bootstrap.sh
  m.vm.provision "shell", path: "bootstrap.sh"
end