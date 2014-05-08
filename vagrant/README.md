Vagrant Clusters
===

Here are the various environments I have set up.  Each environment will have it's own README with environment notes and a Vagrantfile to specify box settings.  To spin up the boxes simply run:
```vagrant up```

If changes need to be made to Vagrant (IP addresses, port forwarding, Puppet dir, VMs, etc.) edit the VagrantFile.

Each environment has it's own manifests directory with different Puppet includes.  This was done so that each VM inside of a cluster can pick what software it needs.  If you need to make new Puppet files, they should be placed in the puppet/modules directory, and then included via the Vagrant environment's manifest files.
