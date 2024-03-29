NAME
====

gdomap - GNUstep Distributed Objects name server

SYNOPSIS
========

**gdomap** \[**-C**|**-H**\] \[**-I** *pidfile*\] \[**-L** *name*\] \[**-M** *name*\] \[**-N**\] \[**-P** *number*\] \[**-R** *name*\] \[**-S**\] \[**-T** *type*\] \[**-U** *name*\] \[**-a** *file*\] \[**-c** *file*\] \[**-d**\] \[**-f**\] \[-i *seconds*\] \[-j *path*\] \[**-p**\]

DESCRIPTION
===========

**gdomap** The gdomap daemon is used by GNUstep programs to look up distributed objects of processes running across the network (and between different user accounts on a single machine). The daemon is NOT used for lookup where two processes belonging to the same user are using a host-local connection. This manual page explains the usage of gdomap. For design and implementation information (and special notes for packagers), please see the HTML documentation installed in $GNUSTEP\_SYSTEM\_DOC, under Command-line Tools.

Usually the gdomap daemon is started at system boot time and binds itself to port 538. See the *GNUstep Build Guide* for a sample startup script.

By default gdomap probes every machine on the local network to see if there is a copy of gdomap running on it. This is done for class-C networks and subnets of class-C networks. If your host is on a class-B or class-A net then the default behaviour is to treat it as a class-C net and probe only the hosts that would be expected on a class-C network of the same number.

If you are running on a class-A or class-B network, or if your net has a large number of hosts which will not have gdomap on them - you may want to supply a configuration file listing the hosts to be probed explicitly, rather than getting gdomap to probe all hosts on the local net.

You may also want to supply the *configuration file* so that hosts which are not actually on your local network can still be found when your code tries to connect to a host using @"\*" as the host name. NB. this functionality does not exist in OpenStep.

A *configuration file* consists of a list of IP addresses to be probed. The IP addresses should be in standard 'dot' notation, one per line. Empty lines are permitted in the configuration file. Anything on a line after a hash ('\#') is ignored. You tell gdomap about the config file with the '-c' command line option.

gdomap uses the SIOCGIFCONF ioctl to build a list of IP addresses and netmasks for the network interface cards on your machine. On some operating systems, this facility is not available (or is broken), so you must tell gdomap the addresses and masks of the interfaces using the '-a' command line option. The file named with '-a' should contain a series of lines with space separated pairs of addresses and masks in 'dot' notation. You must NOT include loopback interfaces in this list. If you want to support broadcasting of probe information on a network, you may supply the broadcast address as a third item on the line. If your operating system has some other method of giving you a list of network interfaces and masks, please send me example code so that I can implement it in gdomap.

OPTIONS
=======

-   help about configuration

-   general help

-   pid file to write pid

-   perform lookup for name then quit.

-   machine name for **-L** and **-N**

-   list all names registered on host

-   port number required for **-R** option.

-   register name locally then quit. **-S**

-   list the addresses of all gdomap servers known to host

-   port type for **-L** , **-R** and **-U** options - tcp\_gdo, udp\_gdo, tcp\_foreign, udp\_foreign.

-   unregister name locally then quit.

-   use config file for interface list.

-   use config file for probe.

-   extra debug logging (normally via syslog).

-   avoid fork() to make debugging easy

-   re-probe at this interval (roughly), min 60

-   place the process in a chroot jail at this path rather than in /tmp

-   disable probing for other servers

FILES
=====

Use the **-c** option to specify a configuration file for gdomap. See under **DESCRIPTION** for possible configurations.

DIAGNOSTICS
===========

Kill with SIGUSR1 to obtain a dump of all known peers in /tmp/gdomap.dump

**gdomap -N** lists all registered names on the local host.

SEE ALSO
========

**gdomap -C** gives above instructions on how to set up gdomap.

gdnc(1), GNUstep(7), gpbs(1)

*The GNUstep Build Guide* example rc script: &lt;http://gnustep.made-it.com/BuildGuide/index.html\#GNUSTEP.SERVICES&gt;

HISTORY
=======

Work on **gdomap** started in October 1996.

This manual page first appeared in gnustep-base 1.7.1 (June 2003).

AUTHORS
=======

**gdomap** was written by Richard Frith-Macdonald &lt;rfm@gnu.org&gt;

This manual page was put together by Martin Brecher &lt;martin@mb-itconsulting.com&gt;.
