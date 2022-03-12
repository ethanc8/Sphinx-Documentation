NAME
====

dk\_make\_protocol - produce Objective-C protocol declarations from D-Bus introspection data

SYNOPSIS
========

**dk\_make\_protocol** \[**-1|-2**\] \[**-o** *protocol.h*\] **-i** *interface.xml*

DESCRIPTION
===========

The **dk\_make\_protocol** command produces Objective-C protocol declarations from XML-formatted D-Bus interface declarations. These protocol declarations can be used in Objective-C programmes that use DBusKit to communicate with D-Bus.

The interface declaration is specified with the **-i** switch and the generated protocol declaration will be printed to stdout unless an output file is specified using the **-o** switch.

By default, the tool generates Objective-C 2 compliant protocol declarations using the "@property"-keyword.

OPTIONS
=======

-   read the interface declaration from *interface.xml*

-   write the generated protocol declaration to *protocol.h*

-   do not use Objective-C 2 features.

-   use Objective-C 2 features (default)

BUGS
====

When multiple switches of the same kind are used, the last value specified takes precedence.

HISTORY
=======

**dk\_make\_protocol** was written in August 2010 and appeared in version 0.1 of DBusKit.

This manual page was first written in October 2011 and appeared in version 0.2 of DBusKit.

AUTHORS
=======

**dk\_make\_protocol** and this manual page were written by Niels Grewe &lt;niels.grewe@halbordnung.de&gt;.
