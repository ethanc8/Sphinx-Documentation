NAME
====

make\_strings - tool to build lists of localizable strings from Objective-C files

SYNOPSIS
========

**make\_strings** \[**--help**\] \[**--verbose**\] \[**--aggresive-import**\] \[**--aggressive-match**\] \[**--aggressive-remove**\] \[**-L** *languages*\] *files.\[hmc...\]*  

DESCRIPTION
===========

**make\_strings** parses Objective-C files and builds lists of localizable strings. It then creates new *.strings* files or merges the strings with existing *.strings* files. It's fairly intelligent when matching old and new strings, and produces *.strings* files that are (supposed to be) easy for a translator to work with.

**make\_strings** accepts the following options:

OPTIONS
=======

**--help**  
Prints a short list of available options.

**--verbose**  
Prints additional information while processing.

**-L*** languages*  
Specify which languages to process. Multuple **-L** options are accepted, or multiple *languages* defined in one **-L** flag.

**--aggressive-import**  
Activates **--aggresive-match** and automatically removes "dummy" entries that are added by importing *.strings* files which were not created by **make\_strings** program. This option is suitable when **make\_strings** is run for the first time and there is an existing *.strings* file which contains a fairly accurate translation.

**--aggressive-match**  
This option will make **make\_strings** assume that matching keys should have matching translations. This can save lots of work, but it increases the risk of erroneous translation.

**--aggressive-remove**  
Removes obsolete strings/keys.

EXAMPLES
========

make\_strings -L "English Swedish Russian" \*.\[hm\]

SEE ALSO
========

**GNUstep**(7).

AUTHORS
=======

**make\_strings** was written Alexander Malmberg &lt;alexander@malmberg.org&gt;.

This manual page was added by Yavor Doganov &lt;yavor@gnu.org&gt;.

COPYRIGHT
=========

Copyright (C) 2009 Free Software Foundation, Inc.

Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved.
