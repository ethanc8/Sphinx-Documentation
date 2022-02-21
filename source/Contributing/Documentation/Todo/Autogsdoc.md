# Autogsdoc

The following frameworks need Autogsdoc documentation to be added:

- [X] Foundation / Base
- [X] AppKit / Gui
- [ ] Gui Backend / Back
    * Autogsdoc is not configured for this library.
    * Is its API a private API?
- [ ] GSCoreData
    * Unfortunately, the documentation is stored in the source files, and all the documentation generators don't like it.
- [X] CoreBase
    * Uses Doxygen
- [ ] Swift Core Foundation
    * Partially undocumented, partially unformatted comments, partially HeaderDoc
- [ ] libdispatch
    * It looks like HeaderDoc, but HeaderDoc can't parse it correctly. Maybe Apple has an internal fork of HeaderDoc, or it might be Doxygen.
    * Doxygen can't parse it correctly, either.
- [ ] AddressBook
    * No header documentation!
- [X] DBusKit
- [ ] GTKWebKit
    * No header documentation!
- [ ] Xcode
    * No header documentation!
- [ ] Opal
    * No documentation
- [ ] Mica
- [ ] GNUstep QuartzCore
    * No documentation
- [ ] Enterprise Control and Configuration
    * Autogsdoc
    * Tons of detailed documentation! But you have to compile the library to compile the documentation...
- [ ] GDL2
    * Autogsdoc - build with the library
- [ ] GSWeb
    * Autogsdoc
- [X] PDFKit
    * Doesn't conform to any system -- partially documented, using `/**` and `/*`
- [X] libobjc2
- [ ] GCC Objective-C runtime
- [X] Pantomime
    * Used HeaderDoc instead, since it's already written in HeaderDoc.


## Swift Core Foundation
As of Swift 5.1.5
### Have HeaderDoc comments

* CFArray.h
* CFAttributedString.h
* CFBinaryHeap.h
* CFCharacterSet.h
* CFDictionary.h
* CFError.h

### Have unformatted comments

* CFAvailability.h
* CFBundle.h
* CFDateFormatter.h
* CFKnownLocations.h
* CFLocale.h
* CFNotificationCenter.h

### Have no useful comments

* CFBag.h
* CFBitVector.h
* CFByteOrder.h
* CFCalendar.h
* CFData.h
* CFDate.h
* CFDateComponents.h
* CFDateInterval.h
* CFMachPort.h
* CFMessagePort.h

