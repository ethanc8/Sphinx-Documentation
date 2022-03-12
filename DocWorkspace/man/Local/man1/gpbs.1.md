NAME
====

gpbs - GNUstep PasteBoard Server

SYNOPSIS
========

**gpbs**

DESCRIPTION
===========

The **gpbs** daemon serves as a clipboard/pasteboard for GNUstep programs, handling the copying, cutting and pasting of objects as well as drag and drop operations between applications.

Every user needs to have his own instance of **gpbs** running. While **gpbs** will be started automatically as soon as it is needed, it is recommend to start **gpbs** in a personal login script like ~/.bashrc or ~/.cshrc. Alternatively you can launch gpbs when your windowing system or the window manager is started. For example, on systems with X11 you can launch **gpbs** from your .xinitrc script or alternatively - if you are running Window Maker - put it in Window Maker's autostart script. See the *GNUstep Build Guide* for a sample startup script.

OPTIONS
=======

**-NSHost** **&lt;hostname&gt;**  
attaches **gpbs** to a remote session.

<!-- -->

**--GSStartupNotification**  
sends a notification through the NSDistributedNotificationCenter (i.e. gdnc) so that apps know that it has started up. This is only relevant if the application itself tries to startup **gpbs** (which means **gpbs** was not started at session login).

**--daemon**  
starts **gpbs** as a daemon - mostly this means that all output gets sent to syslog rather than the terminal.

**--no-fork**  
does not fork a separate process

**--verbose**  
makes **bs** his logging more verbose

DIAGNOSTICS
===========

**gdomap -L GNUstepGSPasteboardServer** will lookup instances of **gpbs.**

Alternatively, **gdomap -N** will list all registered names on the local host.

BUGS
====

Versions of **gpbs** up to (including) 1.7.2 have problems with copy and paste of mulit-lingual text, as it used the atom XA\_STRING alone to exchange string data between X clients (and thus GNUstep clients). This means **gpbs** is inherently unable to do cut-and-paste with characters other than ISO Latin1 ones, TAB, and NEWLINE.

SEE ALSO
========

gdnc(1), gdomap(8), GNUstep(7) xinit(1) wmaker(1)

*The GNUstep Build Guide* example startup script: &lt;http://gnustep.made-it.com/BuildGuide/index.html\#GNUSTEP.SERVICES&gt;

HISTORY
=======

Work on **gdnc** started August 1997.

This manual page first appeared in gnustep-back 0.8.8 (July 2003).

AUTHORS
=======

gpbs was written by Richard Frith-McDonald &lt;rfm@gnu.org&gt;

This man page was written by Martin Brecher &lt;martin@mb-itconsulting.com&gt; with contributions from Kazunobu Kuriyama &lt;kazunobu.kuriyama@nifty.com&gt;.

This man page was updated September 2006 by Dennis Leeuw (dleeuw@made-it.com) with notes by Adam Fedor (fedor@doc.com).
