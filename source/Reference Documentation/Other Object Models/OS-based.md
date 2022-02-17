# <big> OS-based Object System </big>
## Table of Contents
<!-- TOC -->

* [<big> OS-based Object System </big>](#big-os-based-object-system-big)
    * [Table of Contents](#table-of-contents)
* [Frameworks using](#frameworks-using)
    * [Official Apple](#official-apple)
* [Base class](#base-class)
* [Memory management](#memory-management)
* [Subclassing](#subclassing)
* [Lists of...](#lists-of)
    * [Runtime functions](#runtime-functions)
    * [Base classes](#base-classes)

<!-- /TOC -->

# Frameworks using
## Official Apple

* [OS](https://developer.apple.com/documentation/os?language=objc)
    * [Header files](https://github.com/phracker/MacOSX-SDKs/tree/master/MacOSX11.3.sdk/usr/include/os)
* [Network](https://developer.apple.com/documentation/network?language=objc)
* [XPC](https://developer.apple.com/documentation/xpc)

# Base class

The base class varies by framework.

# Memory management

OS-based objects are managed by ARC in Swift and the Apple Objective-C runtime. They also can be retained/released by the *framework name*`_retain` and *framework name*`_release` functions.

# Subclassing

Declaring a root class:
```objc
OS_OBJECT_DECL_CLASS(my_object)
```
Which turns into:
```objc
@protocol OS_my_object<NSObject>
@end
typedef NSObject<OS_my_object>* my_object_t;
```
Declaring a subclass:
```objc
OS_OBJECT_DECL_SUBCLASS(my_foobar, my_object)
```
Which turns into:
```objc
@protocol OS_my_foobar<OS_my_object>
@end
typedef NSObject<OS_my_foobar>* my_foobar_t;
```

# Lists of...
## Runtime functions

* [XPC objects](https://developer.apple.com/documentation/xpc/xpc_objects?language=objc)
* [Dispatch objects](https://developer.apple.com/documentation/dispatch/dispatch_objects)

## Base classes

* [`nw_object_t`](https://developer.apple.com/documentation/network/nw_object_t?language=objc)
* [`xpc_object_t`](https://developer.apple.com/documentation/xpc/xpc_object_t?language=objc)
* [`sec_object_t`](https://developer.apple.com/documentation/security/sec_object_t?language=objc)
* [`dispatch_object_t`](https://developer.apple.com/documentation/dispatch/dispatch_object_t/)