NAME
====

gdnc - GNUstep Distributed Notification Center

SYNOPSIS
========

**gdnc**

DESCRIPTION
===========

The gdnc daemon is used by GNUstep programs to send notifications and messages to one another. By default it uses private inter-process communications accessible only to the curtrent user on the machine on which it is running (where the operating system supports them).

Every user needs to have his own instance of **gdnc** running. While **gdnc** will be started automatically as soon as it is needed, it is recommended to start **gdnc** in a personal login script like ~/.bashrc or ~/.cshrc. Alternatively (if you have no command-line tools which use distributed notifications) you can launch gdnc when your windowing system or the window manager is started. For example, on systems with X11 you can launch **gdnc** from your .xinitrc script or alternatively - if you are running Window Maker - put it in Window Maker's autostart script. See the *GNUstep Build Guide* for a sample startup script.

OPTIONS
=======

To attach **gdnc** to a remote session use the

-   argument.

To run a copy of the server to handle public notifications (available to all users on the local machine)

-   

To run a copy of the server to handle network-public notifications (available to all users able to connect to the local machine on the network)

-   

DIAGNOSTICS
===========

**gdomap -L GDNCServer** will lookup instances of gdnc which were launched with the NSHost, GSPublic, or GSNetwork command line arguments.

Alternatively, **gdomap -N** will list all registered names on the local host.

SEE ALSO
========

gdomap(8), GNUstep(7), gpbs(1)

*The GNUstep Build Guide* example startup script: &lt;http://gnustep.made-it.com/BuildGuide/index.html\#GNUSTEP.SERVICES&gt;

HISTORY
=======

Work on **gdnc** started October 1998.

This manual page first appeared in gnustep-base 1.7.2 (July 2003).

AUTHORS
=======

**gdnc** was written by Richard Frith-Macdonald &lt;rfm@gnu.org&gt;.

This man page was written by Martin Brecher &lt;martin@mb-itconsulting.com&gt;.
