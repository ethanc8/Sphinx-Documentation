NAME
====

gnustep-config - prints information about the current gnustep installation.

SYNOPSIS
========

**gnustep-config** \[ **--variable=***variable* |**--objc-flags**|**--objc-libs**|**--base-libs**|**--gui-libs** \]

DESCRIPTION
===========

**gnustep-config** can print information about the currently installed GNUstep system. Output is generated dynamically based on environment variables such as GNUSTEP\_CONFIG\_FILE and GNUSTEP\_MAKEFILES, though default values for these are generated when the tool is configured/installed. Output is primarily the locations in which various GNUstep resources are installed, but also provide flags used to build differnt types of GNUstep project.

OPTIONS
=======

**--variable=***variable*  
prints the value of the specified variable. Possible variables are:

> GNUSTEP\_MAKEFILES
>
> GNUSTEP\_USER\_DIR
>
> GNUSTEP\_USER\_DEFAULTS\_DIR
>
> GNUSTEP\_HOST
>
> GNUSTEP\_HOST\_CPU
>
> GNUSTEP\_HOST\_VENDOR
>
> GNUSTEP\_HOST\_OS
>
> GNUSTEP\_IS\_FLATTENED
>
> GNUSTEP\_xxx\_APPS
>
> GNUSTEP\_xxx\_TOOLS
>
> GNUSTEP\_xxx\_LIBRARY
>
> GNUSTEP\_xxx\_HEADERS
>
> GNUSTEP\_xxx\_LIBRARIES
>
> GNUSTEP\_xxx\_DOC
>
> GNUSTEP\_xxx\_DOC\_MAN
>
> GNUSTEP\_xxx\_DOC\_INFO

where 'xxx' could be any of 'SYSTEM', 'NETWORK', 'LOCAL' and 'USER'.

<!-- -->

**--objc-flags**  
prints all the flags required to compile an ObjC file

<!-- -->

**--objc-libs**  
prints all the flags required to link a pure ObjC program (no foundation/gui)

<!-- -->

**--base-libs**  
prints all the flags required to link a command-line ObjC program (no gui)

<!-- -->

**--gui-libs**  
prints all the flags required to link a GUI ObjC program

BUGS
====

None known

SEE ALSO
========

GNUstep(7)

HISTORY
=======

Work on **gnustep-config** started in 2007 by Nicola Pero &lt;nicola.pero@meta-innovation.com&gt;

AUTHORS
=======

This man page was written by Dennis Leeuw &lt;dleeuw@made-it.com&gt;.

COPYRIGHT
=========

Copyright (C) 2007 Free Software Foundation, Inc.

Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved.
