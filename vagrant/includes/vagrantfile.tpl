Vagrant.configure(2) do |config|
    config.ssh.username = "rancher"
 
    config.vm.provider :virtualbox do |vb|
        vb.check_guest_additions = false
        vb.functional_vboxsf = false
    end
end
