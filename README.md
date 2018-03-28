# isomount
Easily mount and unmount iso files and squashfs files.

There is a lot of commonality in the scripts so there is
only one real script and the others are symlinks to it.

What's new?
-----------
    isomount version 00.03.00 (Wed Mar 28 15:44:29 MDT 2018)
         dfh version 00.03.00 (Wed Mar 28 15:44:56 MDT 2018)

* Add the dfh command

* Improve the infrastructure by getting rid of the "status" file by
using the losetup command.

* Improve the table of mount-points

* More options

* I'm pushing versions 00.03.00 so I can get to work adding a slick
  GUI interface

TLDR:
-----

**Mount an iso file (and its linuxfs file if it is antiX/MX):**

    isomount /path/to/iso-file.iso

**Unmount the most recently mounted iso file (and its linuxfs file if needed):**

    isoumount

**Unmount all the files we have mounted:**

    isoumount all

**Show what files are mounted:**

    show-isoumount

**Show all mounted file systems in a very human friendly format:**

    dfh


Screen Shots
------------
### Mounting

![isomount mounting](/images/isomount-02.png)

### Unmounting


![isoumount unmounting](/images/isoumount-02.png)

### dfh output

![isoumount unmounting](/images/dfh-01.png)

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
**isomount [options] /path/to/file.iso**

Mount the iso file specified at a directory like /mnt/iso1/.  If
it is an MX or antiX iso then also mount the /antiX/linuxfs file
as a squashfs file.

--------------------------------------------------------------------

**sqmount [options] /path/to/squashfs-file**

Mount the squashfs file specified at a directory like /mnt/sq1/

--------------------------------------------------------------------

**isoumount [options] [/mnt/iso2|'all']**

Umount the most recently mounted iso file.  If a mountpoint is
given then unmount that mountpoint instead.

If 'all' is given then we umount all of our mounts

-------------------------------------------------------------------

**squmount [options] [/mnt/sq2|'all']**

Umount the most recently mounted squashfs file.  If a mountpoint is
given then unmount that mountpoint instead.

If 'all' is given then we umount all of our mounts.

--------------------------------------------------------------------

**clean-isomount [options]**

Clean up leftover mountpoint directories.

--------------------------------------------------------------------

**show-isomount [options]**

Show the currently mounted iso and squashfs files

Options
-------

The following options are available for all six commands.

    -c --color=<xxx>   set color scheme to off|low|low2|bw|dark|high
    -h --help          show this usage
    -H --header=<type>   change header color: norm, rev1, rev2, rev3
                                             (n,      r1,   r2,   r3)
    -q --quiet         only show mountpoints
    -Q --Quiet         don't show mountpoint(s)
    -s --silent        don't print error message
    -v --version       show version number and exit
    -V --verbose       be more verbose

Some options may not pertain to all commands.

Notes
-----
Normally I add use a hyphen in the filenames like "iso-mount" to
make them more clear but I got rid of them in order to make
tab completion a little easier.  The four standard commands only
require 4 or 3 letters to be typed before you press <Tab>.

If there is a problem with the symlinks you can get all of the
functionality by using the ACTION environment variable.  For
example:

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
