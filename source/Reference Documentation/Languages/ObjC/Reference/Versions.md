# Language Versions

> **Note**: Versions before Stepstone 4.0 are missing.

> **Note**: In order to solve the confusing versioning scheme of Objective-C, this document uses its own versioning scheme which is similar to the current, extremely vague scheme.



## References

[Compiler release notes for NeXT Releases 3.0 to 3.3](http://www.cilinder.be/docs/next/NeXTStep/3.3/nd/ReleaseNotes/Compiler.htmld/index.html)

[Assembler, linker, etc release notes for Rhapsody 5.0 to Xcode 3.2.1](https://opensource.apple.com/source/cctools/cctools-845/RelNotes/CompilerTools.html)

[Objective-C Release Notes (Mac OS X Leopard)](https://developer.apple.com/library/archive/releasenotes/Cocoa/RN-ObjectiveC/index.html)

[*spec.language*, a Stepstone-internal document detailing planned user-visible changes to Stepstone Objective-C 4.0](https://dl.acm.org/doi/pdf/10.1145/3386332#page=53)

[Objective-C Feature Availability Index](https://developer.apple.com/library/archive/releasenotes/ObjectiveC/ObjCAvailabilityIndex/index.html)

[What's new in Xcode 4](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/WhatsNewXcode/Chapters/xcode_4_0.html#//apple_ref/doc/uid/TP40016147-SW1)

## v0.8 - Lowest Common Denominator

### Availability

#### Compilers

* Stepstone >= 4.0
* Portable Object Compiler
* NeXT GCC fork
* GCC since around 1992
* Clang

#### Runtimes

* Stepstone >= 4.0
* Portable Object Compiler
* NeXT/Apple with 32-bit ABI
* Apple with modern ABI
* GCC runtime
* GNUstep runtime

### Available features

* `#import` preprocessor directive
* `@interface`...`@end` class declarations
* `@implementation`...`@end` class definitions

## v0.9 - Categories

### Availability
#### Compilers

* NeXT GCC fork (was available sometime before 3.0)
* GCC (all versions with documentation on the GCC website)
* Clang

#### Runtimes

* NeXT/Apple with 32-bit ABI
* Apple with modern ABI
* GCC runtime
* GNUstep runtime

### New features since v0.8

* **Major feature: Categories**

## v1.0 - NeXT Release 3.0

This release introduces some C99 features.

### Availability

#### Compilers

* NeXT GCC fork >= 3.0 (based on GCC 1.93)
* GCC >= 2.0
* Clang

#### Runtimes

* NeXT/Apple with 32-bit ABI
* Apple with modern ABI
* GCC runtime
* GNUstep runtime

### Major new features

* Protocols

    * `@protocol`...`@end`
    * `<`...`>` syntax for declaring classes
    * New qualifiers for types that can only be used in protocol declarations: `in`, `out`, `inout`, `bycopy`, `oneway`.

* Interface variable access control

    * `@public` variables are accessible by anyone
    * `@protected` variables are accessible by defining class and subclasses
    * `@private` variables are only accessible by the defining class
    * default is `@protected`

### Changes since v0.9

* Forward declaration of classes (`@class`)


* `#warning` directive to complement `#error`
* `__attribute__`:

    * `aligned`
    * `format`

* New `@encode` encodings for `in`, `out`, `inout`, `bycopy`, `oneway`, `const`.

## v1.3 - Exceptions and synchronization

## v2.0 - 2007 - Leopard
### Resources
* [Wikipedia article](https://en.wikipedia.org/wiki/Objective-C#Objective-C_2.0)
* [Xcode 3.0 Release Notes](https://web.archive.org/web/20080517213700if_/http://developer.apple.com/releasenotes/DeveloperTools/RN-Xcode/index.html#//apple_ref/doc/uid/TP40001051-DontLinkElementID_2)
    * Objective-C has been enhanced with support for properties, fast enumeration, optional methods in protocols, and garbage collection.
* [Objective-C 2.0 Release Notes](https://developer.apple.com/library/archive/releasenotes/Cocoa/RN-ObjectiveC/index.html#//apple_ref/doc/uid/TP40004309)
* [Xcode 3.0 Advertisement](https://web.archive.org/web/20070629103804if_/http://www.apple.com/macosx/leopard/developer/xcode.html)
    * Enjoy modern garbage collection, syntax enhancements, runtime performance improvements, and 64-bit support.
* [GCC 4.6 Release Notes](https://gcc.gnu.org/gcc-4.6/changes.html#objective-c)

### Major new features

* Garbage collection
    * Didn't really take off, was replaced by Automatic Reference Counting
* Properties `@property`
    * Automatic getter and setter generation `@synthesize`
    * Dot notation `object.count` instead of `[object count]` and `[object setCount: ]`
* Non-fragile ivars (requires runtime support)
* Fast enumeration `for (id thing in myList)`
* 

## v2.1 - 2011 - ARC, Xcode 4.2

ARC, `@autoreleasepool`, completely private ivars

## v2.1.1 - 2012 - Xcode 4.3

## v2.2 - 2012 - Literals, Xcode 4.4

    Literals syntax is supported for NSArray, NSDictionary, and NSNumber objects, using the same ‘@’ operator as for NSString literals.

    Subscripting is enabled for Objective-C containers, including NSDictionary and NSArray. Use the ‘[ ]’ syntax convention.

    Objective-C @properties are synthesized by default when not explicitly implemented.

## v2.3 - 2015 - Xcode 7.0

* Nullability
* Lightweight generics
* Kindof types

## Unknown 2.x

https://developer.apple.com/library/archive/releasenotes/ObjectiveC/ModernizationObjC/AdoptingModernObjective-C/AdoptingModernObjective-C.html

* instancetype
* Enumeration macros
* Designated initializers
* 
