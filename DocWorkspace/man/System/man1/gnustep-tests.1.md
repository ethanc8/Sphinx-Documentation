NAME
====

gnustep-tests - script to run a GNUstep testsuite

SYNOPSIS
========

**gnustep-tests** \[ *directory* | *test.m* \]

DESCRIPTION
===========

**gnustep-tests** runs the specified tests, or any tests found in the directory. If no arguments are given, the current directory and its subdirectories are scanned and processed accordingly.

OPTIONS
=======

**--documentation**  
prints full details about the testing framework

<!-- -->

**--clean**  
deletes old logs and any leftover files

<!-- -->

**--failfast**  
stops after the first encountered test failure

<!-- -->

**--debug**  
runs any failed tests in **gdb**(1)

<!-- -->

**--developer**  
treats any hopes as real tests

<!-- -->

**--verbose**  
detailed log output

<!-- -->

**--sequential**  
disables parallel building

SEE ALSO
========

**GNUstep**(7)

AUTHORS
=======

**gnustep-tests** was written by Alexander Malmberg &lt;alexander@malmberg.org&gt; and Richard Frith-Macdonald &lt;rfm@gnu.org&gt;.

This man page was written by Yavor Doganov &lt;yavor@gnu.org&gt;.

COPYRIGHT
=========

Copyright © 2014 Free Software Foundation, Inc.

Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved.
