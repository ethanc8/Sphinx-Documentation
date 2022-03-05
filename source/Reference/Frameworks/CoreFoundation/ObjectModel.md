# Core Foundation Object Model
## Frameworks which use this model
### Official Apple
* [Core Foundation](https://developer.apple.com/documentation/corefoundation?language=objc)
* [Carbon (HIObject-based part)](https://web.archive.org/web/20080724151258/http://developer.apple.com/documentation/Carbon/Reference/HIObjectReference/Reference/reference.html)
* [Core Graphics / Quartz 2D](https://developer.apple.com/documentation/coregraphics?language=objc)
* [Core Media](https://developer.apple.com/documentation/coremedia?language=objc)
* [Address Book C interface](https://developer.apple.com/documentation/addressbook/c_types?language=objc)
* and more

## Base class

There are two base classes, [`CFType`](https://developer.apple.com/documentation/corefoundation/cftype?language=objc) and the deprecated [`HIObject`](https://web.archive.org/web/20080724151258if_/http://developer.apple.com/documentation/Carbon/Reference/HIObjectReference/Reference/reference.html)([Header with API docs](https://github.com/phracker/MacOSX-SDKs/blob/master/MacOSX10.13.sdk/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/Headers/HIObject.h)).

## Memory management

Core Foundation types are **not managed by Objective-C ARC, but are managed by Swift ARC**. In Objective-C, you must use the `CFRetain` and `CFRelease` methods to retain and release the objects.

## Subclassing

CoreFoundation does not provide a public subclassing API. Older versions had an [example of creating a subclass of `CFType` called `EXRange`](https://stackoverflow.com/questions/4541355/creating-a-custom-cftype/4541627#4541627). It looks like [`_CFRuntimeRegisterClass`](https://github.com/apple/swift-corelibs-foundation/blob/efedfc30e7ea2ce5e4db85e3869b9cb149273ad9/CoreFoundation/Base.subproj/CFRuntime.h#L107) will create a subclass of `CFType`.

[`HIObjectRegisterSubclass`](https://web.archive.org/web/20080724151258if_/http://developer.apple.com/documentation/Carbon/Reference/HIObjectReference/Reference/reference.html#//apple_ref/c/func/HIObjectRegisterSubclass) will create a subclass of any class derived from `HIObject`.

## Runtime

The runtime functions are private, and are in [`CFRuntime.h`](https://github.com/apple/swift-corelibs-foundation/blob/main/CoreFoundation/Base.subproj/CFRuntime.h).
