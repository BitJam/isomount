# isomount
Easily mount and unmount iso files and squashfs files

There is a lot of commonality in the scripts so there is
only one real script and the others are symlinks to it.

IMPORTANT NOTE
--------------
**Starting with version 00.02.00 an incompatible change was made.
Please make sure all of the mountpoints from the previous
version are unmounted before you upgrade**

Also, this is still pre-beta.


Quick Start
-----------
If you clone or copy this repo then you can use the utilities
directly from the repo.  Example:

    ./isomount /some/iso-file.iso

Use the following command to install the utilities to /usr/local/bin

    sudo make install ROOT=

Here are the other Makefile commands:

    make help                 show this help
    make install              install to current directory

The utilities are still rough around the edges but they are a big
improvement over the scripts I've been using for many years.

Usage
-----
    Usage: isomount [options] /path/to/file.iso

       Mount the iso file specified at a directory like /mnt/iso1/.  If
       it is an MX or antiX iso then also mount the /antiX/linuxfs file
       as a squashfs file.

       Also create the file /mnt/iso1e@<name> where <name> is the path to
       the mounted file with slashes converted to dashes.
    --------------------------------------------------------------------

    Usage: sqmount [options] /path/to/squashfs-file

        Mount the squashfs file specified at a directory like /mnt/sq1/

        Also create the file/mnt/sq1@<name> where <name> is the path to
        the mounted file with slashes converted to dashes.
    --------------------------------------------------------------------

    Usage: isoumount [options] [/mnt/iso2]

        Umount the most recently mounted iso file.  If a mountpoint is
        given then unmount that mountpoint instead.  In both cases we also
        delete the mountpoint directory and the the /mnt/iso2@<name> file.
    --------------------------------------------------------------------

    Usage: squmount [options] [/mnt/sq2]

        Umount the most recently mounted squashfs file.  If a mountpoint is
        given then unmount that mountpoint instead.  In both cases we also
        delete the mountpoint directory and the the /mnt/sq2@<name> file.
    --------------------------------------------------------------------

    Usage: clean-isomount [options]

        Clean up leftover mountpoint directories and @ files.
    --------------------------------------------------------------------

    Usage: show-isomount [options]

        Show the currently mounted iso and squashfs files
    --------------------------------------------------------------------

Options
-------

The following options are available for all six commands.

    -c --color=<xxx>   set color scheme to off|low|low2|bw|dark|high
    -h --help          show this usage
    -q --quiet         don't show mountpoint(s)
    -s --silent        don't print anything except errors
    -v --verbose       be more verbose

Notes
-----
Normally I add use a hyphen in the filenames like "iso-mount" to
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

This started as 36 lines of code that has worked well for me
for many years. It has now blossomed to over 400 lines of
code.  A number of my programs are like that.  The start
with a core of under 50 lines (often much less) and then
grow by a factor of 10 or more.  That's user friendliness
for you.
