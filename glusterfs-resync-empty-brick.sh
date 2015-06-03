#!/bin/bash

## glusterfs-resync-empty-brick.sh
## 3 June 2015
## Recreate the trusted.glusterfs.volume-id
## By fauzan@emerain.com

# Recreate the brick path
mkdir /mnt/gluster-storage

# Setup the trusted.glusterfs.volume-id
(vol=volume1; brick=/mnt/gluster-storage; setfattr -n  trusted.glusterfs.volume-id -v 0x$(grep volume-id /var/lib/glusterd/vols/$vol/info | cut -d= -f2 | sed 's/-//g') $brick)

# Start the glusterfs volume
gluster volume start volume1
