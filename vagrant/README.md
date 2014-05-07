Vagrant Clusters
===

Vagrant Boxes

Here are the various environments I have set up.  Each environment will have it's own README specifying how the environment is set up.  To spin up the boxes simply run:
```vagrant up```

If changes need to be made to Vagrant (IP addresses, port forwarding, Puppet dir, VMs, etc.) edit the VagrantFile.

Notice that each environment has it's own manifests directory with different Puppet files.  This was done so that each VM inside of a cluster can pick exactly what it needs.  If you need to make new Puppet files they should be placed in the puppet/modules directory and then included via the Vagrant environment's manifest files.
