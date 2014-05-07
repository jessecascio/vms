Vagrant Clusters
===

Vagrant Boxes

Here are the various environments I have set up.  Each environment will have it's own README specifying how the environment is set up.  To spin up the boxes simply run:
```vagrant up```

Notice that each environment has it's own manifests directory with different Puppet files.  This was done so that each VM inside of a cluster can pick exactly what it needs to be installed.  If you need to make new Puppet files they should be done in the puppet/modules directory and then included in the Vagrant environment's manifest files.
