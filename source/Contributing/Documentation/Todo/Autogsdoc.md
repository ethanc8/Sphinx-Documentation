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
- [ ] libdispatch
    * It looks like HeaderDoc, but HeaderDoc can't parse it correctly. Maybe Apple has an internal fork of HeaderDoc, or it might be Doxygen.
    * Doxygen can't parse it correctly, either.
- [ ] AddressBook
- [X] DBusKit
- [ ] Enterprise Control
- [ ] GTKWebKit
- [ ] Xcode
    * No header documentation!
- [ ] Opal
    * No documentation
- [ ] Mica
- [ ] GNUstep QuartzCore
- [ ] Enterprise Control and Configuration
    * Tons of detailed documentation! But you have to compile the library to compile the documentation...
- [ ] GDL2
- [ ] GSWeb
- [X] PDFKit
    * Doesn't conform to any system -- partially documented, using `/**` and `/*`
- [X] libobjc2
- [ ] GCC Objective-C runtime
- [X] Pantomime
    * Used HeaderDoc instead, since it's already written in HeaderDoc.
