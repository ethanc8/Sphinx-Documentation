# Apple Release Notes

> All information in this document is copyrighted by Apple Inc. The information was included here because it is currently scattered around the web.

> The release notes for 10.12 and later are under the Apache License.

## CF-550 - 10.6 Snow Leopard

CoreFoundation (aka CF) is a framework which provides C APIs for strings, collections, user preferences, property lists, plug-ins, bundles, notifications, runloop, etc. These APIs are designed with portability, performance, and consistency in mind, and are available to Cocoa and Carbon applications.

CoreFoundation is accessible directly as a public framework. But it is also within the CoreServices umbrella framework and is very often pulled into your application simply by linking against CoreServices or one of the higher level umbrellas such as Cocoa or Carbon which bring in CoreServices.

This document describes the changes in CF since OS X release 10.5. Updates to the document since WWDC 2008 are indicated in the section titles.
CFURL

There are additions to CFURL API to enable more efficient file property manipulation, as well additional behaviors. More description forthcoming.
CFPropertyList

The following functions are now obsolete and will be deprecated in a future release:
```objc
CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption,
                                CFStringRef *errorString);

CFPropertyListRef CFPropertyListCreateFromStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength,
                                CFOptionFlags mutabilityOption, CFPropertyListFormat *format, CFStringRef *errorString);

CFIndex CFPropertyListWriteToStream(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format,

                                CFStringRef *errorString);

CFDataRef CFPropertyListCreateXMLData(CFAllocatorRef allocator, CFPropertyListRef propertyList);
```
The replacement API is:
```objc
CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options,

                                CFPropertyListFormat *format, CFErrorRef *error);

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength,

                                CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error);

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format,

                                CFOptionFlags options, CFErrorRef *error);

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format,

                                CFOptionFlags options, CFErrorRef *error);
```
The new API provides better error handling, better support for localization, and easier creation of binary property lists. Any error parameter may be set to NULL if no error information is desired. If a CFErrorRef pointer is passed in and an error occurs, it will be filled out with information about the error and it is the responsibility of the caller to release the new error. The format parameter in the CFPropertyListCreateWIthData and CFPropertyListCreateWithStream functions may also be set to NULL, but if a CFPropertyListFormat pointer is passed in, it will be filled out with the format of the property list.

The option flags on the CFPropertyListCreateWithData and CFPropertyListCreateWithStream functions may be set to any of the CFPropertyListMutabilityOptions values. The options flags on CFPropertyListWrite and CFPropertyListCreateData are currently unused and should be set to 0.
CFXMLParser (New since WWDC 2008)

CFXMLParser and CFXMLNode will be officially deprecated in a future major release of OS X. CFXMLParser has some deficiencies in terms of standards compliance and performance, and clients should migrate their uses of the CFXMLParser classes over to NSXMLParser, NSXMLDocument, or other XML parsing technologies on OS X.
CoreFoundation API not available in iOS 2.0

The OS X APIs in CFUserNotification.h, CFXMLParser.h, CFXMLNode.h, and CFStringTokenizer.h are not available in iOS 2.0. Distributed notifications (CFNotificationCenterGetDistributedCenter()) are also not available. Otherwise, iOS 2.0 contains an API matching that in OS X 10.5.
CoreFoundation API not available in iOS 3.0

The OS X APIs in CFUserNotification.h, CFXMLParser.h, and CFXMLNode.h are not available in iOS 3.0. Distributed notifications (CFNotificationCenterGetDistributedCenter()) are also not available. Otherwise, iOS 3.0 contains an API matching that in OS X 10.5.
New CFCalendarUnit

A new "quarter" calendar unit (kCFCalendarUnitQuarter) has been added to the set of CFCalendarUnits (CFCalendar.h).
New calendars

Four new calendar constants (kCFRepublicOfChinaCalendar, kCFPersianCalendar, kCFIndianCalendar, kCFISO8601Calendar) have been added (CFLocale.h). The ISO8601 calendar is not yet implemented. A Chinese calendar can be created, and one can do calendrical calculations with it, but it should not be used for formatting as the necessary underlying functionality is not functioning correctly yet.
CFDataFind (New since November seed)

CFData now has a function that will efficiently search its contents:

    CFRange CFDataFind(CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions);

The semantics are nearly identical to CFStringFind. The only significant difference is the lack of 'case insensitive' and 'literal' search options, which are only applicable to strings.
CFString (Updated since WWDC 2008)

The functions CFStringGetMaximumSizeForEncoding() and CFStringGetMaximumSizeOfFileSystemRepresentation() will now return kCFNotFound if the amount of memory required for storing the results of the encoding conversion would exceed LONG_MAX.

Usage note: When using CFStringCreateWithFormat(), and any other CFString or NSString formatting APIs, it's illegal to pass fewer ordered (n$) arguments than there are arguments. For instance:

    CFStringCreateWithFormat(NULL, NULL, CFSTR("%2$d", arg1, arg2);

This is because there's no way for CFString to know how to skip the first argument to get to the second. There is no behavior change here, just a clarification.
CFString

There are now 4 new inline functions for working with UTF-16 surrogate characters declared in CFString.h. CFStringIsSurrogateHighCharacter() and CFStringIsSurrogateLowCharacter() identify surrogate characters. CFStringGetLongCharacterForSurrogatePair() maps a pair of high and low surrogate characters to the Unicode Scalar Value. CFStringGetSurrogatePairForLongCharacter() maps a Unicode Scaler Value back to the surrogate pair.

There are two new CFStringEncoding constants: KCFStringEncodingUTF7 and kCFStringEncodingUTF7_IMAP.
Unicode (New since WWDC 2008)

The CoreFoundation Unicode Database is updated to version 5.1.
CFCharacterSet (New since WWDC 2008)

CFCharacterSetCreateWithCharactersInString, CFCharacterSetAddCharactersInString, and CFCharacterSetRemoveCharactersInString now correctly recognizes surrogate paris in the string.

## CF-675 - iOS 5


CoreFoundation (aka CF) is a framework which provides C APIs for strings, collections, user preferences, property lists, plug-ins, bundles, notifications, runloop, etc. These APIs are designed with portability, performance, and consistency in mind, and are available to Cocoa Touch applications.

CoreFoundation is accessible directly as a public framework.




CFXMLParser
CFXMLParser and CFXMLNode are deprecated. CFXMLParser has some deficiencies in terms of standards compliance and performance, and clients should migrate their uses of the CFXMLParser classes over to NSXMLParser, NSXMLDocument, or other XML parsing technologies on iOS 5.


CFPreferences and Threading
In earlier releases of iOS, CFPreferences (and NSUserDefaults) serialized all access; if you've been avoiding using the preferences system in heavily threaded apps due to contention, this should be greatly improved.


CFPreferencesAppSynchronize() and automatic synchronization
CFPreferences now uses the automatic synchronization system for the current application's domain that NSUserDefaults has always used. Additionally, automatic synchronization is now non-blocking in most cases. You should consider any calls to CFPreferencesAppSynchronize() carefully to see if they're really necessary, as you can avoid blocking IO by removing them.


CFPreferences euid/uid handling
Prior to iOS 5, CFPreferences (and therefore NSUserDefaults) would change the owner of the plist files it wrote to the uid/gid of the application writing to preferences. In iOS 5, for apps linked against iOS 5 or later, the file will be owned by the euid/egid instead. You can temporarily revert to the old behavior for testing purposes by setting __CFPREFERENCES_USE_OLD_UID_BEHAVIOR to a non-null value in your environment. This will primarily impact applications with privileged helper tools that write to the preferences of non-privileged apps such as the Dock or the parent process.


CFString Hyphenation
CFString now includes a facility for locating potential hyphenation points within a word. This is intended for the use of text layout engines such as NSTypesetter, when automatic hyphenation is enabled. Hyphenation depends heavily on the language of the text to be hyphenated, and the CFStringGetHyphenationLocationBeforeIndex() requires that this be specified as a CFLocale. Hyphenation data is available only for certain languages, currently English (US and GB), French, German, Italian, Spanish, Dutch, and Russian, although this list may be expanded in the future. A runtime determination of whether hyphenation data is available for a given language may be made using CFStringIsHyphenationAvailableForLocale().

The functions associated with the hyphenation facility are as follows:

CFIndex CFStringGetHyphenationLocationBeforeIndex(CFStringRef string, CFIndex location, CFRange limitRange,
                                      CFOptionFlags options, CFLocaleRef locale, UTF32Char *character);

Boolean CFStringIsHyphenationAvailableForLocale(CFLocaleRef locale);


To use CFStringGetHyphenationLocationBeforeIndex(), a client should pass in a string containing the text intended to be hyphenated, a location before which a hyphenation point is to be found, a range limiting the portion of the text to be examined, and the locale. The return value will be an index within the string where it is appropriate to insert a hyphen, or CFNotFound if none is found that is both before the specified location and within the limiting range. There may be cases in certain languages in which a character other than the standard hyphen is used to indicate hyphenation, and the character argument is intended to return a suggested character by reference; clients may pass NULL for this argument if they are not interested in this information.


CFStringGetFileSystemRepresentation
CFStringGetFileSystemRepresentation() will now return false for any input string which contains embedded null characters, rather than returning a what is effectively a truncated (and outright wrong) string.


CFStringCapitalize
The capitalization logic is enhanced to support the digraph, "IJ", with Dutch locale.


CoreFoundation Unicode Database
The CoreFoundation Unicode Database is updated to version 6.0.


kCFCompareForcedOrdering and kCFCompareNumerically with CFStringCompareWithOptionsAndLocale()
We were not able to force ordering for differences in numeric characters when the two numeric values are equal. Also, in some cases, we were not producing ideal results (i.e. 001 < 01). We're evaluating the ordering based on the number of digits involved in the numeric value.


Distributed notification delivery
If you want a posted distributed notification to be received immediately, be sure you are passing the CFNotificationSuspensionBehaviorDeliverImmediately suspension behavior flag when registering for the notification, or using the kCFNotificationDeliverImmediately flag when posting. Bugs in iOS releases prior to 5.0 meant that sometimes a distributed notification would get delivered through to suspended observers, and not be properly queued, even when those flags weren't used.


CFCalendar
The CFCalendar algorithms have several differences depending on which OS SDK version you build your app against. CFCalendarGetRangeOfUnit() can produce materially different results for iOS 2, 3, 4/5. CFCalendarGetOrdinalityOfUnit() can produce materially different results for iOS 2/3 and iOS 4/5. CFCalendarComposeAbsoluteTime() can produce different results on iOS 5 than previous releases when working with Week units.

But of course, most of the algorithms can produce different results between OS releases, as bugs are fixed or changes made, either in Foundation or CoreFoundation or in libraries beneath them. The differences noted in the previous paragraph are the significant ones.

There are 3 new Week-related unit/component constants in CFCalendar:

kCFCalendarUnitWeekOfMonth, kCFCalendarUnitWeekOfYear, kCFCalendarUnitYearForWeekOfYear

and the values of these quantities are week numbers or amounts relating to the month or the year that the week is in, and the year number for week-based interpretations of a calendar, such as the ISO 8601 calendar.

For many operations, there is no difference in meaning between kCFCalendarUnitWeekOfMonth and kCFCalendarUnitWeekOfYear, but for some there is a difference. Obviously getting the ordinality of a week with the month will usually give a different answer than the ordinality of the week within the year. The kCFCalendarUnitWeek constant is not yet officially deprecated, but its use in new code is discouraged. It has a behavior like either kCFCalendarUnitWeekOfMonth or kCFCalendarUnitWeekOfYear, as the case may be, to give it behavior like it had prior to iOS 5.


CFURL
We've added lots of new resource property keys.
The functions CFURLCreateBookmarkDataFromFile() and CFURLWriteBookmarkDataToFile() have been introduced to iOS 5.0. They were previously introduced to Mac OS X 10.6.


CFURLEnumerator
CFURLEnumeratorGetSourceDidChange() is now deprecated.

The kCFURLEnumeratorIncludeDirectoriesPreOrder and kCFURLEnumeratorIncludeDirectoriesPostOrder options for recursive directory enumerators were added.


CFError
We've added the kCFErrorURLKey and kCFErrorFilePathKey userInfo dictionary keys.


New CFRunLoop API
There are two new functions to create CFRunLoopObservers and CFRunLoopTimers, respectively, which take a Block to execute, rather than function pointer and context arguments:

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats,
                                CFIndex order, void (^block)(CFRunLoopObserverRef observer, CFRunLoopActivity activity))

CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval,
                                CFOptionFlags flags, CFIndex order, void (^block)(CFRunLoopTimerRef timer))

## CF-635 - 10.7 Lion

CoreFoundation (aka CF) is a framework which provides C APIs for strings, collections, user preferences, property lists, plug-ins, bundles, notifications, runloop, etc. These APIs are designed with portability, performance, and consistency in mind, and are available to Cocoa and Carbon applications.

CoreFoundation is accessible directly as a public framework. But it is also within the CoreServices umbrella framework and is very often pulled into your application simply by linking against CoreServices or one of the higher level umbrellas such as Cocoa or Carbon which bring in CoreServices.
CFXMLParser

CFXMLParser and CFXMLNode are deprecated. CFXMLParser has some deficiencies in terms of standards compliance and performance, and clients should migrate their uses of the CFXMLParser classes over to NSXMLParser, NSXMLDocument, or other XML parsing technologies on OS X.
CFPreferences and Threading

In earlier releases of OS X, CFPreferences (and NSUserDefaults) serialized all access; if you've been avoiding using the preferences system in heavily threaded apps due to contention, this should be greatly improved.
CFPreferencesAppSynchronize() and automatic synchronization

CFPreferences now uses the automatic synchronization system for the current application's domain that NSUserDefaults has always used. Additionally, automatic synchronization is now non-blocking in most cases. You should consider any calls to CFPreferencesAppSynchronize() carefully to see if they're really necessary, as you can avoid blocking IO by removing them.
CFPreferences euid/uid handling

Prior to OS X Lion, CFPreferences (and therefore NSUserDefaults) would change the owner of the plist files it wrote to the uid/gid of the application writing to preferences. In Lion, for apps linked against Lion or later, the file will be owned by the euid/egid instead. You can temporarily revert to the old behavior for testing purposes by setting __CFPREFERENCES_USE_OLD_UID_BEHAVIOR to a non-null value in your environment. This will primarily impact applications with privileged helper tools that write to the preferences of non-privileged apps such as the Dock or the parent process.
CFString Hyphenation

CFString now includes a facility for locating potential hyphenation points within a word. This is intended for the use of text layout engines such as NSTypesetter, when automatic hyphenation is enabled. Hyphenation depends heavily on the language of the text to be hyphenated, and the CFStringGetHyphenationLocationBeforeIndex() requires that this be specified as a CFLocale. Hyphenation data is available only for certain languages, currently English (US and GB), French, German, Italian, Spanish, Dutch, and Russian, although this list may be expanded in the future. A runtime determination of whether hyphenation data is available for a given language may be made using CFStringIsHyphenationAvailableForLocale().

The functions associated with the hyphenation facility are as follows:

CFIndex CFStringGetHyphenationLocationBeforeIndex(CFStringRef string, CFIndex location, CFRange limitRange,

                                      CFOptionFlags options, CFLocaleRef locale, UTF32Char *character);

Boolean CFStringIsHyphenationAvailableForLocale(CFLocaleRef locale);

To use CFStringGetHyphenationLocationBeforeIndex(), a client should pass in a string containing the text intended to be hyphenated, a location before which a hyphenation point is to be found, a range limiting the portion of the text to be examined, and the locale. The return value will be an index within the string where it is appropriate to insert a hyphen, or CFNotFound if none is found that is both before the specified location and within the limiting range. There may be cases in certain languages in which a character other than the standard hyphen is used to indicate hyphenation, and the character argument is intended to return a suggested character by reference; clients may pass NULL for this argument if they are not interested in this information.
CFStringGetFileSystemRepresentation

CFStringGetFileSystemRepresentation() will now return false for any input string which contains embedded null characters, rather than returning a what is effectively a truncated (and outright wrong) string.
CFStringCapitalize

The capitalization logic is enhanced to support the digraph, "IJ", with Dutch locale.
CoreFoundation Unicode Database

The CoreFoundation Unicode Database is updated to version 6.0.
kCFCompareForcedOrdering and kCFCompareNumerically with CFStringCompareWithOptionsAndLocale()

We were not able to force ordering for differences in numeric characters when the two numeric values are equal. Also, in some cases, we were not producing ideal results (i.e. 001 < 01). We're evaluating the ordering based on the number of digits involved in the numeric value.
Distributed notification delivery

If you want a posted distributed notification to be received immediately, be sure you are passing the CFNotificationSuspensionBehaviorDeliverImmediately suspension behavior flag when registering for the notification, or using the kCFNotificationDeliverImmediately flag when posting. Bugs in OS X releases prior to 10.7 meant that sometimes a distributed notification would get delivered through to suspended observers, and not be properly queued, even when those flags weren't used.
CFCalendar

The CFCalendar algorithms have several differences depending on which OS SDK version you build your app against. CFCalendarGetRangeOfUnit() can produce materially different results for OS X 10.4, OS X 10.5, and OS X 10.6/10.7. CFCalendarGetOrdinalityOfUnit() can produce materially different results for pre-OS X 10.6 and OS X 10.6/10.7. CFCalendarComposeAbsoluteTime() can produce different results on OS X 10.7 than previously when working with Week units.

But of course, most of the algorithms can produce different results between OS releases, as bugs are fixed or changes made, either in Foundation or CoreFoundation or in libraries beneath them. The differences noted in the previous paragraph are the significant ones.

There are 3 new Week-related unit/component constants in CFCalendar:

kCFCalendarUnitWeekOfMonth, kCFCalendarUnitWeekOfYear, kCFCalendarUnitYearForWeekOfYear

and the values of these quantities are week numbers or amounts relating to the month or the year that the week is in, and the year number for week-based interpretations of a calendar, such as the ISO 8601 calendar.

For many operations, there is no difference in meaning between kCFCalendarUnitWeekOfMonth and kCFCalendarUnitWeekOfYear, but for some there is a difference. Obviously getting the ordinality of a week with the month will usually give a different answer than the ordinality of the week within the year. The kCFCalendarUnitWeek constant is not yet officially deprecated, but its use in new code is discouraged. It has a behavior like either kCFCalendarUnitWeekOfMonth or kCFCalendarUnitWeekOfYear, as the case may be, to give it behavior like it had prior to OS X 10.7.
CFURL

We've added lots of new resource property keys.

The functions CFURLCreateBookmarkDataFromFile() and CFURLWriteBookmarkDataToFile() have been introduced to iOS 5.0. They were previously introduced to OS X 10.6.
CFURLEnumerator

CFURLEnumeratorGetSourceDidChange() is now deprecated.

The kCFURLEnumeratorIncludeDirectoriesPreOrder and kCFURLEnumeratorIncludeDirectoriesPostOrder options for recursive directory enumerators were added.
CFFileSecurity

CFFileSecurity is a new object type introduced to replace the Carbon File Manager's FSFileSecurity object. CFFileSecurityRef and FSFileSecurityRef are the same object type (i.e., they have the same type ID and the underlying implementation is the same).
CFError

We've added the kCFErrorURLKey and kCFErrorFilePathKey userInfo dictionary keys.
New CFRunLoop API

There are two new functions to create CFRunLoopObservers and CFRunLoopTimers, respectively, which take a Block to execute, rather than function pointer and context arguments:

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats,

                                CFIndex order, void (^block)(CFRunLoopObserverRef observer, CFRunLoopActivity activity))

CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval,

                                CFOptionFlags flags, CFIndex order, void (^block)(CFRunLoopTimerRef timer))

## CF-744 - 10.8 Mountain Lion
CoreFoundation Framework

CoreFoundation (aka CF) is a framework which provides C APIs for strings, collections, user preferences, property lists, plug-ins, bundles, notifications, runloop, etc. These APIs are designed with portability, performance, and consistency in mind, and are available to Cocoa and Carbon applications.

CoreFoundation is accessible directly as a public framework. But it is also within the CoreServices umbrella framework and is very often pulled into your application simply by linking against CoreServices or one of the higher level umbrellas such as Cocoa or Carbon which bring in CoreServices.
CFPreferences Synchronization

CFPreferencesSynchronize() (and therefore CFPreferencesAppSynchronize() and -[NSUserDefaults synchronize]) is now automatic in virtually all cases. The only remaining reason to call it is if you need a separate process to be able to synchronously access the values you just set; for example if you set a preference, then post a notification which another process receives and reads the same preference. Most regular applications will never need to do this, and applications that do are encouraged to use an inter-process communication API (for example XPC) to communicate with the other process rather than using the preferences system for IPC.

CFPreferencesSynchronize() is also much faster in 10.8, and will avoid doing any work if there are no outstanding changes to read or write.
CFPreferences Plist Files

The on-disk property list files used by CFPreferences have always been a private implementation detail, but in previous releases, directly modifying them has mostly worked (though there are some potential data-loss issues for applications that do so, even on previous systems). In 10.8 and later, the CFPreferences agent process (cfprefsd) will cache information from these files and asynchronously write to them. This means that directly modifying plist files is unlikely to have the expected results (new settings will not necessarily be read, and may even be overwritten). You should use the NSUserDefaults or CFPreferences APIs, or the defaults(1) command, to interact with the preferences system.
CF/NSString Localized Formatting

In 10.8, in apps linked against the 10.8 SDK, existing APIs such as CFStringCreateWithFormat(), CFStringAppendFormat(), as well as NSString APIs +[NSString localizedStringWithFormat:], -[NSString initWithFormat:locale:], will now do localized formatting of numbers when a locale is provided (for +localizedStringWithFormat: this is implied, using the user's default locale.)

Currently these calls already do decimal point handling; so in some locales you currently do get comma instead of period for floating point numbers. This new behavior builds upon this; with this change, you will get additional behaviors, such as:

- use of alternate digits, such as in some Arabic locales

- placement of the negative symbol after the number, in some locales ("-42" -> "42-")

- thousands separators, in many locales including English ("12345" -> "12,345")

- alternate thousands separators ("12,345.6" -> "12.345,6")

The localization applies in the following cases:

- Only e, E, f, F, g, G, d, D, i, u, U are localized; the upper case variants are ignored (and treated as if they were lower case). a, A, o, O, x, X are not localized, and neither are all other non-numeric format characters.

- `%@` used with NSNumber/CFNumber is localized.

- The flags +, -, 0, width, and precision are honored, but note that extra characters (beyond the specified width) may be inserted to accommodate thousands separators.

Potential pitfalls include getting localized output where unlocalized was intended, and use of unintended thousands separators (for instance if someone was showing a year with %d, now they may get "2,012").
Greek letter case mapping

With Greek locale, the uppercase and titlecase mappings strip all Greek tonos characters.
CoreFoundation Unicode Database

The CoreFoundation Unicode Database is updated to version 6.1.

## CF-855.11 - 10.9 Mavericks

 CoreFoundation (aka CF) is a framework that provides C APIs for strings, collections, user preferences, property lists, plug-ins, bundles, notifications, runloop, and so forth. These APIs are designed with portability, performance, and consistency in mind, and are available to Cocoa and Carbon applications.

CoreFoundation is accessible directly as a public framework. But it is also within the CoreServices umbrella framework and is very often pulled into your application simply by linking against CoreServices or one of the higher-level umbrellas, such as Cocoa, which bring in CoreServices.
CFURL

The "file" URL scheme is defined so that no authority, an empty host, and "localhost" all mean the end-user's machine. To reduce memory use, file URL objects created with file system paths or from file system representation no longer include the host string "localhost".

This change means CFURLCopyHostName no longer returns the string "localhost" for file URLs and will instead return NULL, and CFURLGetByteRangeForComponent will return kCFNotFound for kCFURLComponentHost.

The use of kCFURLHFSPathStyle is deprecated. The Carbon File Manager, which uses HFS style paths, is deprecated. HFS style paths are unreliable because they can arbitrarily refer to multiple volumes if those volumes have identical volume names. You should instead use kCFURLPOSIXPathStyle wherever possible.

CFURLIsFileReferenceURL() has been added to allow identification of file reference URLs.

CFURLCreateFromFSRef() and CFURLGetFSRef() are deprecated because the Carbon File Manager is deprecated.

URL objects created from URL strings where the URL string length was exactly 1 can no longer be created with characters not allowed in URL strings. This change affects CFURL's CFURLCreateWithString(), and the NSURL methods -initWithString:, -initWithString:relativeToURL:, +URLWithString:, and +URLWithString:relativeToURL:.

The descriptions of long URLs with the data scheme may be truncated if the data URL is very large.
CFURLAccess

CFURLAccess has been deprecated. The suggested replacement for URLs with network schemes (http, https, ftp, data) is NSURLConnection, or better yet, the new NSURLSession APIs. The suggested replacement for URLs with the file scheme are the foundation classes NSFileManager, NSFileHandle and NSURL, or the CoreFoundation classes CFStream and CFURL.
CFPreferences support for Security Application Groups (Sandboxing)

For applications that are part of a Security Application Group, domains matching the name of a security application group entitlement on the app will be shared among all applications in the group, and stored in the group container (this only applies to kCFPreferencesCurrentUser).
Behavioral changes to CFPreferencesGetAppBooleanValue and CFPreferencesGetAppIntegerValue

CFPreferences has been updated to match NSUserDefault's behavior in parsing. Specifically, "1" and "0" will now be interpreted as their corresponding boolean values if looked up via CFPreferencesGetAppBooleanValue, boolean values will be interpreted as 0 or 1 when looked up via CFPreferencesGetAppIntegerValue, and float or double values will be truncated when returned from CFPreferencesGetAppIntegerValue. However, in the case of float to int, the "exists and has valid format" out argument will be false.
CFString

The options argument for CFStringFold was changed from CFOptionFlags to CFStringCompareFlags.

For applications built against the 10.9 SDK, backing store for CFString objects with 8-bit content has been changed to ASCII, which means more requests to CFStringGetCStringPtr() will succeed. It also means that more CFString objects may end up with UTF-16 backing store. This change may, in rare circumstances, cause compatibility problems, since some CFStringGetCStringPtr() calls that used to succeed may now return NULL. (However, a large number of those may already have been returning NULL in other user languages.)
CFStringGetCStringPtr Warning

Following up on the previous paragraph, we want to provide a gentle reminder that the function CFStringGetCStringPtr() may return NULL for a variety of reasons that may vary from release to release, or actually from user language to user language, and due to other factors that are outside of the control of the application.

Just because you observe CFStringGetCStringPtr() returning a non-NULL value for a given string, it does not mean that it will not return NULL for the same string in the future or under different circumstances.

So, please, anytime you call CFStringGetCStringPtr(), follow it with a call to CFStringGetCString() in case of a NULL return:
```objc
char buffer[BUFSIZE];

const char *ptr = CFStringGetCStringPtr(str, encoding);

if (ptr == NULL) {

    if (CFStringGetCString(str, buffer, BUFSIZE, encoding)) ptr = buffer;

}
```
Or better yet just call CFStringGetCString() without bothering with CFStringGetCStringPtr().

Note that CFStringGetCString() may also fail, but that will happen deterministically, and only on two circumstances: The conversion from the UniChar contents of CFString to the specified encoding is not possible, or the buffer is too small.


## Darwin 15 / 10.11 El Capitan

### FOSS Subset

https://github.com/apple/swift-corelibs-foundation/commit/a7b2bc1fa48fc447c8b93f634b01a8ffcddd0337

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

https://github.com/apple/swift-corelibs-foundation/commit/a455cde38e06052385560d0a7c5aeb5a4991f844

No release notes.

## Darwin 17 / 10.13 High Sierra

### FOSS Subset

https://github.com/apple/swift-corelibs-foundation/commit/622c5ff9cfead0871cf7028c6f7e6b6e196f4080
https://github.com/apple/swift-corelibs-foundation/commit/df3ec55fe6c162d590a7653d89ad669c2b9716b1

No release notes.

## Darwin 18 / Mojave

### FOSS Subset

https://github.com/apple/swift-corelibs-foundation/commit/480ceeb859a7ed600c758f0b3781ae89f8689b51

No release notes.

## 10.15 Catalina

### FOSS Subset

https://github.com/apple/swift-corelibs-foundation/commit/ad0445fa5417b253c2b4330498a48aeabad0f52e

This patch brings swift-corelibs-foundation closer to behavior parity with released versions of macOS Catalina and aligned Apple releases. Most of these changes are under-the-hood bug fixes or performance improvements, but a few may affect the behavior of your applications. In particular:

 - The deprecation of `NSURL.parameterString` is now also effective in Swift for Linux, with similar effects. This brings URL parsing in line with Catalina. Note that Swift for Linux does not support link checks, since there is no binary compatibility guarantee on Linux; this change will be effective to all application code running on Swift for Linux 5.3 or later.

 - Certain `CFXML`… types that have been deprecated on macOS are now removed, along with their associated implementation: `CFXMLInputStream`, `CFXMLNode`, `CFXMLParser`. Modern code should be using the `FoundationXML` module (or, on Darwin, the `XMLDocument` and related classes in Foundation) to parse documents.

## 11 Big Sur

### FOSS Subset

Big Sur's CF was never released to swift-corelibs-foundation.

## 12 Monterey

### FOSS Subset

https://github.com/apple/swift-corelibs-foundation/commit/d8e8a8b92b3a8af8381a11155328c1bba1c6bd2c

This PR brings the FOSS portions of Core Foundation on par with macOS Monterey, iOS 15, watchOS 8 and tvOS 15. This includes the changes shipped during the previous releases.

Most of the changes include bug fixes and performance improvements, but some are useful to highlight:

 - This patch adds the Core Foundation code that underlies Foundation's `ListFormatter` and `RelativeDateTimeFormatter` to the FOSS subset.

 - Several Emoji fixes are included that update `CFString` (and thus `NSString` and the Foundation methods on `Swift.String`) support for correctly decoding and iterating over emoji introduced during the Big Sur and Monterey timeframes. The corresponding character maps in `CharacterSet`` have been updated.

 - Certain parsing functions, most notably those that implement property list parsing, now have a maximum recursion depth to prevent resource abuse from malicious input.

 - Some architectural changes have been introduced that are used on Darwin to support Pointer Authentication. For more information on the topic, see [Preparing Your App to Work with Pointer Authentication](https://developer.apple.com/documentation/security/preparing_your_app_to_work_with_pointer_authentication). Note that the FOSS subset does not ship on architectures that require this support, but the architectural changes have been merged for simplicity and synchronization between Darwin and FOSS builds.

 - Parameter checking has been improved for several CF functions.

 - Some implementations have been streamlined or consolidated, especially for `CFPlugIn` and `CFBundle`. `CFBundle` also adds support for "Wrapper"-style bundles (for example, the kind of bundle produced when installing iOS applications on Macs with Apple silicon).