NAME
====

GNUstep - A free implementation of the OpenStep standard

DESCRIPTION
===========

**GNUstep** provides an Object-Oriented application development framework and toolset for use on a wide variety of computer platforms. **GNUstep** is based on the original OpenStep specification provided by NeXT, Inc. (now Apple and called Cocoa).

**GNUstep** is written in Objective-C, an object-oriented superset of the C programming language, similar to SmallTalk. However there exist a number of bridges and interfaces to develop **GNUstep** programs using other languages like JAVA or Ruby.

The **GNUstep** core system consists of the following parts, which are jointly referred to as *gnustep-core* :

*gnustep-make*  
A set of scripts and makefiles that heavily ease the creation and maintenance of software projects.

*gnustep-base*  
The FoundationKit libraries for non-GUI tools providing everything from string and array classes, filemanager classes to distributed objects.

*gnustep-gui*  
The ApplicationKit containing widgets, workspace classes and means for applications to interact with the user. This is the frontend of **GNUstep**'s GUI part.

*gnustep-back*  
This is the backend of **GNUstep**'s GUI part which does the actual rendering and event handling. It acts as a layer between gnustep-gui and the operating/drawing system. Backends exist for X11 (one using cairo, one using libart, one using xlib drawing) and win32.

Apart from the above, there exist a number of addon libraries related to GNUstep, like **Renaissance** which allows developers to specify an application's user interface in xml. For database access, there is **GDL2** - the GNUstep Database Library. Please refer to the **GNUstep** website for more information.

**GNUstep** per default is self-contained. That means that all **GNUstep** applications, tools, libraries and add-ons are installed into the **GNUstep** directory hierarchy. However as of *gnustep-make-2.0.0* it is also possible to install everything in compliance with other filesystem hierarchies. See the *FilesystemLayouts* directory in the source package of *gnustep-make* for more information.

There are four domains which are searched for files: the System domain, which should only contain the core system files, the Local domain which stores all that has later been installed on the system, the Network domain which should be used for importing data from a remote system, and the User domain which resides in the user's home directory (mostly *~/GNUstep*).

A complete description of the default **GNUstep** layout can be found in the *filesystem.pdf*.

TOOLS AND APPLICATIONS
----------------------

In the world of GNUstep the term *tool* refers to command line programs whereas *applications* are fully fledged GUI programs. Naturally, *tools* reside in the domains' Tools folder, *applications* can be found in the domains' Applications folder.

Applications are either launched using the **openapp** command or from the Workspace.

SERVICES
--------

In **GNUstep** applications globally offer functionality to other applications through *services*. They can be reached through the Services menu entry in an application's main menu. Apart from *services* offered by applications, there may be programs whose sole purpose is the offering of services. They can be found in the domains' Libary/Services folders.

The **make\_services** tool makes sure the services are known to other applications when a application is newly installed.

BUNDLES
-------

A bundle is a collection of resources making up a discrete package for use. There are currently three types of bundles: applications, frameworks and loadable bundles.

A loadable bundle is a kind of plug-in. There are two types of loadable bundles, namely plug-ins and palettes. The plug-in is normally referred to as a bundle, which can make it a bit confusing. A plug-in is a bundle that can be loaded by an application to provide additional functionality, while a palette is a plug-in for **GORM**, the interface builder. A palette is used to extend **GORM** with custom UI objects. Palettes have a *.palette* extension.

THE WORKSPACE
-------------

The central place of the user interface is the *Workspace* or *Workspace Manager* which acts as an interface between the user and parts of the system like files, processes, etc. The GWorkspace application provides this functionality in GNUstep. See the GWorkspace website for more details.

DEVELOPER APPLICATIONS
----------------------

What would a development environment be without the applications to create applications? The applications provided by GNUstep for Rapid Application Development are:

GORM  
**GORM** is the interface modeler. With **GORM** you can quickly create the graphical interface of your application.

Project Center  
**Project Center** is the program where you can develop your program. It offers you automatic generation of *GNUmakefiles* , project maintenance and of course a code editor.

SEE ALSO
========

gcc(1), gdnc(1), gdomap(8), gopen(1), gpbs(1), make(1), openapp(1)

**GNUstep Websites:**

http://www.gnustep.org/  
Official GNUstep website

http://wiki.gnustep.org/  
GNUstep Wiki (lots of useful information)

http://savannah.gnu.org/projects/gnustep/  
GNUstep Project Page

http://gnustep.made-it.com/  
GNUstep Documentation Library

http://www.collaboration-world.com  
Collaboration World, the home of GNUmail

http://www.gnustep.it/  
The home of GWorkspace, JIGS, Renaissance and programming tutorials.

**Mailinglists**

http://www.gnustep.org/information/gethelp.html  
Mailing lists and mailing list archives.

**IRC**

\#GNUstep on FreeNode  
You are invited to join the \#GNUstep IRC channel on FreeNode (irc.freenode.net).

HISTORY
=======

**GNUstep** was at first a collaboration of two projects that wanted to create a single **GNUstep** project that complied to the OpenStep specification provided by NeXT Computer, Inc. and SunSoft, Inc. Development of this joint effort started around 1993-1994. For a more detailed history description see the GNUstep Documentation Library referenced in the **SEE ALSO** section.

GNUstep is developed and maintained by a large number of people. Please see &lt;http://www.gnustep.org/developers/whoiswho.html&gt; for a list.

AUTHORS
=======

This man-page was first written by Martin Brecher &lt;martin@mb-itconsulting.com&gt; in august of 2003.

In December 2007 it was expanded by Dennis Leeuw &lt;dleeuw@made-it.com&gt; and made to comply with the gnustep-make-2.0.x releases.
