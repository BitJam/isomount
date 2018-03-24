# isomount
Easily mount and unmount iso files and squashfs files

There is a lot of commonality in the scripts so there is
only one real script and the others are symlinks to it.

Usage
-----
    isoomount <isofile.iso>

    Mount isofile.iso at the next avaiable spot in /mnt/iso1 -- /mnt/iso20.
    If the file /antiX/linuxfs exists then we will try to mount that too
    as a squashfs file.   Also create the file /mnt/isoN@xxx where
    xxx is the basename of the iso file.

    sqmount <suashfs-file>

Mount squashfs file at the next available spot in /mnt/sq1 -- /mnt/sq20

    isoumount

    Unmount the most recent mounted iso file.  If the /antiX/squashfs
    file was mounted by us then unmount that first (even if it wasn't
    the most recent).  Also remove the matching @ files.

    squmount

    Umount the most recently mounted squashfs file.  Also remove the
    matching @ file.

    clean-isomount

    Remove all unused directories and @ files

    show-isomount

    Show all of our curent iso and squashfs mounts

Notes
-----
Normally I add use a hymen in the filenames like "iso-mount" to
make them more clear but I got rid of them in order to make
tab completion a little easier.  The four standard commands only
require 4 or 3 letters to be typed before you press <Tab>.

If there is a problem with the symlinks you can get all of the
functionality by using the ACTION environment variable.  For
ea ample:

    ACTION=isoumount ./isomount

If you want to unmount something that is not or may not be
the last one created then just use the normal umount command.
Example:

   umount /mnt/iso3

The directory and the @ file will still remain but they
will be removed then next time one of the scripts is called.

If you are not the root user and if you do not call a script that
needs root privileges with sudo then the script uses "sudo" as
needed.  If you don't have sudo on you system then just make sure
you always call them as root.
