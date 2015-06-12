Vagrant.configure(2) do |config|
    config.ssh.username = "rancher"
 
    config.vm.provider :virtualbox do |vb|
        vb.check_guest_additions = false
        vb.functional_vboxsf = false
    end

    config.vm.provider "parallels" do |p|
        p.check_guest_tools = false
        p.customize ["set", :id, "--nested-virt", "on"]
    end
end
