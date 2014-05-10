Vagrant Clusters
===

Here are the various environments I have set up for different Linux distros.  Each environment is named after the cluster feautures i.e. lamp, hadoop, etc. and will have it's own README with environment notes and a Vagrantfile to specify box settings.  To spin up the boxes simply run:
```vagrant up```

If changes need to be made to Vagrant (IP addresses, port forwarding, Puppet dir, VMs, etc.) edit the VagrantFile.

Each environment has it's own manifests directory with different Puppet includes.  This was done so that each VM inside of a cluster can pick what software it needs.  If you need to make new Puppet files, they should be placed in the /puppet directory under the correct distro.  All Puppet provisioning should be done via includes from the Vagrant environment's manifest files.

Each distro has a init.rb file that contains constants that are need for all environments for that distro.  These include box values and paths to all the conf files.  These settings can be overwritten in an environment by updating the Vagrantfile.

You can SSH between the VMs using the vagrant user and vagrant password by default.  To make things easier add SSH keys between the various servers (replace with IP of VM):  
```
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@10.2.2.4
```

Now SSH requires no password.  For larger clusters it is easier to set up host names instead of having to type out IP addresses.  Add the following to /etc/hosts on each server you want to SSH from (host name can be whatever makes sense):
```
10.2.2.4       slave
```

Now to get to the slave server simpyle SSH to host name.  No password or IP address required:

```
ssh slave
```
