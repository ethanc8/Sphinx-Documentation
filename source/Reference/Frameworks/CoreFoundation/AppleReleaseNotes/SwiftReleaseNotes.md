# 10.11 and later

> The release notes for 10.11 and later are under the Apache License.


## Darwin 15 / 10.11 El Capitan

[Commit `a7b2b`](https://github.com/apple/swift-corelibs-foundation/commit/a7b2bc1fa48fc447c8b93f634b01a8ffcddd0337)

Initial implementation of Foundation.

This commit also contains:
* Import of CF-1253 ("El Capitan"), plus changes required to support this project.
* Initial build system.
* Basic framework for unit testing using XCTest.
* Starting point for documentation, including Getting Started, Known Issues, and major Design guidelines.

There is much more to come. See you on the mailing lists.
 Foundation Team

## Darwin 16 / 10.12 Sierra

### FOSS Subset

[Commit `a455cd`](https://github.com/apple/swift-corelibs-foundation/commit/a455cde38e06052385560d0a7c5aeb5a4991f844)

No release notes.

## Darwin 17 / 10.13 High Sierra

### FOSS Subset

[Commit `622c5`](https://github.com/apple/swift-corelibs-foundation/commit/622c5ff9cfead0871cf7028c6f7e6b6e196f4080)  
[Commit `df3ec`](https://github.com/apple/swift-corelibs-foundation/commit/df3ec55fe6c162d590a7653d89ad669c2b9716b1)

No release notes.

## Darwin 18 / Mojave

### FOSS Subset

[Commit `480ce`](https://github.com/apple/swift-corelibs-foundation/commit/480ceeb859a7ed600c758f0b3781ae89f8689b51)

No release notes.

## 10.15 Catalina

### FOSS Subset

[Commit `ad044`](https://github.com/apple/swift-corelibs-foundation/commit/ad0445fa5417b253c2b4330498a48aeabad0f52e)

This patch brings `swift-corelibs-foundation` closer to behavior parity with released versions of macOS Catalina and aligned Apple releases. Most of these changes are under-the-hood bug fixes or performance improvements, but a few may affect the behavior of your applications. In particular:

 - The deprecation of `NSURL.parameterString` is now also effective in Swift for Linux, with similar effects. This brings URL parsing in line with Catalina. Note that Swift for Linux does not support link checks, since there is no binary compatibility guarantee on Linux; this change will be effective to all application code running on Swift for Linux 5.3 or later.

 - Certain `CFXML`… types that have been deprecated on macOS are now removed, along with their associated implementation: `CFXMLInputStream`, `CFXMLNode`, `CFXMLParser`. Modern code should be using the `FoundationXML` module (or, on Darwin, the `XMLDocument` and related classes in Foundation) to parse documents.

## 11 Big Sur

### FOSS Subset

Big Sur's CF was never released to swift-corelibs-foundation.

## 12 Monterey

### FOSS Subset

[Commit `d8e8a`](https://github.com/apple/swift-corelibs-foundation/commit/d8e8a8b92b3a8af8381a11155328c1bba1c6bd2c)

This PR brings the FOSS portions of Core Foundation on par with macOS Monterey, iOS 15, watchOS 8 and tvOS 15. This includes the changes shipped during the previous releases.

Most of the changes include bug fixes and performance improvements, but some are useful to highlight:

 - This patch adds the Core Foundation code that underlies Foundation's `ListFormatter` and `RelativeDateTimeFormatter` to the FOSS subset.

 - Several Emoji fixes are included that update `CFString` (and thus `NSString` and the Foundation methods on `Swift.String`) support for correctly decoding and iterating over emoji introduced during the Big Sur and Monterey timeframes. The corresponding character maps in `CharacterSet`` have been updated.

 - Certain parsing functions, most notably those that implement property list parsing, now have a maximum recursion depth to prevent resource abuse from malicious input.

 - Some architectural changes have been introduced that are used on Darwin to support Pointer Authentication. For more information on the topic, see [Preparing Your App to Work with Pointer Authentication](https://developer.apple.com/documentation/security/preparing_your_app_to_work_with_pointer_authentication). Note that the FOSS subset does not ship on architectures that require this support, but the architectural changes have been merged for simplicity and synchronization between Darwin and FOSS builds.

 - Parameter checking has been improved for several CF functions.

 - Some implementations have been streamlined or consolidated, especially for `CFPlugIn` and `CFBundle`. `CFBundle` also adds support for "Wrapper"-style bundles (for example, the kind of bundle produced when installing iOS applications on Macs with Apple silicon).