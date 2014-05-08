Puppet Conf Files
===

### Puppet Modules

These are the Puppet modules used to spin up the Vagrant boxes.  Most of these are simple, only installing the bare minimum, so that different server configurations can be tested during development.  Each Linux distro has it's own module directorys.

New Puppet configurations should be added here, to the correct OS modules directories.  Make classes as specific as possible so that VMs can be installed with exactly what they need.  Use defined types instead of classes for functionality that needs to be applied multiple times per box i.e. vhosts or db configurations.

The shell script is needed as a provisional bootstrap when spinning up Vagrant boxes, as each box needs to have Puppet installed before the Puppet modules can be applied.
