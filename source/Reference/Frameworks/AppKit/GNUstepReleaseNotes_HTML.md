<span id="title$ReleaseNotes">GNUstep Gui Release Notes</span>
==============================================================

### Authors

[Adam Fedor](http://www.gnustep.org/developers/whoiswho.html) ([`fedor@gnu.org`](mailto:fedor@gnu.org))  

<!-- **Version:** $Revision$

**Date:** $Date$ -->

**Copyright:** (C) 2005 Free Software Foundation, Inc.

<!-- <span id="001000000000">Gui Release Notes</span>
================================================ -->

The release notes include descriptions of API changes, behavior changes
and other information that might help developers and users migrate to
using a newer version of the library.

<span id="001001000000">0.29.0</span>
-------------------------------------

This version adds support for modern XIB files and many new classes.
Plus the usual bunch of bug fixes.

storyboards  
Support loading of storyboard files.

new classes  
Add classes NSSwitch, NSFontAssetRequest,
NSMediaLibraryBrowserController, NSScrubberItemView, NSScrubberLayout,
NSScrubber, NSSharingServicePickerToolbarItem, NSPathCell,
NSPathComponentCell, NSPathControl, NSPathControlItem,
NSPersistentDocument, NSAccessibilityCustomAction,
NSAccessibilityCustomRotor, NSAccessibilityElement, NSStoryboard,
NSStoryboardSegue, NSPageController, NSSplitViewController,
NSSplitViewItem, NSTabViewController, NSLayoutAnchor,
NSLayoutConstraint, NSLayoutGuide, NSStatusBarButton,
NSTextCheckingController, NSTextFinder, NSTextInputContext,
NSGridView.  
  
Some of these classes are still skeletons.

text layout  
Fix extraline fragment in text layout.

RTF  
Better encoding handling in RTF files.

localization  
Add more italian translations.

compatibility  
Add MacOSX methods to NSNib, NSMenu and NSWindow.

window management compatibility  
Focus handling fixes for WindowMaker.  
Stop NSWindow from handling windows that are gone, but possibly returned
by a slow window manager.

bugfix  
Fix missing colours when loading old colour lists.  
Fix memory leak in NSPopupButtonCell.  
Fix toolbar flickering.  
Fix int decoding to get it working on 64 bit big endian machines.  
Add tab stops after last defined at default intervals.  
Fix NSTableView/NSTableColumn bindings.

JPEG export improvements  
Support JPEG export as greyscale image.

theming  
NSSearchFieldCell use code from GSTheme to display popup.

<span id="001002000000">0.28.0</span>
-------------------------------------

This version adds support for modern XIB files and many new classes.
Plus the usual bunch of bug fixes.

XIB  
Support loading XIB5 files.

key-value binding  
Improve Key Value Binding for NSArrayController and add more bindings.

multi-monitor support  
Better support for multi monitor usage and other improvement in the
backend integration.

new classes  
NSFontCollection, NSColorSampler, NSSpeechRecognizer, NSAppearance,
NSPDFInfo, NSPICTImageRep, NSCIImageRep, NSPDFImageRep, NSPDFPanel,
NSDataAsset, NSDatePicker, NSDatePickerCell, NSPredicateEditor,
NSPredicateEditorRowTemplate, NSRuleEditor, NSGestureRecognizer,
NSButtonTouchBarItem, NSCandidateListTouchBarItem,
NSClickGestureRecognizer, NSColorPickerTouchBarItem,
NSCustomTouchBarItem, NSGroupTouchBarItem,
NSMagnificationGestureRecognizer, NSPanGestureRecognizer,
NSPickerTouchBarItem, NSPopoverTouchBarItem, NSPressGestureRecognizer,
NSRotationGestureRecognizer, NSSharingServicePickerTouchBarItem,
NSSliderTouchBarItem, NSStepperTouchBarItem, NSTouchBarItem, NSTouchBar,
NSTouch, NSDockTile

formats  
Implement NSEPSImageRep. Marked GSImageMagickImageRep public. PICT.
Better encoding handling in RTF files.

theming and drawing  
Increase small font size to 10. New cursor and stepper images. Various
improvements.Lowered NSFloatingWindowLevel by one to distinguish
floating panels from menus.

NSFileWrapper move  
Move NSFileWrapper to Foundation.

platform compatibility  
Fixed build on Debian GNU/kFreeBSD. Improvements to WindowMaker
compatibility (e.g. WMFHideApplication support).

command line arguments  
With command line argument -autolaunch YES, do not activate the
application when -activateIgnoringOtherApps: is invoked.

<span id="001003000000">0.27.0</span>
-------------------------------------

This version includes numerous bugfixes, compatibility improvements and
other changes accumulated over the last year. It also enables work to be
done on integrating NSViews with a Core Animation renderer.

NSApplication  
Make targetForAction safer.

NSMenu  
Speed up menu updates.

Tools/speech  
Clean up speech tool compilation and switch to newer interface.

printing  
Fix bug in CUPS subclassing introduced in last release.

typesetting  
Minor improvments to typesetting.

NSKeyValueBinding  
Add NSIsControllerMarker.

NSSegmentedCell  
Fix tracking on segmented cell.

NSSliderCell  
Bring slider cell closer to Cocoa implementation.

NSView  
Add ivar for Core Animation in NSView.

printing  
Improve border calculation on printing.

NSApplication  
Lazy load app icon.

NSWorkspace  
Better detection of removable volumes.

translations  
Polish translations.

translations  
Japanese translations.

other  
Lots of bug fixes.

<span id="001004000000">0.26.2</span>
-------------------------------------

This version is a small, but important bugfix release.

printing  
Fix allocation of the CUPS printing classes.

installation  
Fix the configure script.

<span id="001005000000">0.26.1</span>
-------------------------------------

This version is released to conincide with version 1.25.1 of
gnustep-base, which contains changes required for this version of
gnustep-gui and gnustep-back.

It includes an important workaround for users of GNUstep Objective-C
Runtime (libobjc2) and non-fragile ABI to avoid a bug in interaction
between the clang compiler and the runtime when non-fragile ABI is in
use. Specifically, Clang and the runtime may disagree on what is the
offset of an ivar in a class's RAM. This manifested in a crash at
application startup due to misalignment of \_gcontext inside NSThread.
See the [mailing list
discussion](http://lists.gnu.org/archive/html/discuss-gnustep/2017-12/msg00129.html)
for more information.

It also contains the following changes:

tests  
Cleanup of warnings.

tests  
Fix text system deallocation test.

printing  
Undefine \_\_BLOCKS\_\_ before including cups.h, as some versions of the
header expect that libdispatch is present and used if \_\_BLOCKS\_\_ is
defined.

graphics context  
Workaround for Clang+libobjc2+nonfragile ABI issue.

<span id="001006000000">0.26.0</span>
-------------------------------------

Bumped due to binary incompatibilities between 0.25.0 and 0.25.1. Also
including numerous compatibility improvements from the Summer of Code
project, and a wide variety of other fixes. Fixes the use of
cupsGetPPD() in the printing system.

printing  
Add an include to get deprecated function cupsGetPPD() on newer CUPS
systems.

chore  
Bump required base version.

tiff  
Support for writing resolution.

jpeg  
Save resolution information if it is different from 72 dpi.

save panel  
Fix return type of sorting function.

events  
Add some newer Cocoa enums and one method with dummy implementation.

speech synthesis  
NSSpeechSynthesizerDelegate is now a @protocol on runtimes that support
it.

pasteboard  
New type identifiers.

translations  
Some work on Polish, Russian and German translations

cell  
Improvements to mouse tracking logic on NSCell.

image  
If an unknown named image is unarchived with a coder or keyed coder,
keep the name.

screen  
Add backingScaleFactor and return 1.0.

window  
Return 1.0 from -backingScaleFactor.

compatibility  
Numerous stub implementations of constants, classes and methods to
improve source-level compatibility.

other bugfixes  
Numerous other bugfixes.

<span id="001007000000">0.25.1</span>
-------------------------------------

New release.

Image library fixes.  
JPEG (saving) alpha channel fixes and size with resolution != 72. JPEG
resolution read support. TIFF saving fixes.

Mounting.  
Improved volumes mounting and support. Portability improvements in
volume mounting and support

Text layout.  
Corrected layout of empty strings.

Optimizations.  
Only update visible menus.

<span id="001008000000">0.25.0</span>
-------------------------------------

New release. Bumped due to detected binary incompatibility between
0.24.0 and 0.24.1.

GIF library update  
Fixes for new GIF library versions

Theming improvements  
Theming of named images for specific applications by the use of the
CFBundleIdentifier in the theme. New icons and corresponding constants
for special folders, recycler and others.

NSWorkspace  
Improvements in NSWorkspace icon lookup. Improvements in removable media
commands, imported and cleaned from GWorkspace.

Other  
Numerous bug fixes and improvements in Cocoa compatibility. Spanish
locale.

<span id="001009000000">0.24.1</span>
-------------------------------------

From a look through ChangeLog, we can see a lot of bugfixes for this
release, with the main focus on avoiding display glitches and improving
OSX compatibility.

NSColorListChangedNotification  
Removed.

NSColorPanelColorChangedNotification  
Removed.

NSImageInterpolation{Default,High,Low,None}  
Removed.

NSPrintHorizonalPagination  
Removed.

<span id="001010000000">0.24.0</span>
-------------------------------------

This is a major new stable release of GUI. Require newer base release as
we moved the -replaceObject:withObject: of NSKeyedUnarchiver there.  
New features include:

GIF library update  
Newer versions of the GIF library (5.0) have an incompatible interface
change. We now support the new interface as well as the old one and
detect at configure time which one to use.

NSTabView flipped  
NSTabView was the last view class that still had its flipped state
defined incorrectly. This finally got corrected.

Theme improvements  
A lot more of the gui appearance is now changable by a theme. The way
image names get mapped to real file names when loading has been
clearified.Better support for 9-patch images.

Additional Cocoa classes  
NSTreeController, NSTreeNode, NSStatusBar, NSStatusItem, NSTrackingArea

Many bugfixes and tweaks to improve look and feel  
Cursor display is a lot more consistent.

<span id="001011000000">0.23.1</span>
-------------------------------------

This is a bugfix release containint many minor bugfixes, but most
importantly fixing some coding/archiving bugs introduced in in the
NSInteger,NSUInteger,CGFloat changes.

<span id="001012000000">0.23.0</span>
-------------------------------------

This is a major new stable release of GUI. Note that this version is
binary incompatible with previous versions on 64-bit systems due to
changes in some variables based on changes in GNUstep base to the type
of NSNotFound.  
New features include:

NSInteger,NSUInteger,CGFloat  
API and internals updated to use new types

NSBezierPath  
Keyed encoding/decoding added

Many bugfixes and tweaks to improve look and feel  
Most of the changes in this release are individually small changes
fixing UI layout issues, responsiveness etc. The accumulated result
should be a significantly smoother look and feel.

<span id="001013000000">0.22.0</span>
-------------------------------------

This is a major new stable release of GUI. Note that to improve
stability, some features that were in previous releases have been
removed. Newer and better implementation of these features will be added
back soon. These include use of ghostscript and ImageMagic to
automatically translate image formats, and an implementation of
copy-on-scroll in NSClipView. Also note that this version is binary
incompatible with previous versions on 64-bit systems due to changes in
some variables based on changes in GNUstep base to the type of
NSNotFound. New features include:

Support for drawing the GUI with a scale factor, for high-DPI monitors.  
This is enabled automatically on Windows when the system DPI setting is
changed from its default of 96 in the Windows control panel. It can be
enabled on X11 (or the default overridden on Windows) by setting the
GSScaleFactor user default. For example, setting this to 1.5 would make
everything appear 50% larger.

The scale factor is implemented in GSWindowDecorationView; we use
NSView's built-in scaling support and call -\[NSWindow
userSpaceScaleFactor\] to determine how to manipulate the bounds and
frame rect of the window decoration view. NSUnscaledWindowMask is
respected, if it is part of a window's style mask. Note that changing
the scale factor without restarting applications is currently
unsupported, and all screens currently share the same scale factor. Both
of these limitations should be reasonably easy to fix in a future
release, however.

Character panel  
There is a character panel accessible from a button in the standard Font
panel. It requires libicu.

Color picker "Magnifier" tool, for grabbing the color of arbitrary parts of the screen  
Currently only implemented on X11/cairo.

Many new image formats supported for reading using Ghostscript and ImageMagick  
The Ghostscript image rep provides PS/EPS/PDF support, however it has
some limitations. It is quite slow. Only the first page is rendered,
because we use the pngalpha Ghostscript device, which is the only device
supporting 8-bit alpha.

Other improvements:

NSImage  
Mac OS X 10.6 drawing methods (-\[NSImage
drawInRect:fromRect:operation:fraction:respectFlipped:hints:\]). The rep
selection code was completely overhauled, and it should work much better
with images containing many reps. In particular, the DPI metadata in
images is now respected, and TIFF images containing multiple resolutions
are now fully supported.

Icons are now better supported. By icon, we mean an NSImage whose
representations are not all of the same point size. Icons are usually
ICNS or TIFF files. (Note that we aren't talking about a TIFF containing
sub-images with different pixel sizes but the same point sizes.) The
important thing about icons is -\[NSImage size\] should not be called,
because the icon doesn't have one single size in points, but many sizes,
so it's not clear which will be returned from this method. Similarly,
-\[NSImage drawAtPoint:fromRect:operation:fraction:\] should be avoided,
as should the -compositeToPoint: family of methods, since these use
-\[NSImage size\] to determine how big to draw the image. The benefit of
icons is that when -\[NSImage drawInRect:fromRect:operation:fraction:\]
is called, the rep with the largest point size smaller than or equal to
the rect to be drawn in will be chosen, resulting in better looking
output. For best results, call drawInRect: with a point size you expect
the icons to have, like 16x16 or 64x64.

NSCursor  
Support for creating 32-bit ARGB cursors on X11 (with the Xcursor
library)

NSView  
Autoresizing algorithm reimplemented to be closer to OS X. View frames
generated by autoresizing are now rounded to lie on pixel boundaries.

<span id="001014000000">Version 0.20.0</span>
---------------------------------------------

A new stable release. Many improvments with Nib loading, documents and
document controllers. Fixed many drawing issues, particularly ones
related to flipping. Much improved theming.

NSOutlineView  
Use NSInteger and CGFloat in method names where appropriate.

NSDocument  
Change result type of
method-saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:
from BOOL to void.

NSView  
New 10.5 methods.

NSCursor  
New 10.6 methods.

<span id="001015000000">Version 0.18.0</span>
---------------------------------------------

A new stable release that has had many improvements. Many new Mac OS X
methods (10.5 and newer) were added. Many Windows specific improvements
were made (particularly with the use of the Windows theme). There is
also better compatibility with Mac OS X in terms of usage of NSInteger
and other definitions.

NSSliderCell  
Initial implementaiton of circular sliders.

Spanish Translation  
Added spanish translations in various places.

NSDrawers  
They now work.

NSTableColumn  
New 10.6 methods and constants.

Themes  
Usage of themes to draw UI elements is almost completely implemented.

<span id="001016000000">Version 0.17.1</span>
---------------------------------------------

Bug fixes.

NSFont  
Add some missing interface methods from 10.5

NSSplitView  
Add live resize (can be turned off with GSUseGhostResize default)

<span id="001017000000">Version 0.17.0</span>
---------------------------------------------

Many many bug fixes and almost complete reorganization of NSToolbar
code.

NSBezierPath, NSAttributedString, NSLayoutManager  
New Mac OS X 10.5 methods.

NSSpeechSynthesizer  
New class.

NSSplitView  
Added new Mac OS X 10.5 methods and some ivars

Toolbars  
Many improvements. NSToolbar methods rearragned and ivar removed.

Menus  
MS Window-stype menus inside a window implemented

Garbage Collection  
Several improvements to work better with GC

HelpViewer  
GSHelpViewer use default added.

<span id="001018000000">Version 0.16.0</span>
---------------------------------------------

This is an stable release. A lot of improvements and bug fixes went into
this release. Thanks to Wolfgang Lux for fixing plenty of bugs. Note
that gnustep-core is now installed in the LOCAL domain by default
instead of the SYSTEM domain. You may want to remove old installations
in the SYSTEM domain to avoid any incompatibility problems. Or you can
force installation in SYSTEM using make
GNUSTEP\_INSTALLATION\_DOMAIN=SYSTEM install.

Nib Loading  
Several methods were added and Nib loading in general was refactored and
improved.

NSDocument  
Document autosaving was implemented.

NSSavePanel  
Several methods were added to implement support for document types with
multiple allowed file extensions.

NSWindow  
Definitions and skeleton implementation of attachedSheet.

NSTextView  
Renamed and changed types of attributes related to drag and drop.

NSLayoutManager  
New methods added to handle temporary attributes.

NSWindowController  
NSWindowController was made a subclass of NSResponder.

NSCell  
Rearranged somewhat to use GSTheme implemetations.

NSTokenField, NSTokenFieldCell  
New classes added.

<span id="001019000000">Version 0.14.0</span>
---------------------------------------------

This is an stable release.

NSGlyphGenerator  
New class for glyph generation (separated from other classes).

NSControl -mouseDownFlags  
Added old NeXT method for compatibility.

NSSplitView  
setAutosaveName: implemented and new instance variable added.

NSOpenGLView  
Added some Mac OS X 10.3 methods.

<span id="001020000000">Version 0.13.2</span>
---------------------------------------------

This is an unstable release.

NSPopUpButtonCell  
The encoding of this object was changed (which is backwards compatible,
but not forwards compatible.

NSTextView  
Add new X secondary selection behavior. Other Mac OS X methods added.

NSWindow  
Device interaction with backend has changed. This release of gui
requires the coresponding gnustep-back release 0.13.2.

NSSegmentedCell  
New class added to draw and render text in segments.

NSDrawer  
Implemented.

<span id="001021000000">Version 0.13.1</span>
---------------------------------------------

This is an unstable release. Changes to error handling and key-value
coding require an update to at least the base library version 1.15.1.

NSMenu  
Added more MacOS X methods and an ivar.

NSView  
Added support for hiding views.

Key-Value bindings  
Added Key-Value bindings implementation (NSKeyValueBinding) with support
in several classes (NSControl, NSTextField, NSView, etc).

NSTableView  
Added some MacOS X 10.4 methods.

NSCursor  
Changed hot point to 0,0 for MacOS X compatibility.

<span id="001022000000">Version 0.13.0</span>
---------------------------------------------

This is an unstable release. Changes to error handling and key-value
coding require an update to at least the base library version 1.15.1.

Licence  
Switched to use LGPL 3 and GPL 3.

New Methods added  
Added new methods from Mac OS X 10.4 for NSDragging, NSFontDescriptor,
NSAttributedString, NSImageView, NSStringDrawing, NSParagraphStyle,
NSView, NSCell, NSActionCell, NSAlert, NSApplication, NSBitmapImageRep,
NSBox, NSColor, NSColorSpace, NSComboBox, NSComboBoxCell,
NSDocumentController, NSEvent, NSScreen, NSFont, NSFontManager,
NSFormCell, NSForm, NSWindow, NSTextField, NSTextFieldCell. Some ivar
names were changed also.

Printing  
Moved Postscript printing methods from NSView to NSGraphicsContext.

View drawing  
Rewrote the NSView drawing mechanism to always use
\[displayRectIgnoringOpacity:inContext\].

Flipped Controls  
Report more controls as being flipped. (NSTextField, NSTableHeaderView,
NSSlider, NSProgressIndicator, NSButton) NSTabView is still missing.

Font Attribute  
Add font attribute fixing to NSAttributedString. To allow for the output
of glyphs not present in the current font.

Optimization  
In NSAffineTransform use optimized primitive methods from base.
Optimized the validation of edited cells.

Key-Value Binding  
Implementation of special connectors for Key-Value binding.

<span id="001023000000">Version 0.12.0</span>
---------------------------------------------

It has been a long time since the last release and many things have been
added and changed, including new classes, new ivars, and new methods.

Tooltips  
A Tooltip implementation was added.

NSBitmapImage Improvements  
Lots of improvements to the NSBitmapImage subclasses.

Theming Improvements  
GSTheme and other classes were added to improve support of theming.

New Methods added  
Added new methods from Mac OS X 10.4 for NSControl, NSResponder,
NSDocument, NSPrintOperation, NSWindowController, NSCell, NSMenuItem,
NSView. Some ivar names were changed also.

New ivars added  
Added new ivars for NSMenuItem, NSPrintOperation, NSTableView, NSDrawer,
NSScrollView, NSAlert, NSTextView.

New Classes Added  
New classes from Mac OS X 10.4 and earlier were added including
NSLevelIndicator, NSObjectController, NSUserDefaultsController,
NSKeyValueBinding, NSArrayController, NSController.

NSSpellServer moved to base  
NSSpellServer was moved to GNUstep base for Mac OS X compatibility.

NSTabViewType enumerations  
Enumerations were changed to match values from Mac OS X.

GNUstep GUI updated for Make 2.0  
GNUstep GUI was updated to work with GNUstep Make 2.0. This includes
versioned resources.

NSAffineTransform moved to base  
Much of NSAffineTransform was moved to gnustep-base to match with Mac
OS X. Many older methods were marked as deprecated in favor of the more
recent Mac OS X methods.

NSAlert in alternate threads  
NSAlerts are performed in the main thread even if called from another
thread.

NSAnimation Class Added  
Preliminary code for the NSAnimation class has been added. Only
NSAnimationNonBlocking mode implemented.

<span id="001024000000">Version 0.11.0</span>
---------------------------------------------

Keyed Encoding/Archiving  
Support for keyed encoding has been added to all gui classes.

Nib loading  
Nib loading has been implemented. For the most part, nibs are (or should
be) compatible between GNUstep and Mac OS X.

Color schemes and Themes  
Better support for color schemes and themes has been added. In the near
future theming should be integrated into gui itself.

RTFD  
Loading and writing of RTFD format was implemented.

<span id="001025000000">Version 0.10.3</span>
---------------------------------------------

Horizontal menus  
Horizontal (mac)-style menus should now work. Horizontal menus are
activated by setting the 'NSMenuInterfaceStyle' user default to
'NSMacintoshInterfaceStyle'.

Active applications  
Better support for tracking active applications was added. Normally a
workspace manager should handle this, but the GUI library can handle it
on its own if it is not handled any other way.

<span id="001026000000">Version 0.10.2</span>
---------------------------------------------

Power Off  
The notification center posts a power off notification before sending a
terminate: method sent from another app on the assumption that the
terminate: is from a session manager.

<span id="001027000000">Version 0.10.1</span>
---------------------------------------------

Sound library  
GNUstep now uses v19 of portaudio for the sound daemon. Version v19
hasn't been officially released, but it is still used in several
distributions (SuSE, etc) as v18 is very old.

<span id="001028000000">Version 0.10.0</span>
---------------------------------------------

The interface version of the gui library has changed in this release.
Applications, libraries and tools that wish to use this new version must
be recompiled (otherwise, they'll use the older version of the library).

Nib window autopositioning  
Nib loading has been improved to handle auto-positioning of windows.

NSFont  
An ivar was added to NSFont to cache flipped fonts.

NSApplication  
An ivar was added to track application launch.

Keyed Encoding  
Work was done in many classes to support keyed encoding. It may not be
fully implemented in every class, however.

Backend Versioning  
The GUI library now looks for the backend bundle with the corrent
interface version. Thus there should not be any problems with the GUI
using the wrong backend.

<span id="001029000000">Version 0.9.5</span>
--------------------------------------------

NSColor colors  
Added new control colors and methods from 10.3 version of Cocoa.

NSFont methods  
Added new font methods from 10.3 version of Cocoa

NSApplication -runModalSession  
Behavior of this method was changed. In particular it deviates from
Cocoa documentation. See the GNUstep GUI documentation for specifics.

Runtime version discovery of library  
A developer can discover the version of the gui library that is loaded
using the NSBundle methods
`[[NSBundle             bundleForLibrary: @"gnustep-gui"] infoDictionary]`
and retrieving the `GSBundleVersion` key.

<span id="001030000000">Version 0.9.4</span>
--------------------------------------------

Interface version change  
The interface version of the gui library has changed in this release.
There is no single reason for this change. Arguably, it should have been
done long ago. In the future the interface version will only change with
releases that have a new minor version number (that's the second number
in the release number). Applications, libraries and tools that wish to
use this new version must be recompiled (otherwise, they'll use the
older version of the library).

PPD's removed  
All the PPD's have been removed from the gui library into a separate
package (gnustep-ppd). There still exists a single Generic Postscript
Printer PPD which should work in many cases for printing using the
standard `lpr` interface. In the future, a `CUPS` interface should be
available that provides all the necessary printer information
automatically. If you still want use of the PPD's, you must install the
gnustep-ppd package, although this is not required for use of
gnustep-gui.

Printing framework  
The printing framework was generalized to allow for various types of
native printing systems. The lpr system is the only complete one,
although CUPS printing is in the works. As such, the printing classes
were revamped to handle this, and the actual system-specific code is
loaded from a bundle.

NSScroller, NSScrollView class size change  
A new ivar was added to the NSScroller and NSScrollView classes.

<span id="001031000000">Version 0.9.3</span>
--------------------------------------------

Spell checker daemon reimplemented using libaspell  
If the optional library libaspell is found, the spell checker will use
it (otherwise spell checking will not work).

New NSComboBox implementation  
NSComboBox and related classes have been re-implemented and documented.

NSToolbar code redone  
A lot of changes where made to the NSToolbar class to make it more
functional.

Binary Incompatibilities  
New ivars were added NSTableView, NSView, NSSavePanel. Applications that
use this class and subclasses (e.g. NSOutlineView) may need to be
recompiled to work properly.

  
