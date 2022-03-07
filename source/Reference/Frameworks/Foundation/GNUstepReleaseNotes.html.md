<span id="title$ReleaseNotes">GNUstep Base Release Notes</span>

===============================================================



### Authors



[Adam Fedor](http://www.gnustep.org/developers/whoiswho.html) ([`fedor@gnu.org`](mailto:fedor@gnu.org))  



[Richard Frith-Macdonald](http://www.gnustep.org/developers/whoiswho.html) ([`rfm@gnu.org`](mailto:rfm@gnu.org))  



<!-- **Version:** $Revision$



**Date:** $Date$ -->



**Copyright:** (C) 2005-2020 Free Software Foundation, Inc.



<!-- <span id="001000000000">Base Release Notes</span>

================================================= -->



The release notes include descriptions of API changes, behaviour changes and other information that might help developers and users migrate to using a newer version of the library.



<span id="001001000000">Version 1.28.0</span>
---------------------------------------------



Aside from an assortment of bugfixes, this release includes a lot of improvements for Windows support as well as numerous new classes and methods.



Not every bugfix, improvement or a new feature will be listed here.



  

Added new `ASSIGNMUTABLECOPY()` macro for consistency with `ASSIGNCOPY()`.  

Replaced character set data headers for URLs with loading these from a standard data source, and updated bitmap representation to use much less space for character sets residing wholly in the base plane, such as the URL charsets (given they are purely ASCII).  

Updated character set data with newer Unicode data set.  

`[NSURLProtocol -initWithRequest:cachedResponse:client:]` will now retain the client up until the last message is sent to it, which improves compatibility with OS X.  

Percent-escaping code in `NSURL` simplified.  

Removed mixed ABI support.  

Use of Apple runtime now assumes non-fragile ABI (which is true on modern systems).  

Improve typing on method implementation pointers in some classes.  

In `NSHTTPCookie`, rewritten code for extracting individual cookies from the HTTP header.  

In `NSKeyedArchiver`, implement secure coding methods.  

New methods in `NSDateComponents`.  

Improvements in `NSCalendar` and `NSLocale` for calendar locale and `NSDateComponents`.  

In `NSFileManager`, use `utimensat()` to set file modification date, if available.  

Correctly stop parsing number being decoded in `NSJSONSerialization` when encountering a number with an invalid exponent.  

Improve OS X compatibility for `NSURLQueryItem` initializers.  

For `NSFileManager`, in `changeFileAttributes`, implement setting creation date for Unix-like systems. Implement reading the creation date if a supported method was detected.  

Support reading Android assets from the main bundle in `NSInputStream`.  

Support Android assets directories in `NSBundle` and `NSFileManager`.  

Implement `-[NSXMLParser initWithStream:]`.  

Allow clearer choice between 'sloppy' `GSSloppyXMLParser` used in `NSXMLParser` and the libxml2-based `GSStrictXMLParser`.  

Fix building Win32 implementations for `GSFileHandle` and `NSMessagePort` with nonfragile ABI.  

Use `NSNumber` and not `NSString` in `-[NSUserDefaults setBool:forKey:]`.  

Posting notification before `NSThread` exit.  

Actually declare optional `NSFilePresenter` methods as optional.  

In `NSConcreteMapTable`, fix replacing existing values in a weak objects map table.  

Fix leaks in `NSOperation`.  

Various compat fixes for various MSYS systems, particularly around sockets code.  

In `NSData`, `NSFileManager` and more, various improvements when overwriting and creating files with respect to file attributes (owners, creation timestamp, etc).  

Improve `NSLog` output on Android.  

Use `instancetype` in `NSURLRequest` header.  

Define `NSAttributedStringKey` and `NSNotificationName`.  

Add new `NSURL` methods.  

In `GSMime`, have `-contentFile` check the `Content-Type` header before checking `Content-Disposition`.  

Fix a bug linking with WEAK symbols where binutils 2.3.5 would fail to link due to not all expected symbols being exported.  

New `plutil` utility.  

Implementation of `[NSData rangeOfData:options:range:]` which finds the `NSRange` in which the passed data occurs.  

Change `ENTER_POOL`/`LEAVE_POOL` so they no longer wrap the enclosed code in a loop, enabling use in some loops.  

New 10.5 methods in `NSRunLoop`/`NSURLConnection`.  

Improve compatibility when building with ICU 68.  

Fix compiling libdispatch integration of `NSRunLoop` on Windows.  

Add support for building on Windows with MSVC's Clang by passing the `configure` flag `--host=x86_64-pc-windows`. Use of an MSYS2 shell without `-devel` packages is recommended.  

Implementation of `NSURLSession` and related classes. This adds some dependencies on more recent versions of `libcurl`, `libdispatch` etc.  

Fix initializing `NSUUID` from a string.  

Disable use of `libcurl` if its headers are not found.  

In `NSURLProtocol`, continue writing data if not all of it was written.  

Fix use of GnuTLS under MinGW by using `send/recv` rather than `read/write`.  

Add support for libobjc2 runtime on Windows.  

Fix BOM insertion when generating data from a string using one of the Unicode encodings.



<span id="001002000000">Version 1.27.0</span>
---------------------------------------------



Aside from an assortment of bugfixes, this release includes a lot of improvements for Android support as well as numerous new classes and methods.



Expose GNU TLS wrappers and add methods to get certificate expiry.  

Improve thread safety when using zombies, particularly on statup/shutdown.  

Improvements for Ukrainian localization.  

Decreased ICU requirements to 49 to support Windows 2000.  

Simplifications and fixes in GSPrivateSymbolPath().  

GSMime improvements (word encoding specifier, utf-8 improvements encoding quoted words with multibyte characters)  

NSJSONSerialization fixes for codepoints over 0x7f.  

NSCharacterSet support for URL\*AllowedCharacterSet and declarations for new character sets.  

NSString implementations for new methods stringByRemovingPercentEncoding/ stringByAddingPercentEncodingWithAllowedCharacterSet:.  

Fixed a crash in gdomap when an invalid hostname is given for the -M option.  

In NSString.m, removed functions urldecode() and ishex() which were mistakenly neither namespaced nor declared static and thus could have conflicted with non-library code.  

Fixed libdispatch configuration switch so --enable-libdispatch works correctly; correctly checking for HAVE\_LIBDISPATCH\_RUNLOOP.  

Updated libdispatch runloop integration so it is compatible with Swift's corelibs libdispatch release (from github.com/apple/swift-corelibs-libdispatch). The libdispatch must be compiled with INSTALL\_PRIVATE\_HEADERS=YES.  

In NSThread, spinlocks implemented using builtins to be able to target platforms without pthread\_spin\_lock(), such as Android targeting API level &lt; 24.  

In NSLog on Android, send logs to syslog.  

Implementation of NSOrderedSet.  

When ./configuring, link against libandroid on Android.  

In NSBundle, allow integrating with Android asset manager using +\[NSBundle setJavaAssetManager:withJNIEnv:\], enabling use of mainBundle's pathForResource:ofType:, -URLForResource:ofType: and similar; referencing Info.plist if it exists in Android assets; use of NSFileManager's fileExistsAtPath: et al and isReadableFileAtPath:; reading files using NSFileHandle APIs; use of NSDirectoryEnumerator to enumerate Android assets from the main bundle.  

In NSBundle, localization support on Android.  

In NSProcessInfo, automatic initialization on Android using a fake executable path (/data/data/&lt;app identifier&gt;/Resources).  

In NSData, improvements in reading Android assets.  

Various improvements in the mechanism to report memory usage of individual objects.  

Skeletal implementation of NSUbiquitousKeyValueStore.  

Implementation of NSByteCountFormatter.  

Fixes to writing large HTTPS requests (GSSocketStream, NSURLProtocol).  

In gdomap.c, fix detection of local networks.  

In NSArray's -removeObjectsInArray:, prevent some crashes.  

In GSTLS, avoid setting session priority twice.  

In NSFileHandle, fix so that setting certificate information does not discard any other options already set.  

In GSXML's -fatalErrorFunction, use the correct function to get the line number.  

In NSOperation's \_execute, ensure lock gets released on an error by surrounding with NS\_DURING.  

Generics support in NSHashTable.  

Implementation of NSProgress.  

Skeleton implementation of NSURLComponents.  

In NSSortDescriptor, added -sortDescriptorWithKey:ascending:descending:.  

In NSOperationQueue, added -addOperationWithBlock.  

In NSFileManager, added -URLForDirectory:inDomain:appropriateForURL:create:error: and -enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:. Also added NSItemReplacementDirectory constant, and updated stub implementation for -URLForDirectory:shouldCreate:error:. Added -initWithDirectoryPath:... with additional parameters skipHidden and errorHandler.  

In NSDictionary, fixed keysSortedByValueUsingComparator:.  

Moved NSFileWrapper from -gui to -base.  

Added NSFilePresenter, NSFileVersion and NSFileCoordinator.  

Added NSPersonComponents and NSPersonNameComponentsFormatter.  

Added units of measurement classes such as NSUnit, NSMeasurement, NSMeasurementFormatter, NSEnergyFormatter, NSLengthFormatter, NSMassFormatter.  

In NSUnit, support for NSUnitArea, NSUnitConcentrationMass, NSUnitDispersion, NSUnitElectricCharge, NSUnitIlluminance, NSUnitElectricCurrent, NSUnitElectricPotentionDifference, NSElectricResistance, NSUnitMass, NSUnitEnergy, NSUnitFrequency, NSUnitPower, NSUnitSpeed, NSUnitFuelEfficiency, NSUnitPressure, NSUnitVolume, NSUnitLength.  

Support for data directory on Android introduces GSInitializeProcessAndroid and makes use of the path returned by Context.getFilesDir() as the basis for storing data (e.g. NSUserDefaults) and when querying for directory paths (NSLibraryDirectory, NSApplicationSupportDirectory, etc.).  

Placeholder NSScript\* classes. Added NSUserActivity, NSObjectScripting, NSHFSFileTypes, NSAppleEventManager and NSAppleEventDescriptor.  

Added NSDateInterval intersectionWithDateInterval:.  

Added NSBackgroundActivityScheduler.  

Added NSISO8601DateFormatter and NSMetadataAttributes.  

Added NSOrtogrpahy and NSLinguisticTagger.  

Added NSExtensionItem, NSExtensionContext, NSExtensionRequestHandling, and NSItemProvider and NSItemProviderReadingWriting.  

Updated timezone info for NSTimeZones.  

On Android, support for NSTemporaryDirectory to use Context.getCacheDir(), and cleaning it up in GSInitializeProcessAndroid() given there is no support for temp directory before Android API 26. Also used with NSCachesDirectory + NSUserDomainMask.  

NSXPCConnection fixes.  

NSException symbolication support using libunwind (used when backtrace() is unavailable).  

Travis build improvements to use new runloop integration and gnustep-2.0 runtime.  

In NSKeyValueObserving, implement two missing methods for NSArray: -addObserver:options:context: and -removeObserver:fromObjectsAtIndexes:forKeyPath:.  

Updated NSUUID to use instancetype.  

Added support for NSDate constants in NSPredicate.  

Fixed a NSTimer bug with blocks.  

In GSTLS, do not put password in the hash key of the credentials, and to avoid logging it when debugging is on.  

Improvements in NSConcreteHashTable and NSConcreteMapTable.  

In various places, switch away from deprecated CREATE\_AUTORELEASE\_POOL() to use the ARC-compatible ENTER\_POOL and LEAVE\_POOL macros.  

When building the list of hosts to be probed to see if they have gdomap servers, fix code to include those explicitly defined in the config file. Add -S option to list the addresses of the known gdomap servers.  

Backward compatibility fix for ICU 65.  

Update GSPrivateSymbolPath() so that, on the path where LINKER\_GETSYMBOL is not available, we attempt to lookup classes using the prefix .\_OBJC\_CLASS\_ for the 2.0 ABI (earlier ABIs use a prefix of \_\_objc\_class\_name\_ for the class definition.  

Fix parsing of NSURLResponse content type header.  

Fix for class lookup when using the 2.0 ABI.  

Fixed NSURLComponents setURL: throwing exceptions when URL didn't have all expected parts caused by rangeOfString: throwing for nil values.  

Added NSURLQueryItem implementation.



<span id="001003000000">Version 1.26.0</span>
---------------------------------------------



A new stable release.  

Improve utf8 validity checks.  

Make point and size subclasses for NSValue interchangable.  

Add support for TLS SNI. Always request certificate from client and update certificates after 5 minutes.  

Don't write deprecated fields to desktop link file.  

Use NSLock instead of GSLazyLock and other improvements for multithreaded processes.  

Clean up of NSString cluster.  

Update NSAssert() and NSCAssert() to handle variable arguments (as OSX has done) and mark the numbered macros as obsolete.  

Various improvements in tests.  

Require ICU &gt;= 50.  

ICU is now detected using pkg-config.  

Improve XML parsing.  

Make NSXMLNode ivar a union representing different types, instead of assuming it will contain different underlying class types in different contexts. This is important for the new libobjc2 ABI.  

OSX compatibility changes to NSURL.  

NSFileManager call error handle on missing file.  

Dummy spinlock implementation for platforms that don't support it.  

Internationalization improvements: Japanese translation, Turkish translation, Polish translation.  

Various improvements for new libobjc2 "v2 ABI", including things like a new NSConstantString implementation, making GS\_REPLACE\_CONSTANT\_STRING a noop with the new ABI, etc.  

Improvements for stack traces, exception handling and dead lock detection.  

Other more minor bugfixes and cleanups. Many found by Coverity scan results.  

As usual, this release also contains an update to include the most recent international timezone data.



<span id="001004000000">Version 1.25.1</span>
---------------------------------------------



A new stable release.  

Unicode fixes for characters outside the base plane  

Stubs for some new OSX methods  

Various new OSX compatibility macro and type definitions  

NSFileManager fixes and tweaks to match OSX implementation  

NSDistributedLock bugfix for pre-existing lock directories  

Alternative sort algorithms selectable at runtime  

Compatibility-related changes for environments not supporting weak symbols  

Other more minor bugfixes and cleanups.  

As usual, this release also contains an update to include the most recent international timezone data.



<span id="001005000000">Version 1.25.0</span>
---------------------------------------------



A new stable release.  

Removes garbage collection support (though for now the NSGarbageCollector class remains as a stub).  

Changes multi-architecture support to match the scheme used by Debian.  

OpenSSL bundle removed since it didn't match GNUTLS support.  

Improved support for 64bit little-endian systems.  

Ported to Debian/Hurd.  

ICU string (regexp in particular) fixes.  

OSX compatibity changes in NSRunLoop behavior and NSTask.  

Alternative sort algorithms selectable at runtime.  

Many bugfixes and cleanups.  

As usual, this release also contains an update to include the most recent international timezone data.



<span id="001006000000">Version 1.24.9</span>
---------------------------------------------



A new stable (bugfix) release.  

Niels added support for generics.  

Support for 'ng' runtime library (latest language features enabled)  

Performance optimisations and improved diagnostic messages.  

Garbage Collection deprecated (support to be removed).  

As usual, this release also contains an update to include the most recent international timezone data.



<span id="001007000000">Version 1.24.8</span>
---------------------------------------------



A new stable (bugfix) release.  

The release contains a variety of bugfixes as well as some performance optimisations (particularly in the use of tiny string objects by the new objc runtime on 64bit systems).  

Thread naming and logging of threads by NSLog() has been made consistent with the latest OSX releases, making debugging of multithreaded code a little easier.  

Sergei Golovin has added NSURLConnection regression tests (while fixing a few bugs there).  

As usual, this release also contains an update to include the most recent international timezone data.



<span id="001008000000">Version 1.24.7</span>
---------------------------------------------



A new stable (bugfix) release.  

The release has various platform/portability tweaks, as well as a variety of bugfixes.  

The default HTTPS connection configuration is modified to disable SSLv3.0 support (to prevent the 'POODLE' security attack).  

This release also contains an update to include the most recent international timezone data.



<span id="001009000000">Version 1.24.6</span>
---------------------------------------------



A new stable (bugfix) release.  

This release contains a new class (NSUUID) and several new methods.  

The OSX version compatibility macros have been updated to add the latest version of OSX.  

The release has various platform/portability tweaks, as well as a variety of bugfixes.



<span id="001010000000">Version 1.24.5</span>
---------------------------------------------



A new stable (bugfix) release.  

The main reason for this version is to release a collection of minor bugfixes before making more extensive changes which will break ABI compatibility and appear in a 1.25 branch.  

This release contains a new class (NSInvocationOperation) and a few new methods.  

The OSX version compatibility macros have been updated to permit use of the same numeric values as on OSX.  

The release has been through the clang static analyzer (with minor issues resolved) and has had clang's printf format checking used to correct issues (mostly with NSInteger/NSUInteger on 64bit systems) with printf formats in various debug/logging messages.  

Timezone data was updated for this release.



<span id="001011000000">Version 1.24.4</span>
---------------------------------------------



A new stable (bugfix) release.  

The main reason for this version is the inclusion of the latest available time zone data (something accidentally omitted from the previous release).  

Most of the other changes in this version are fairly minor portability and bugfixes (and the addition of a number of new testcases).  

API changes are limited to the addition of a few OSX-10.7 methods for NSCalendar and a few new NSFileManager methods for working with URLs.  

Finally, there is experimental code to change the hashing algorithm used in the library ... enabling it will cause slower hash generation but a better distribution of hash values ... which might improve the performance of large collections.



<span id="001012000000">Version 1.24.3</span>
---------------------------------------------



A new stable release.  

Many changes in this version are behavior updates/improvements but there are also new APIs, none of which should effect binary compatibility with earlier 1.24.x releases.  

An important change at the configure stage is that configure policy now requires you to explicitly disable features in order to build if external packages that those features depend on are missing. This should ensure that builds of base contain consistent feature sets unless you really want to change that.



The main changes are:  

Implementation of the NSXML DOM classes (previously stubs). This is by far the biggest chunk of new code in this release. The DOM support has a dependency on the libxml2 library.  

Implementation of cookies in the NSURLConnection related classes.  

Implementation of common HTTPS support in the NSURLConnection related classes and the older NSURLHandle. The HTTPS support has a dependency on the gnutls library.  

Implementation of new sorting code for faster sorting and to allow sorting algorithms to be changed.  

Many changes to add support for ObjectiveC-2.0 additions.  

Implementation of Encoding/Decoding of NSAffineTransform.  

Many, many minor bugfixes and tweaks.



<span id="001013000000">Version 1.24.0</span>
---------------------------------------------



A new stable release.  

Most changes in this version are behavior updates/improvements rather than new API, but you should be aware that there is a binary incompatibility on 64bit systems in that the value of the NSNotFound constant there is now 64bits rather than 32bits.



With this release the official supported compiler for GNUstep is gcc-4.0 and later, and the base library has been tested using recent gcc development snapshots.



The main changes are:  

Support for the GNU LANGUAGES environment variable and other locale improvements.  

Caching of file and directory path information within bundles.  

IPV6 support for NSHost and networking operations.  

Support for UTF-8 string literals in source (compiler permitting).  

Improved support for building standalone application bundles.  

And of course, lots of bugfixes and OSX compatibility tweaks.



One this that didn't make it into this release was functioning NSXML DOM classes. For DOM style work you still need to use the GSXML classes, however there is active work on implementing NSXMLNode and friends as wrappers round the corresponding libxml2 classes, and we hope/expect these to be ready soon.



<span id="001014000000">Version 1.23.0</span>
---------------------------------------------



A new stable release with many minor bugfixes and tweaks.  

The main changes however are David Chisnall's work adding support of the clang compiler and Objective-C 2.0 language/runtime (the compiler/runtime combination now provides full support for the Objective-C 2.0 language).  

Garbage collection using clang and libobjc2 is now available in addition to the existing gcc runtime garbage collection support.  

Going beyond that, for people who don't like garbage collection, there is now support for automated reference counting, where the clang compiler adds reference count calls to manage object lifetimes, relieving the application developer from the need to manage reference counts.



An important point to note is that this is the last release to support the gcc-2.9.5 compiler. In future, while releases may work with older systems, the formal requirement will be a gcc-4.x series compiler or later and base may also depend on support for the C99 standard being available.  

This change is being made in order avoid developers needing to spend a great deal of time keeping code working for obsolete systems which are no longer used in practice.



<span id="001015000000">Version 1.22.0</span>
---------------------------------------------



A new stable release with many updates and changes. In addition to many new classes and methods, there is now a regression test framework included in the base release.



In addition, base now supports and uses the Objective-C 2.0 runtime API from Apple and we encourage anyone programming with GNUstep to move to using this new runtime and the new functionality it supports. Note however, there is currently no compiler/runtime combination that completely supports the Objective-C 2.0 specification, but we would recommend the following:



-   gcc (pre 4.6) and GNUstep libobjc is the preferred compiler/runtime for stability (best tested)

-   gcc 4.6 and GNU libobjc for experimental ObjC2 with garbage collection but without blocks

-   clang and GNUstep libobjc2 for experimental ObjC2 without garbage collection but with blocks.



New Test Framework  

Please look at the README file in the TestFramework directory of the make package for more information on how to use and write test cases.



NSTimeZones  

Updated with the latest zone info.



NSNumberFormatter and NSDateFormatter  

Implemented a number of methods.



NSLocale and NSCalendar  

Initial implementation of these classes. The libicu 4.0 library is now required for full operation of these classes.



NSNumber  

Fix the +numberWith... methods to work for subclasses of NSNumber rather than creating instances of the default class.



NSFileManager  

Implemented a few new methods



NSSet  

Add block enumeration



NSOperation  

Implement support for concurrent operations



NSRegularExpression  

Also requires libicu for full functionality.



NSTimeZone  

Implement some more methods



NSNetServices  

Implement avahi-based services



<span id="001016000000">Version 1.21.1</span>
---------------------------------------------



This is an unstable snapshot release but is functionally identical to the 1.20-1 stable bugfix release, made to ensure that the latest available snapshot version of the unstable branch is at least as up to date as the latest stable release.  

The changes in this release are a timezone handling update to the latest zone information, various minor bug fixes and portability updates, some small cleanups and optimizations, a few tweaks to help packagers, and finally an alteration to the additions library on OSX to add a category to re-enable serialization of property lists in the more readable and compact OpenStep format (something the most recent versions of OSX lost).



NSAttributedString  

Fixes for keyed archiving/unarchiving.



NSData  

Improve reading of non-standard files (eg /proc filesystem).



NSHashTable  

Fix minor buffer overrun.



NSInvocation  

Fix for problem with FFI when caching the method implementation of a proxy.



NSNumber  

Fix the +numberWith... methods to work for subclasses of NSNumber rather than creating instances of the default class.



NSKeyValueCoding  

Fix -isKey for KVC compliance.



NSPropertyList  

Fix whitespace handling in XML property lists.  

Allow OpenStep style property lists to be written on OSX.



NSTimeZone  

Update to latest zone information.  

Update list of timezone abbreviations.  

Improve diagnostics when no timezone is set.



GSObjCMethodNames  

Fix broken implementation.



ObjectiveC2 compatibility  

Bugfix for selector lookup issue.  

Working implementation of checks for conformance to protocols.



Installation of gdomap  

The installation process used to install gdomap setuid to root by default (for developers/hackers) and packagers were supposed to change that to not be setid, and start gdomap as root at system boot time. But packagers weren't doing that. The installation is now changed to install non-setuid by default giving packagers more of an incentive to start gdomap properly.



Update of fake-main mechanism  

The fake-main mechanism for obtaining program arguments and environment requires the library to link to the gnustep\_user\_main function in any program which uses it. This caused problems where a distribution packaging system refuses to allow unresolved link symbols in a library. The code was reworked to use a weak reference to a local function, avoiding this problem.



<span id="001017000000">Version 1.21.0</span>
---------------------------------------------



This is an unstable release synchronized with the 1.20.0 stable release. There have been major changes and reorganizations to support, among other things, the new non-fragile ABI from clang. These changes, although they break binary compatibility with previous releases, should allow all future releases to maintain compatibility.



Objective-C 2  

Add compatibility code for Objective-C 2.0 when it is not provided by the compiler or objc library. Some runtime wrappers for Objective-C have been deprecated in favour of new 2.0 API.



Additions library  

Reorganized so all GNUstep extensions are in the Additions library files.



Mac OS X Compatibility  

Various improvements for compatibility including use of NSInteger/NSUInteger/CGFloat



non-fragile ABI  

Support added for this ABI from clang includes additions of an extra ivar for future expansion and hiding of ivars in some classes.



NSOperation  

Complete NSOperation and NSOperationQueue (compatible with 10.6 apart from blocks).



Fast Enumeration  

Support was added.



NSLock  

Complete rewrite of NSLock so they are faster, more complete and OS X-compatible. NSLock now depends on POSIX threads.



<span id="001018000000">Version 1.19.3</span>
---------------------------------------------



This is a new unstable snapshot release of the base library almost identical to 1.19.2 but containing a bugfix for the introduction of a change in the behavior of NSURL's -path method to match OSX. We add a new -fullPath method which returns the actual path of the URL the way the old -path implementation did. This is necessary because the OSX behavior is to strip any trailing '/' from a path so that it's no longer possible to reliably build a URL string from its component parts.



<span id="001019000000">Version 1.19.2</span>
---------------------------------------------



This is a new unstable snapshot release of the base library. It may contain minor binary incompatibilities with the previous unstable release, but should generally work with software compiled for that release.



This is primarily intended as a bugfix release prior to major rewrite of NSLock code by David Chisnall. As such, most changes are bugfixes and performance tweaks. Some of the main ones are listed below.



NSCalendarDate  

Add OSX compatible field widths in date formats.



NSCharacterSet  

Uses a much more compact internal representation to decrease the memory footprint of applications which make extensive use of character sets.



NSFileHandle  

Fixes for socket connections on mswindows.



NSRunLoop  

Adds OSX compatibility changes with timers acting like input sources for determining blocking.



NSString  

Performance improvements converting between 8bit and 16bit character representations.



NSURL  

Support file URLs on mswindows. Include 'Host' header in requests to conform to W3C standards.



NSUserDefaults  

Fixes for improved thread safety. Now stores to file in XML format.



Key Value Coding/Observing  

Various improvements for OSX compatibility.



<span id="001020000000">Version 1.19.1</span>
---------------------------------------------



A great deal of improvements have occurred recently. This includes many improvements in garbage collection (first to get it working again). Also many Mac OS X 10.5 methods and classes have been added, as well as compatibility improvements.



NSData  

Implemented new Mac OS X methods for writing data.



NSFileManager  

Fix -fileOwnerAccountID and -fileGroupOwnerAccountID to return the correct type.



NSHashTable, NSMapTable  

New Mac OS X 10.5 API classes.



Garbage Collection  

Get GC working again. Fixes in various classes to work better with GC.



Mac OS X 10.5 Return Types  

Methods have been converted to use return types and arguments of NSInteger, NSUInteger and CGFloat. For now, these types are equivalent to the old types. This can be changed in NSObjCRuntime.h so that integer types are the same size as a pointer, and the float type is actually a double on 64bit processors.



NSArray  

New methods for inserting objects with NSIndexSet



<span id="001021000000">Version 1.19.0</span>
---------------------------------------------



This is a new unstable release of the base library. Note that gnustep-core is now installed in the LOCAL domain by default instead of the SYSTEM domain. You may want to remove old installations in the SYSTEM domain to avoid any incompatibility problems. Or you can force installation in SYSTEM using make GNUSTEP\_INSTALLATION\_DOMAIN=SYSTEM install.



NSBundle  

Improve lookup of versioned library resources and improve location of resources based on the location of the executable under ms-windows.



NSConnection  

Adds a new keepalive mechanism to check connections at periodic intervals to see if the other end is still there. This is enabled for message ports on ms-windows, where the operating system does not inform us when the other end goes away, and is not needed on the socket based connections on Unix.



NSException  

Implement full support for native objective-c exceptions, though this requires a fix for the objc runtime which is not yet available in gcc. The patch for the runtime can be found at http://gcc.gnu.org/bugzilla/show\_bug.cgi?id=27466



NSTask  

Adds a new method in a category in the Additions library ... The +launchPathForTool: method will locate a named tool by looking in all the standard locations in the USER, LOCAL, NETWORK and SYSTEM domains, and also by looking in PATH.



Portability and compatibility work  

There are various minor changes to improve portability (both improved configuration/detection of system software and runtime improvements) to different operating systems such as 64bit ms-windows. There are also various improvements to MacOS-X compatibility.



@synchronize  

Implementation of runtime support for @synchronize.



<span id="001022000000">Version 1.15.4</span>
---------------------------------------------



This is an unstable release.



NSArray  

New OSX method stubs.



NSAutoreleasePool  

Dummy OSX method (-drain).



NSBundle  

New OSX method stubs.



NSCoder  

New OSX10.5 methods for NSInteger implemented.



NSConnection  

New OSX10.5 methods for server connections implemented.  

A keepalive facility so that daemons can tell (on mswindows) that all client processes have gone away, and shut themselves down.



NSData  

New OSX method stubs.



NSException  

Implement stack address reporting.



NSIndexSet  

Add OSX10.5 stub for countOfIndexesInRange



NSKeyvalueObserving  

OSX10.5 additions implemented



NSSet  

Implemented new OSX methods.



NSStream  

Implemented basic SSL/TLS support using gnu-TLS.



NSThread  

Implemented new OSX methods.



NSLock, NSRecursiveLock, NSConditionLock  

Implemented names.



GSXML, NSXMLParser  

Fully support namespace handling and fix bugs.



NSKeyValueCoding, NSKeyValueObserving  

Made fully functional and MacOS-X compatible.



Windows 64bit  

Changes so that the library can be built/used for 64bit windows.



@synchronize  

Support for new ObjC language feature.



The current emphasis of the base library is MacOS-X compatibility, and the headers in this release mark many non-MacOS-X methods as being scheduled for removal by the next unstable release (from 1.17.0).  

These methods will mostly be moved to the 'additions' library, (which can be built stand-alone in conjunction with the Cocoa Foundation framework as libgnustep-baseadd on OSX) and their declarations will be in the headers of that library (&lt;GNUstepBase/...&gt;) rather than in the *Foundation* directory.  

NB. The markup in the headers and documentation should not be assumed to be exhaustive ... it is planned that the next stable release of the base library will enforce MacOS-X compatibility by default, and you will have to explicitly include headers from &lt;GNUstepBase/...&gt; in order to use GNUstep specific additions.  

You should track the unstable branch of the base library (subversion trunk) to find out what changes your software actually needs to make.



The TODO list for MacOS-X 10.5 compatibility follows, this is all stuff which would ideally be done by the next stable release of this library.



-   Remove all non OSX10.5 declarations from standard headers

-   Implement most new method stubs.

-   Implement new OSX10.5 NSCalendar class.

-   Implement new OSX10.5 NSLocale class.

-   Implement new OSX10.5 NSOperation class.

-   Implement new OSX10.5 XML classes.

-   Implement NSInteger coding for NSCoder subclasses.

-   Implement support for now enumerated values in NSComparisonPredicate.

-   Implement new OSX10.5 features of NSDateFormatter.

-   Implement new OSX10.5 features of NSExpression.

-   Implement new OSX10.5 features of NSPredicate.

-   Implement new OSX10.5 features of NSFileManager.

-   Implement new OSX10.5 features of NSProcessInfo.

-   Implement new OSX10.5 NSHashTable class.

-   Implement new OSX10.5 NSMapTable class.

-   Implement new OSX10.5 NSPointerArray class.

-   Implement new OSX10.5 NSLocale additions.

-   Implement new OSX10.5 features of NSNumberFormatter.

-   Implement new OSX10.5 features of NSNumber/NSValue.

-   Update NSDistributedNotificationCenter with new OSX methods.



<span id="001023000000">Version 1.15.3</span>
---------------------------------------------



This is an unstable release.



Configuration/NSUserDefaults  

Syntax within the configuration file extended so that a leading '../' in a path name denotes a relative path in a relocatable installation.  

New 'GlobalDefaults.plist' file in the same directory as the main GNUstep config file allows packagers/sysadmins to set up global defaults easily.



NSStream  

Addition of TLS/SSL support using GNU TLS on both unix-like and mswindows systems. First draft.  

Additions of SOCKS proxying support for socket streams. First draft.



NSURLConnection  

Added support for https using new stream code.  

Added support for basic and digest authentication.



<span id="001024000000">Version 1.15.2</span>
---------------------------------------------



This is an unstable release. Bug fixes include improved thread safety and Key-Value observing.



NSException  

New MacOS X methods and improved stack trace.



NSThread  

New methods from Mac OS 10.5 and new ivars



NSDecimal and NSDecimalNumber  

Many improvements



<span id="001025000000">Version 1.15.1</span>
---------------------------------------------



This is an unstable release. There have been many bug fixes, but also a few method additions and changes to some headers. Also the license for this release is now GPLv3 and LGPLv3.



NSUserDefaults  

Stores YES or NO as a string for MacOS X compatibility.



NSErrorRecoveryAttempting  

Added header (and some support in the GUI library).



NSArray  

Added some new methods to handle multiple objects.



Key-Value Coding  

More support for key-value coding.



NSPredicate  

Much improved parsing. Ivars have changed in some of the predicate classes.



<span id="001026000000">Version 1.15.0</span>
---------------------------------------------



This is an unstable release from 1.14.0. It is otherwise identical to the 1.14.0 release. Releases in the 1.15 series may not be forward compatible with previous 1.15 releases.



<span id="001027000000">Version 1.14.0</span>
---------------------------------------------



This is a stable release ... all programs linked with earlier versions of the library and wishing to use this latest stable release need to be rebuilt from source.  

This release should be used in conjunction with the latest stable release of the other gnustep core components.



This release continues the process of cleanup and restructuring to further improve MacOS-X compatibility, fix bugs, optimize performance, and improve portability between different hardware/operating system platforms.



NSAffineTransform  

Imported from GUI library for MacOS-X compatibility.



NSBundle  

Implemented library resource versioning.



NSException  

Support provision of stack trace information in exceptions.



NSObject  

Fixes for lock contention with retain/release, so the performance of massively multi-threaded applications is much better.



NSNetServices  

New MacOS-X class implemented.



NSPathUtilities  

Uses new gnustep-make features to provide native filesystem integration.



NSPropertyList  

XML property list parsing supported even if libxml2 not available.



NSSpellServer  

Imported from GUI library for MacOS-X compatibility.



NSValueTransformer  

New MacOS-X class implemented.



<span id="001028000000">Version 1.13.1</span>
---------------------------------------------



This is a bugfix release improving the stability and security of applications using the base library. Programs dynamically linked with the existing stable release will automatically benefit from these changes once this version is installed.



NSBundle  

Fix for crash when initializing the bundle system in an application linked with many frameworks.



NSCalendarDate  

Fix for buffer overrun problem when initializing date from string. Also fixed to return nil when initializing from some illegal strings.



NSConnection  

Some locking fixes to avoid rare deadlocks in heavily multi-threaded applications.



NSDecimalNumber  

Fix to handle current locale properly when initializing.



NSIndexSet  

Fix bug adding indexes in a range which lies within a range already in the set.



NSPropertyList  

Fix problem writing negative numbers into old-style property list.



NSString  

Fix for problem with keyed archiving of simple strings.



NSURL  

Fix a potential repeated load of the same resource. Also fix to return nil when initialised with a string which does not contain a URL scheme.



NSURLHandle  

Improve handling of persistent connections when the remote host drops the connection unexpectedly.



GSXML  

Fix bug causing removal of newline characters from escaped strings. Fix error setting start end end element for SAX.



<span id="001029000000">Version 1.13.0</span>
---------------------------------------------



Several sets of classes have been added for dealing with URLs and predicates. A few minor api changes have occurred as well.



Character sets  

Character sets were improved with regard to ranges (Chinese characters, etc).



Keyed Archiving  

Better compatibility with MacOSX. In particular, some guesses are made as to how some objects should be encoded.



GNUstep configuration file  

Extra keys are allowed in the configuration file with the definition of the GNUSTEP\_EXTRA key.



URL Loading  

Headers and a basic framework for Apple's new URL loading scheme were added, although this is not fully implemented yet.



Objective-C++  

Most of the code was updated to compile nicely with the new gcc objective-c++ compiler.



NSString designated initialiser  

The GNUstep designated initialiser for the NSString class cluster has changed to `-initWithBytesNoCopy:length:encoding:freeWhenDone:` from `-initWithCharactersNoCopy:length:freeWhenDone:` and older code sub classing NSString will need to be updated.



NSBundle bundleWithIndentifier:  

The NSBundle method `+bundleWithIdentifier:` was added.



NSPredicate  

A basic implementation of the NSPredicate classes (NSPredicate, NSComparisonPredicate, NSCompoundPredicate, NSExpression) was added.



Stack traces  

Support for getting stack traces via bfd was added experimentally. You have to define STACKTRACE when compiling base to get this.



Languages  

Added new language files Esperanto, Korean, and Ukrainian.



Run loops  

Removed the timeout facility for run loop watchers - you should use standard timers instead. The watcher interface is deprecated anyway.



<span id="001030000000">Version 1.12.0</span>
---------------------------------------------



There have been a number of API changes and several methods have been depreciated in this release. Although current GNUstep programs that use these methods will still work in this version, there are enough changes that a new library version was considered useful.



NSCoder deprecated methods  

Several methods using the old libObjects style scheme `withName:` are now deprecated. You can use the new NSKeyedArchiver and NSKeyedUnarchiver functionality to perform the same function in a much more portable way.



NSPortCoder, NSPortMessage private methods  

The private method `_components` was removed from the public interface.



NSString -getCString:maxLength:encoding:  

The return type of this function was changed to BOOL.



NSBundle deprecated and private methods  

Several deprecated and private methods were removed from the public interface including `+gnustepBundle`, and `+pathForGNUstepResource:ofType:inDirectory:`.



NSNotificationCenter deprecated method  

The GNUstep method `setLockingDisabled:` method was deprecated.



NSNotificationQueue private functions  

Private functions `GSNotifyASAP`, `GSNotifyIdle`, and `GSNotifyMore` were removed from public interface.



NSRunLoop watcher API updates and other changes  

We are starting to integrate the Cocoa NSStream classes into GNUstep, which allow you to do much the same things as the GNUstep-specific run loop watcher API was intended. At some point the watcher API will be deprecated as it will be redundant with NSStream functionality. Also the deprecated win32 specific methods for NSRunLoop were removed.



NSAttributedString deprecated method  

The non-standard `attributedSubstringWithRange:` method (just a synonym for the real method) was deprecated.



NSConnection, NSDistantObject method removal  

Several legacy methods from the original GNU Connection class were removed or moved to the additions category of the library.



NSAutoreleasePool private methods  

The private method `_endThread:` was removed from the public interface.



NSPortNameServer private methods  

Several private methods were removed from the public interface.



NSStream, NSIndexPath  

New classes added to the library.



NSUserDefaults improvements  

User defaults were restructured to create the defaults lazily and can be set to not write to an external file at all, for developers who wish to use the library as a stand-alone library or in other situations where using external resources is not desired.



<span id="001031000000">Version 1.11.2</span>
---------------------------------------------



GNUstep.conf and relocation  

Support for GNUstep.conf and relocation of the filesystem is much improved in this release.



Windows platform  

The WM\_QUIT message is now intercepted to allow an application to terminate cleanly.



NSMessagePort - Windows platform  

NSMessagePort was implemented on Windows platforms.



NSOpenStepRootDirectory  

This function has been un-deprecated, and the documentation clarified so it is easier to understand what it does and does not do.



GNUsteprc  

Deprecated support for system-wide GNUsteprc files has been removed.



<span id="001032000000">Version 1.11.1</span>
---------------------------------------------



NSSortDescriptor  

New class.



NSStringFromPoint, NSStringFromRect, NSStringFromSize  

Functions now output strings that can be read by old OpenStep implementations (but can also still be read by GNUstep and MacOSX).



Debugging support  

More support for debugging on mingw, including writing logs to debugger and event viewer.



<span id="001033000000">Version 1.11.0</span>
---------------------------------------------



The interface version of the base library has changed in this release. Applications, libraries and tools that wish to use this new version must be recompiled (otherwise, they'll use the older version of the library).



Window's changes  

A lot of the behavior of path handling in the base library has changed with respect to Window's machines. Windows native paths are used throughout. The fileSystemRepresentation methods now use utf-16 as the external c-string representation on windows. The local to openstep and openstep to local methods are now deprecated and do nothing. Other changes to classes and class variables have also occurred (detailed below).



Path/Startup configuration  

At the startup of any application or tool, GNUstep used to look at various environment variables in order to find the location of various data directories and other things. GNUstep still does this, but the environment variables are no longer required to find these files. In addition the configuration files used to override certain path behavior has been changed and expanded. See the base library documentation on GNUstep Configuration Files for more information.



NSCharacterSets  

Character sets are included in the library itself instead of being loaded from a data file. Also, the NSBitmapCharSet API has been removed.



NSPathUtilities  

Depreciated functions GSSystemRootDirectory and GSStandardPathPrefixes. In addition, beware of using the function NSOpenStepRoot, which may not necessarily return the information you need (see the documentation for this function for more info). Enumeration values for NSSearchPathDirectory have changed.



NSRunLoop  

NSRunLoop and related classes now use native win32 event handling on Window's machines. See also GSFileHandle, NSSocketPort and NSMessagePort.



GSFileHandle  

This GNUstep specific class has a new ivar on Windows.



NSSocketPort, NSMessagePort  

This class has a new ivar on Windows.



NSPortNameServer  

A one-time warning is printed concerning a future change in which nsconnections will only work between processes owned by the same account on the same machine, for MacOSX compatibility and security. If inter-host/user communication is desired, the developer will need to set this explicitly.



Keyed Encoding  

Work was done in many classes to support keyed encoding. It may not be fully implemented in every class, however.



<span id="001034000000">Version 1.10.3</span>
---------------------------------------------



This release includes a few minor bug fixes.



<span id="001035000000">Version 1.10.2</span>
---------------------------------------------



This release is most likely the last release in this series, aside from possible bug fixes. It was was branched from CVS on Feb 22, 2005.



NSContainsRect behavior change  

The definition of NSContainsRect has changed to correspond with the current Mac OS X/Cocoa definition. The sides of the bRect can touch aRect.



Unichar file paths  

Windows supports unichar file paths, but there isn't really an API for handling this. GNUstep-specific methods for dealing with this have been added, `NSFileManager's           -localFromOpenStepPath` and `openStepPathFromLocal` and equivalent methods for `NSString`. In most cases the Base library should handle this problem internally, but it's possible that there are cases where the developer wants to handle the file name explicitly with system-specific functions.



NSDictionaryErnumerator  

Some ivars in NSDictionaryEnumerator have changed types, but the total storage space has not changed. This may cause problems if you access ivars directly, perhaps through a subclass.



NSNotification -setImmutablePost  

This GNUstep extension method was removed.



NSPort extension methods  

Unimplemented GNUstep extension methods `-close`, `-outPackedClass`, and `+outPackedClass` were removed.



NSTimeZone -abbreviationDictionary  

`NSTimeZone`'s abbreviation dictionary is now a proper one-to-one dictionary.



<span id="001036000000">Version 1.10.1</span>
---------------------------------------------



Runtime version discovery of library  

A developer can discover the version of the base library that is loaded using the NSBundle methods `[[NSBundle bundleForLibrary: @"gnustep-base"] infoDictionary]` and retrieving the `GSBundleVersion` key.



NSXMLParser class added  

This is a Cocoa class that has been added for compatibility. The class is still alpha state.



NSArray makeObjectsPerformSelector:  

The order of iteration through objects was changed to match Cocoa.



Designated initializer changes  

The designated initializer for NSArray, NSDictionary, NSSet, and NSString for MacOS X compatibility. Like MacOS X, you can call `[super init]` to initialize the class from a subclass, although it is prefered that you use the *designated initializer*, with it's richer set of initializers.



<span id="001037000000">Version 1.10.0</span>
---------------------------------------------



Interface version change  

The interface version of the base library has changed in this release, as it will in all future releases with a new minor number (that's the second number in the release number). Applications, libraries and tools that wish to use this new version must be recompiled (otherwise, they'll use the older version of the library). There is no single reason for this change. Arguably, it should have been done long ago.



NSString clarification  

The NSString documentation contains some clarification on the lifetime of returned NSString objects.



URL classes support persistent connections  

The NSURLHandle and other classes have support for persistent connections.



NSMethodSignature clarification  

Recent compiler releases have exposed a flaw in the way GNUstep gathers signature information. The documentation explains how the information for offset and registers may not be reliable.



Mac OS X compatibility  

There have been many fixes in various classes for Mac OS X compatibility, particularly relating to XML encoding.



<span id="001038000000">Version 1.9.2</span>

--------------------------------------------



GSMime parsing ignores extraneous data  

When extraneous data is encountered in the input, it is ignored (and a warning logged) rather than adding it to the message body. Not sure this is right though, perhaps we should raise an exception or extend the api to return the extra data. Anyway, it's better than the previous behavior of adding the bad data to the parsed body.



New log functions GSOnceFlag and GSOnceMLog  

Log messages the first time the code is executed. Typical usage is to log warnings about deprecated features.



NSError  

New MacOSX compatibility class



GSObjCRuntime  

Multiple new runtime functions that work with both GNU and Apple runtimes. These functions allow you to look at method lists, add and remove methods (for instance, if you want to make sure your method in a category overrides another method in a category).



NSProtocolChecker rewritten  

Was previously almost non-functional.



autogsdoc  

Support added for building frames structured documentation. Add the flag `-MakeFrames YES` to the autogsdoc command line.



Binary incompatibilities  

NSUnarchiver, GSIMapTable have new ivars added to them. Tools and applications that use these classes may need to be recompiled after the new library is installed.



  

