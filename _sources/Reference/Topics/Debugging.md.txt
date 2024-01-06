# Debugging

### Authors

Adam Fedor  

**Copyright:** (C) Copyright (C) 2005 Free Software Foundation, Inc.

> From the GNUstep Base manual.
> Licensed under GNU GPLv2+

## Overview

GDB is the GNU debugger and is the main method used for debugging Objective-C programs. Full support for debugging Objective-C with GDB was added in version 6.0. This document will describe the various features of GDB that help with debugging Objective-C programs. However, GDB is a very complex program, and not everything that it can do will be described here.

## Basic GDB usage

To start the debugger, specify the program you want to debug:

```bash
gdb myprogram
```       

With GNUstep you can also use the debugtool and debugapp scripts to begin a debugging session:

```bash       
debugapp MyApp.app
```

Following is a short list of important commands that gdb accepts. After this list, a more detailed explaination of each command is given.

-   `run` *args* - Run the program
-   `break` *func/method* - Stop at a function or method
-   `print` *var/func* - Print value of a variable/function
-   `backtrace` - List the fuction stack
-   `frame` *value* - Move up and down the fuction stack
-   `help` - Get help on gdb commands
-   `quit` - Quit the program

<span id="001002000000">The `run` command</span>
------------------------------------------------

This command starts the program inside the debugger. You can optionally add arguments to the run command and these arguments will get passed directly to the program as normal command-line arguments. For instance, you might want to start an application and open a file:

```gdb
run -NSOpen=afile.txt
```    

<span id="001003000000">The `break` command</span>
--------------------------------------------------

This command instructs the debugger to stop when it reaches a certain location in the program. The syntax for break can be very complex. However we will only cover some simple examples. One instance is to break on a particular line number.

```gdb
break afile.m:345
```

will stop the debugger at line 345 in the file `afile.m`.

```gdb
break a_function
```

will tell the debugger to stop at the beggining of the `a_function` function. Finally, and most importantly for Objective-C programs, you can enter a fully-qualified or partially-qualified method name to stop at. A fully qualified Objective-C method name is specified as

```gdb
-[Class methodName]
```

where the minus sign is used to indicate an instance method and a plus sign (not shown) is used to indicate a class method. The class name `Class` and method name `methodName` are enclosed in brackets, similar to the way messages are specified in Objective-C source code. For example, to set a breakpoint at the `create` instance method of class `Fruit` in the program currently being debugged, enter:

```gdb
break -[Fruit create]
```

One can also specify just a method name:

```gdb
break initWithValue:
```

gdb will automatically determine what class this method belongs to. If there is more than one class that implements this method, you will be presented with a list of classes that implement the method from which you must chose one.

<span id="001004000000">The `print` command</span>
--------------------------------------------------

The `print` command can be used to display a wide variety of information that gdb knows about the program. As with the `break` command, the variety of things you can do is very large, but we will discuss only a few of the things that can be done. Below are several simple examples of printing the value of a variable.

```gdb
print aVariable
print anIvar
print self->anIvar
print anArray[4]
print aStruct.subvalue
print *(int *)pointerValue
```

Note that you can specify variables in the same way you specify them in source code, using array subscripts, pointer dereferences, etc. You can also set the value of a variable using `print`:

```gdb
print aVariable = 4
```

One can also print the value of a function. Here gdb will actually call the function you specify and return the output:

```gdb
print my_function(4, "hithere")
```

When debugging Objective-C programs, the same thing can be done with methods.

```gdb
print -[object hash]
```

A special command has been added to gdb to print the `description` of an object (based on the method of the same name). This is the `print-object` (or `po`) command:

```gdb
po anObject
```

Which is the same as typing

```gdb
print -[myObject desciption]
```

<span id="001005000000">Other command</span>
--------------------------------------------

The `clear`, `info line`, `jump`, and `list` commands also accept Objective-C method syntax for specifying locations.

## Getting nice bactraces

```{note}
This section was written by the editor, not the original authors.
```

To get a nice backtrace, showing you everything up to the error that ended the program or everything up to the current breakpoint, use the command:

```
backtrace -frame-arguments all -raw-frame-arguments off -frame-info source-and-location -frame-arguments all
```

which will get you really nice, colored output that kind of looks like

```
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
#1  0xf7703804 in __GI_abort () at abort.c:79
79      abort.c: No such file or directory.
#2  0xf78f919c in objc_exception_throw () from /usr/local/lib/libobjc.so.4.6
#3  0xf7b68d14 in -[NSException raise] (self=0x12069c, _cmd=0xf7f78cc8 <objc_selector_raise_v80:4>) at NSException.m:1608
1608      @throw self;
#4  0xf7b67dc4 in +[NSException raise:format:arguments:] (self=0xf7f2bd34 <._OBJC_CLASS_NSException>, _cmd=0xf7f7a160 <objc_selector_raise:format:arguments:_v200:4812{.va_list=^v}16>, 
    name=0xf7f65b48 <.objc_str_NSInvalidArgumentException>, format=0xf7f5f488 <.objc_str_Tried_to_init_array_with_nil_object>, argList={__ap = 0xfffee7a8}) at NSException.m:1487
1487      [except raise];
#5  0xf7b67d04 in +[NSException raise:format:] (self=0xf7f2bd34 <._OBJC_CLASS_NSException>, _cmd=0xf7f78c40 <objc_selector_raise:format:_v160:4812>, name=0xf7f65b48 <.objc_str_NSInvalidArgumentException>, 
    format=0xf7f5f488 <.objc_str_Tried_to_init_array_with_nil_object>) at NSException.m:1472
1472      [self raise: name format: format arguments: args];
#6  0xf7a217f0 in -[GSInlineArray initWithObjects:count:] (self=0x0, _cmd=0xf7f78d08 <.objc_selector_initWithObjects:count:_160:4r^8I12>, objects=0xfffee900, count=2) at GSArray.m:424
424                   [NSException raise: NSInvalidArgumentException
#7  0xf7a25648 in -[GSPlaceholderArray initWithObjects:count:] (self=0x11e88c, _cmd=0xf7f78d08 <.objc_selector_initWithObjects:count:_160:4r^8I12>, objects=0xfffee900, count=2) at GSArray.m:1199
1199      return [self initWithObjects: objects count: count];
#8  0xf7aaa16c in +[NSArray arrayWithObjects:count:] (self=0xf7f232b4 <._OBJC_CLASS_NSArray>, _cmd=0x286c0 <.objc_selector_arrayWithObjects:count:_160:4r^8I12>, objects=0xfffee900, count=2) at NSArray.m:277
277       return AUTORELEASE([[self allocWithZone: NSDefaultMallocZone()]
#9  0x0000bc14 in ApplySDKToCompilerArguments (sdk=0x0, compilerArguments=0x11e764) at main.m:320
320             [compilerArguments addObjectsFromArray:@[@"-isysroot", [sdk.path stringByStandardizingPath]]];
#10 0x0000b0a8 in main (argc=0, argv=0xfffeec60) at main.m:510
510             ApplySDKToCompilerArguments(oldSDK ?: defaultSDK, oldCompilerArguments);
```

You can prefix the following in front of the command you started the program with -- from the normal command line! Note that this will cause GDB to exit immediately afterwards.

```
gdb -q -batch -ex run -ex "backtrace -frame-arguments all -raw-frame-arguments off -frame-info source-and-location -frame-arguments all" --args
```

Unfortunately, all the colors will go away.