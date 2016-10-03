# chef_bootstrap

This script expedites the bootstrapping process of your nodes to
your chef server.

This script will check if the file specifying your nodes exists, and then
it will begin to bootstrap your nodes. If the node names in your specified 
file are the same as the node names on your chef server, this script
will automatically delete the existing nodes first.

Pay attention to the commented lines in the script where you need to insert
your own information.

If you have not already done so, please note that you will first need to deploy SSH keys to any nodes you are trying to bootstrap. If you need to automate this process for multiple nodes, please see my script for doing so (https://github.com/Omar-Khawaja/ssh_addkeys).
