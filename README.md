# chef_bootstrap

This script expedites the bootstrapping process of your nodes to
your chef server.

This script will check if the file specifying your nodes exists, and then
it will begin to bootstrap your nodes. If the node names in your specified 
file are the same as the node names on your chef server, this script
will automatically delete the existing nodes first.

Pay attention to the commented lines in the script where you need to insert
your own information.

Feel free to contribute or suggest improvements

