# Copyright (c) 2012-2017 Red Hat, Inc.
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Tyler Jewell - Initial implementation
#
# build:
#   docker build -t eclipse/che-mount .
#
# use:
#  On linux:
#  docker run --rm -it --cap-add SYS_ADMIN --device /dev/fuse
#             --name che-mount
#             -v ${HOME}/.ssh:${HOME}/.ssh
#             -v ${HOME}/.unison:${HOME}/.unison 
#             -v /etc/group:/etc/group:ro 
#             -v /etc/passwd:/etc/passwd:ro 
#             -u $(id -u ${USER})
#             -v <host-dir>:/mnthost codenvy/che-mount <ws-id|ws-name> 
#            
#  On Mac or Windows:
#  docker run --rm -it --cap-add SYS_ADMIN --device /dev/fuse
#             --name che-mount 
#             -v ~/.ssh:/root/.ssh
#             -v <host-dir>:/mnthost codenvy/che-mount <ws-id|ws-name> 
#
# RUN IN CONTAINER:
#  echo "secret" | $(echo "yes" | sshfs user@10.0.75.2:/projects /mntssh -p 32774)
#
# TO UNMOUNT IN CONTAINER
#  fusermount -u /mntssh
#
# INTERNAL SYNC SCRIPT
#   /bin/synch.sh <ip> <ws-port>
FROM eclipse/che-mount:6.11.0
