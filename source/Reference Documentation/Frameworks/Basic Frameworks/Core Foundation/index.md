# Core Foundation

```{toctree}
---
maxdepth: 2
caption: Contents
hidden: true
---
Missing.md
Object Model.md
Release Notes.md
```

Core Foundation includes C-based object-oriented APIs, with a similar focus to the [Foundation Kit](../Foundation/index.md). However, it also includes many classes that don't have a direct correspondent in Foundation, and many Foundation classes are missing. 

## Apple CoreFoundation

[API reference](https://developer.apple.com/documentation/foundation?language=objc)  
[Header files](https://github.com/phracker/MacOSX-SDKs/tree/master/MacOSX11.3.sdk/System/Library/Frameworks/CoreFoundation.framework/Versions/A/Headers)

## GNUstep CoreBase
Version 1.2.2 (There were a lot of commits after this release)

[Source code](https://github.com/gnustep/libs-corebase)

**Highly incomplete** -- you should probably use Swift CoreFoundation.

## Swift CoreFoundation
Two current versions:
* macOS Monterey ([d8e8a8b92b3a8af8381a11155328c1bba1c6bd2c](https://github.com/apple/swift-corelibs-foundation/commit/d8e8a8b92b3a8af8381a11155328c1bba1c6bd2c))
* Swift 5.5.3 ([491a217baa8a0ef4ae9c8603c434c069cc090c50](https://github.com/apple/swift-corelibs-foundation/commit/491a217baa8a0ef4ae9c8603c434c069cc090c50))


[Source code](https://github.com/apple/swift-corelibs-foundation/tree/main/CoreFoundation)

I don't know how to build this without building the entirety of Swift.

This is the **most complete** free implementation of CoreFoundation. However, it has **no Objective-C toll-free bridging** support.

PureDarwin has an [old modified version](https://github.com/PureDarwin/CoreFoundation).

The installation instructions from Lion / Darwin 11 are [here](https://raw.githubusercontent.com/apple-oss-distributions/CF/main/README_CFLITE).

You can browse the source code for El Capitan and earlier [on GitHub](https://github.com/apple-oss-distributions/CF/tags).