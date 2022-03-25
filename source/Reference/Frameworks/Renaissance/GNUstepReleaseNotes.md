# Release Notes

## 0.9

[Commit `2b3e3c0`](https://github.com/gnustep/libs-renaissance/commit/2b3e3c056846dc1eb5a17f17d20c2547c9e8e3c3)

```
  * Rewritten the autolayout managers and boxes; finalized the
    autolayout attributes

  * Improved display of lines showing autolayout boundaries (for
    debugging) by making it exact and not approximate

  * Renamed autolayout classes and protocols so that they are all
    consistently in the GSAutoLayout namespace.

  * New experimental <grid>, <gridRow> and <space> classes.  The grid
    is fairly complete, but doesn't support span yet.

  * New NSXML decoder backend that replaces &lt; and similar entities
    correctly on Apple.

  * Improved or added documentation of the <button>, <colorWell>,
    <control>, <hbox>, <hspace>, <image>, <label>, <secureTextField>,
    <vbox>, <view> and <vspace> tags

  * Extended and standardized available attributes of many tags,
    including <button>, <colorWell>, <control>, <image>, <label>,
    <menuItem>, <popUpButtonItem>, <textField>, <view>

  * Fixed memory leaks and various bugs.

  * Ported to Windows (via GNUstep).

  * Ported to Apple Mac OS X 10.5.

  * Updated for gnustep-make v2.

  * Updated to use newer key-value-coding API.

  * Added support for traditional subviews, autoresizing masks and
    hardcoded sizes

  * Fixed embedding boxes in splitviews.

  * Made it possible to compile and use Markup as a standalone non-GUI
    library.

  * Added support for escaping '#' in attributes.
  
  * Use precompiled headers to speed up compilation on GNUstep.

  * Tidied up alloc/init methods of GSMarkupTagObject.

  * Fixed setting autolayout flags for views directly embedded into an
    NSBox.

  * Fixed <vspace /> and <hspace />

  * Simplified compilation on Apple Mac OS X.

  * Updated DTD.

  * Added methods to remove views from boxes.

  * Extended warnings for errors in gsmarkup files such as
    non-existing actions.

  * Fixed overfull LaTeX boxes in the documentation.


XML Format Changes in version `0.9.0'
=====================================

This is a 0.x release so the XML tags and attributes are still subject
to some minor changes while we work towards a 1.0.0 release.

 * the 'align' attribute of the <label> and <textField> class has been
   renamed to 'textAlignment'.  The 'alignment' attribute of <image>
   has been renamed to 'imageAlignment'.  'textAlignment' and 'font'
   have been made more widely available in all controls with
   consistent names and no conflicts.

 * the 'color' attribute of <label> has been changed to 'textColor' to
   be consistent with attributes used in other tags.

 * the 'key' attribute of <button>, <menuItem> and <popUpButtonItem>
   has been changed to 'keyEquivalent' to be consistent with other
   attributes.

 * the 'span' attribute of <hbox> and <vbox> has been replaced by a
   'proportion' attribute.

 * the proportional boxes no longer automatically expand all the
   views.  Make sure you specify the alignment flags you want for each
   view.
```

## 0.8 - 2003-11-27

[Commit `4da2f1`](https://github.com/gnustep/libs-renaissance/commit/4da2f1bbddd5efacfd6f33cba71c56ff7117a330)

```	
    * Source/TagLibrary/GSMarkupTagImage.m ([-platformObjectInit]):
	Implement hasFrame and frameStyle attributes.
	* Source/TagLibrary/GSMarkupTagBox.m ([-gsAutoLayoutVAlignment],
	[-gsAutoLayoutHAlignment]): New methods fixing computing
	autolayout flags when the box content has autolayout flags
	manually specified in the XML.
		* Documentation/autolayout.tex: Added missing autolayout-flags
	label.
		* INSTALL.OSX: Updated for new filesystem layout.
	* INSTALL.OSX: Updated, including reference to using the .pbproj
	files provided by Chris Hanson.
	* Source/Markup/DecoderBackend/GSMarkupDecoderBackendCFXML.m:
	Fixed typo in instance variable declaration: should be
	CFXMLParserRef, not CFXMLParserRef * Source/(Reported by Chris
	Hanson <cmh@mac.com>).
	* Source/Markup/GSMarkupApplicationMain.m: Include GNUstep.h
	* Source/Markup/DecoderBackend/GSMarkupDecoderBackendGSXML.m:
	Update to new header structure.
	
	* Source/Markup/GSMarkupApplicationMain.h,
	Markup/GSMarkupApplicatonMain.m: New files.
	* Source/Markup/GNUmakefile.files: Added the new files.
	* Source/Renaissance.h: include GSMarkupApplicationMain.h.
	(with minor changes by Nicola Pero <n.pero@mi.flashnet.it>).
	* Source/Markup/GSMarkupConnector.h, Markup/GSMarkupConnector.m:
	Reorganized GSMarkupConnector and subclasses so that advanced
	connectors, such as associations, can be implemented.

	* Source/Markup/GSMarkupCoder.m ([GSMarkupCoder
	-encodeConnector:]): XML-escape key, value of attributes.  Encode
	connector contents as well.
	([GSMarkupCoder -encodeObject:]): Added cast.
	* Source/Markup/GSMarkupDecoder.m ([GSMarkupDecoder
	-processParsedTag:]): Fixed memory leak.
		* Documentation/gsmarkup.tex: Documented the <view> tag.
	* Documentation/title.tex: Updated dates.
	* Documentation/Pregenerated/: Regenerated.
	* Documentation/gsmarkup.tex: Updated/simplified documentation on
	NSDocument-based applications.
		* INSTALL.OSX: Updated instructions.
	* Examples/Applications/Ink/: New example contributed by Rodolfo
	W. Zitellini.

	* Source/TagLibrary/GSMarkupTagTextView.m ([-platformObjectInit]):
	Added richText, usesFontPanel, allowsUndo, usesRuler,
	importsGraphics attributes.
	
	* Source/TagLibrary/GSMarkupTagScrollView.m ([-platformObjectInit]):
	Added borderType attribute.  Use no border by default on Apple Mac
	OS X.
		* Examples/Classes/: New directory.
	* Source/TagLibrary/GSMarkupTagOutlineView.m: New file.
	* Source/TagLibrary/GSMarkupTagOutlineView.h: New file.
	* Source/TagLibrary/GNUmakefile: Added the new files.
	* Source/TagLibrary/GSMarkupTagTableView.h: New file.
	* Source/TagLibrary/GSMarkupTagTableView.m: New file.
	* Source/TagLibrary/GNUmakefile: Added the new files.

	* Source/TagLibrary/GSMarkupTagTableColumn.h: New file.
	* Source/TagLibrary/GSMarkupTagTableColumn.m: New file.
	* Source/TagLibrary/GNUmakefile: Added the new files.

	* Source/TagLibrary/GSMarkupTagScrollView.m ([-platformObjectInit]):
	Explicitly require bezel border type on GNUstep since that is no
	longer the default.

	* Source/AutoLayout/NSViewSize.m ([NSSplitView
	-sizeToFitContent]): New implementation computing size from
	subviews and dividers.
		* Examples/splitView2.gsmarkup: New file.
	* Source/TagLibrary/GSMarkupBrowser.h: New file.
	* Source/TagLibrary/GSMarkupBrowser.m: New file.
	* Source/TagLibrary/GNUmakefile: Added the new files.
		* Examples/secureTextField.gsmarkup: New file.
	* Source/TagLibrary/GSMarkupTagSecureTextField.h: New file.
	* Source/TagLibrary/GSMarkupTagSecureTextField.m: New file.	
	* Source/TagLibrary/GNUmakefile: Added the new files.
		* Examples/splitView.gsmarkup: New file.
	* Source/TagLibrary/GSMarkupTagSplitView.h: New file.
	* Source/TagLibrary/GSMarkupTagSplitView.m: New file.
	* Source/TagLibrary/GNUmakefile: Added the new files.

	* Source/AutoLayout/GSAutoLayoutDefaults.m
	([NSSplitView -autolayoutDefaultHorizontalAlignment]): New method.
	([NSSplitView -autolayoutDefaultVerticalAlignment]): New method.
	* Source/AutoLayout/NSViewSize.m ([NSSplitView -sizeToFitContent]): New
	method.
		* Documentation/gsmarkup.tex: Updated description of the
	type="font" attribute of menu tags.
	* Documentation/Pregenerated/: Regenerated.

	* Source/TagLibrary/GSMarkupTagMenu.m: Renamed predefined="font"
	to be type="font"; dropped old type="font" code.
	
	* Source/TagLibrary/GSMarkupTagMenu.m: Recognize predefined="font"
	attribute, and create the menu as the font menu using the
	NSFontManager fontMenu: API in that case.

	* Source/AutoLayout/: All files: include local files using include
	"xxx", not include <xxx>.
	* Source/Markup/: Same change.
	* Source/TagLibrary/: Same change.
```

## 0.7 - 2003-01-31

```	* Documentation/Tutorials/Renaissance/Renaissance.tex: Updated
	examples to use the new <menu> grammar for submenus.  Added a
	short paragraph explaining that you only need separate gsmarkup
	files for menus, not for windows.
	* Documentation/Tutorials/Renaissance/Pregenerated/: Regenerated.
	* Documentation/gsmarkup.tex: Updated documentation on menus for
	the new <menu>, <menuItem> syntax.
	* Documentation/Pregenerated/: Regenerated.
	* Documentation/gsmarkup.tex: Removed reference to no longer
	existing <separator> tag for menu separators.
	* Examples/menu.gsmarkup, menu1.gsmarkup: Updated for new <menu>,
	<menuItem> grammar.
		* Documentation/gsmarkup.dtd: <menu> can now have a <menu> in its
	contents; <menuItem> is now empty.
	* Examples/Applications/Templates/: New directory.

	* Source/GNUmakefile (VERSION): Version 0.7.0

	Warning: change in .gsmarkup format.  To create a submenu, you now
	embed directly a <menu> tag in another <menu> tag.
	* Source/TagLibrary/GSMarkupTagMenu.m ([-platformObjectInit]):
	Manage <menu> tags in the content: silently create a NSMenuItem,
	and put the NSMenu from the <menu> inside it.
	* Source/TagLibrary/GSMarkupTagMenuItem.m ([-platformObjectInit]):
	Emit a deprecation warning if a <menuItem> has a content.  But
	keep the old gsmarkup files working still for a while. :-)

	* Source/TagLibrary/GSMarkupWindowController.m: Include GNUstep.h
	on Apple Mac OS X.
	* Source/TagLibrary/GSMarkupDocument.m: Same change.

	* Source/TagLibrary/GSMarkupTagPopUpButtonItem.m ([-platformObjectInit]):
	Recognize key attribute.
	* Documentation/Tutorials/Renaissance/Renaissance.tex: Fixed a few
	typos reported by Peter Cooper (<comrade@obverse.com.au>).
	* Documentation/Tutorials/Renaissance/Pregenerated/: Regenerated.
	* Documentation/gsmarkup.dtd: Changed 'class' attribute of
	<instance> to 'instanceOf'; added 'instanceOf' attribute for
	<window>, <panel> and <image>.
	* Documentation/macros.tex: New file, documenting the GNUstep
	macros provided by Renaissance.
	* Documentation/GNUmakefile (manual_LATEX_FILES): Added the new file.
	* Documentation/manual.tex: Include the new file.
	* Documentation/Pregenerated/: Regenerated.
	* Documentation/gsmarkup.tex: Updated and extended documentation
	on accessing the top-level objects.
	* Documentation/Pregenerated/: Regenerated.
	* Documentation/gsmarkup.tex (Integrating Renaissance in your
	application): New documentation on how to integrate/use
	Renaissance in practice in an application.  Includes new section
	on the new GSMarkupDocument and GSMarkupWindowController classes,
	which allow to use Renaissance in NSDocument-based applications.
	* Documentation/title.tex: Updated copyright dates.
	* Documentation/Pregenerated/: Regenerated.
	* Examples/Applications/SimpleEditor/: New example.
	* Tools/GSMarkupBrowser.m: Use the new API -bundleDidLoadGSMarkup: to
	access the top-level objects to set the display autolayout
	containers flag.
	* Source/Markup/GSMarkupBundleAdditions.h,
	Markup/GSMarkupBundleAdditions.m: Implemented sending a
	GSMarkupBundleDidLoadGSMarkup notification, with the top-level
	objects in the user info dictionary, after the file is loaded;
	automatically call the -bundleDidLoadGSMarkup: method of the file
	owner if it implements it.

	* Source/TagLibrary/GSMarkupDocument.h: New file.
	* Source/TagLibrary/GSMarkupDocument.m: New file.
	* Source/TagLibrary/GSMarkupWindowController.h: New file.
	* Source/TagLibrary/GSMarkupWindowController.m: New file.
	* Source/TagLibrary/GNUmakefile: Added the new files.
	* Source/Renaissance.h: Include GSMarkupDocument.h and
	GSMarkupWindowController.h.

	* Source/TagLibrary/GSMarkupTagWindow.m ([-platformObjectInit]):
	Small code reorganization: read resizable flag before computing
	resizability from autolayout flags, avoiding the computation if
	not needed.

	Change in API: 'class' attribute renamed to 'instanceOf' to
	prevent possible confusion with CSS usage of the same attribute.
	* Source/Markup/GSMarkupTagObject.h ([-useClassAttribute]):
	Renamed to useInstanceOfAttribute.
	* Source/Markup/GSMarkupTagObject.m ([-useClassAttribute]):
	Renamed to useInstanceOfAttribute.  ([-platformObjectAlloc]): Use
	instanceOf attribute instead of class attribute; call
	useInstanceOfAttribute instead of useClassAttribute.
	* Source/Markup/GSMarkupTagInstance.m ([-platformObjectAlloc]):
	Use instanceOf attribute instead of class attribute.
	* Source/TagLibrary/GSMarkupTagWindow.m ([-useClassAttribute]):
	Renamed to useInstanceOfAttribute.
	* Source/TagLibrary/GSMarkupTagView.m ([-useClassAttribute]):
	Renamed to useInstanceOfAttribute.
		* Tools/GSMarkupBrowser.m: Implemented turning on display of
	autolayout containers if user defaults DisplayAutoLayout
	is set to YES.
		* Documentation/gsmarkup.tex: Updated the window tag
	documentation.
	* Documentation/Pregenerated/: Regenerated.
	* Documentation/gsmarkup.tex: Updated - renamed 'class' attribute
	to 'instanceOf'.
	* Documentation/Pregenerated/: Regenerated.
	* Examples/calculator.gsmarkup: Updated to use instanceOf
	attribute instead of class.
	* Examples/class.gsmarkup: Same change.
	* Examples/class2.gsmarkup: Same change.
	* Examples/instance.gsmarkup: Same change.
		* Documentation/gsmarkup.tex (subsection{The \texttt{<gsmarkup>}
	tag}): Added missing parenthesis.
	* Documentation/gsmarkup.tex: Documented the class attribute.
	Fixed some small overfull TeX boxes.
	* Documentation/Pregenerated/: Regenerated.	
	* Source/Markup/DecoderBackend/GSMarkupDecoderBackendLibXML.m ([-parse]):
	Updated a little to set features, in particular the 'substitute
	entities' feature, so that &gt; and similar basic entities are
	automatically substituted.
		* INSTALL.OSX: Changed 'Apple OSX' to be 'Apple Mac OS X'.
	
	* Source/Markup/DecoderBackend/GSMarkupDecoderBackendLibXML.m: New
	file implementing a direct libxml2 based backend, for future use
	on OpenStep 4.x systems (adapted to new decoder backend
	organization by Nicola).
	* Source/Markup/GSMarkupDecoderBackend.h,
	* Source/Markup/GSMarkupDecoderBackend.m: Rewritten to have a very
	general public API with no reference whatsoever to
	backend-specific implementation details.
	* Source/Markup/DecoderBackend/: New directory.
	* Source/Markup/DecoderBackend/GSMarkupDecoderBackendCFXML.m: New
	file, with CFXML code taken from GSMarkupDecoderBackend.m.
	* Source/Markup/DecoderBackend/GSMarkupDecoderBackendGSXML.m: New
	file, with GSXML code taken from GSMarkupDecoderBackend.m.
	* Source/Markup/GSMarkupDecoder.m ([-initWithData:]): Get the
	decoder backend using the new API.
```

## 0.6 - 2003-01-12

```
	* Examples/button1.gsmarkup: Use NSApplicationIcon, not GNUstep
	image, so it works on all systems.
	* Examples/image.gsmarkup: Idem.
	* Examples/panel4.gsmarkup: Idem.

	* Examples/button-types.gsmarkup: Added image buttons, tidied up
	layout.

	* Source/TagLibrary/GSMarkupTagButton.m ([-platformObjectInit]):
	Manually fix font for buttons on Apple Mac OS X.  Use
	NSSquaredBezelStyle for buttons with images.
	* Source/AutoLayout/GSAutoLayoutDefaults.m: Hack to roughly adjust
	borders of buttons on Apple Mac OS X.
	
	* Source/Renaissance.h: Include GSAutoLayoutDefaults.h.	
	* Source/AutoLayout/GSAutoLayoutDefaults.m ([NSView
	-setDisplayAutoLayoutContainers:]): New method.
	([NSWindow -setDisplayAutoLayoutContainers:]): New method.
	* Source/AutoLayout/GSAutoLayoutDefaults.h: Declare and comment
	the new methods.
	* Source/AutoLayout/GSHBox.h (_displayAutoLayoutContainers): New ivar.	
	* Source/AutoLayout/GSVBox.h (_displayAutoLayoutContainers): New ivar.
	* Source/AutoLayout/GSHBox.m ([-setDisplayAutoLayoutContainers:]):
	New method.  ([-drawRect:]): New method.
	* Source/AutoLayout/GSVBox.m ([-setDisplayAutoLayoutContainers:]):
	New method.  ([-drawRect:]): New method.
	
	* Examples/button-types.gsmarkup: New file.

	* Source/TagLibrary/GSMarkupTagButton.m ([-platformObjectInit]): 
	On Apple Mac OS X, set bezel style / bordered to try match the
	default native look & feel.

	* Source/TagLibrary/GSMarkupTagButton.m ([-platformObjectInit]):
	Implemented type attribute.
	
	* INSTALL, NOTES.OSX, README: Changed 'Apple OSX' to be 'Apple Mac
	OS X'.

	* Documentation/autolayout.tex, gsmarkup.tex: Use 'Apple Mac OS
	X', not 'Apple OSX'.
	* Documentation/Pregenerated/: Regenerated.
	* Documentation/Tutorials/Renaissance/Renaissance.tex: Use 'Apple
	Mac OS X', not 'Apple OSX'.
	* Documentation/Tutorials/Renaissance/Pregenerated/: Regenerated.

	* Documentation/gsmarkup.tex: Updated documentation on
	awakeFromGSMarkup.
	* Documentation/Pregenerated/: Regenerated.

	* Examples/README: Explain that this directory contains many files
	which are actually tests, not examples.

	* Examples/form.gsmarkup: New file.

	* Source/GNUmakefile, Markup/GSMarkupDecoderBackend.h,
	TagLibrary/GSMarkupTagBox.m, TagLibrary/GSMarkupTagMenuItem.m:
	Replaced 'Apple OSX' with 'Mac OS X' in comments.

	* Source/Markup/GSMarkupBundleAdditions.m ([NSBundle
	+registerStaticObject:withName:]): Declare to prevent warnings on
	Apple.

	Fixed decoder so that it sends awakeFromGSMarkup to all platform
	objects created, plus on the NSOwner; not just to the top-level
	objects.
	* Source/Markup/GSMarkupAwaker.h: New file.
	* Source/Markup/GSMarkupAwaker.m: New file.
	* Source/Markup/GNUmakefile.files: Added the new files.
	* Source/Markup/GSMarkupBundleAdditions.m ([+loadGSMarkupData:withName:
	externalNameTable:withZone:localizableStringsTable:inBundle:
	tagMapping:]): Create an awaker, and use it to awake the objects.
	* Source/Markup/GSMarkupTagObject.h (_awaker): New instance
	variable.
	([-setAwaker:], [-setPlatformObject:]): New methods.
	* Source/Markup/GSMarkupTagObject.m: Implemented the new methods,
	and use them and the new instance variables in the existing ones.
	* Source/Markup/GSMarkupTagInstance.m ([-platformObjectAlloc]):
	Use setPlatformObject: rather than assigning to _platformObject
	directly.
	* Source/TagLibrary/GSMarkupTagBox.m: Everywhere, use
	setPlatformObject: rather than assigning to _platformObject
	directly.
	* Source/TagLibrary/GSMarkupTagBoxSeparator.m: Same change.
	* Source/TagLibrary/GSMarkupTagControl.m: Same change.
	* Source/TagLibrary/GSMarkupTagHbox.m: Same change.
	* Source/TagLibrary/GSMarkupTagMatrixCell.m: Same change.
	* Source/TagLibrary/GSMarkupTagMatrixRow.m: Same change.
	* Source/TagLibrary/GSMarkupTagMenu.m: Same change.
	* Source/TagLibrary/GSMarkupTagMenuItem.m: Same change.
	* Source/TagLibrary/GSMarkupTagMenuSeparator.m: Same change.
	* Source/TagLibrary/GSMarkupTagScrollView.m: Same change.
	* Source/TagLibrary/GSMarkupTagVbox.m: Same change.
	* Source/TagLibrary/GSMarkupTagView.m: Same change.
	* Source/TagLibrary/GSMarkupTagWindow.m: Same change.
	* Source/TagLibrary/GSMarkupTagFormItem.h: Removed obsolete
	declaration of setPlatformObject:.
	* Source/TagLibrary/GSMarkupTagPopUpButtonItem.h: Same change.
	* Source/TagLibrary/GSMarkupTagFormItem.m: Removed obsolete
	implementation of setPlatformObject:.
	* Source/TagLibrary/GSMarkupTagPopUpButtonItem.m: Same change.	

	* Source/TagLibrary/GSMarkupTagForm.m ([-platformObjectInit]):
	Push the form item platform object into the form item, so that the
	form items can be connected via outlets.  Localize titles of form
	items.
	* Source/TagLibrary/GSMarkupTagFormItem.m ([-setPlatformObject:]):
	New method.
	([+localizableAttributes]): New method.
	* Source/TagLibrary/GSMarkupTagFormItem.h ([-setPlatformObject:]):
	Declare.

	* Examples/class2.gsmarkup: Workaround problem on Mac OS X.

	* Examples/class.gsmarkup: New file.
	* Examples/class2.gsmarkup: New file.

	* Documentation/gsmarkup.tex (Advanced embedded outlets using key
	value paths): Expanded and made more friendly documentation on
	advanced embedded outlets.
	* Documentation/Pregenerated/: Regenerated.

	Implemented class="Xxx" attribute for all view and window tags.
	* Source/Markup/GSMarkupTagObject.m ([-platformObjectAlloc]):
	Modified to support, in the appropriate cases, a 'class="xxx"'
	attribute customizing the class used to allocate the instance.
	([+useClassAttribute]): New method.
	([+defaultPlatformObjectClass]): New method.
	* Source/Markup/GSMarkupTagObject.h: Declared the new methods, and
	documented the new behaviour.
	* Source/TagLibrary/GSMarkupTagBox.m ([+defaultPlatformObjectClass]):
	Added.
	([-platformObjectAlloc]): Removed.
	* Source/TagLibrary/GSMarkupTagButton.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagColorWell.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagControl.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagForm.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagHbox.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagHspace.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagImage.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagLabel.m: Similar changes.	
	* Source/TagLibrary/GSMarkupTagMatrix.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagMatrixCell.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagPanel.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagPopUpButton.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagScrollView.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagTextField.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagTextView.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagVbox.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagVspace.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagView.m: Similar changes.
	* Source/TagLibrary/GSMarkupTagWindow.m: Similar changes.

	* Source/TagLibrary/GSMarkupTagView.m ([+useClassAttribute]): Added,
	return YES.
	* Source/TagLibrary/GSMarkupTagWindow.m ([+useClassAttribute]): Added,
	return YES.
	
	* Examples/advancedOutlet.gsmarkup: New file.
	
	* Documentation/gsmarkup.tex (Attributes referring to other
	objects): More documentation about having #NSApp always available
	as the shared application object.
	(The id attribute): Document the fact that ids should not contain
	dots.
	(Advanced embedded outlets using key value paths): New section.

	Updated documentation in various places to explain shortly about
	the new #NSApp.delegate syntax in connectors.

	* Documentation/Pregenerated/: Regenerated.

	* Source/Markup/GSMarkupDecoder.m ([-processParsedTag:]): Ignore
	dots and everything following dots in ids.

	Implemented support for the syntax #NSApp.delegate in connectors
	and embedded outlets.
	* Source/Markup/GSMarkupConnector.m ([GSMarkupConnector
	-getObjectForIdString:usingNameTable:]): New private method.
	([GSMarkupOutletConnector -establishConnectionUsingNameTable:]):
	Use the new method to look up ids.
	([GSMarkupControlConnector -establishConnectionUsingNameTable:]):
	Idem.

	* Documentation/gsmarkup.tex (subsection{How objects are given
	ids}): Removed comment about having #NSApp always available being
	a potential idea - I've now implemented it.
	* Documentation/Pregenerated/: Regenerated.

	* GNUmakefile (SUBPROJECTS): Do not include Documentation on
	GNUstep, for safer compilation.

	* Examples/popUpButton2.gsmarkup: Set target of terminate item to
	#NSApp.

	* Examples/NSApp.gsmarkup: New file.

	* Source/TagLibrary/GSMarkupTagPopUpButtonItem.m ([-setPlatformObject:]):
	Fixed memory bug.

	* Source/Markup/GSMarkupBundleAdditions.m: Implemented
	automatically adding NSApp with id NSApp to the name table if
	running with a GUI.

	* Examples/vbox2.gsmarkup: New file.

	* Examples/popUpButton.gsmarkup: New file.
	* Examples/popUpButton2.gsmarkup: New file.

	* Examples/button2.gsmarkup: New file.

	* Examples/image.gsmarkup: New file.
	* Examples/panel4.gsmarkup: Use the new image tag.

	* Source/AutoLayout/NSViewSize.m ([NSImageView
	-sizeToFitContent]): Added a hack implementation of
	sizeToFitContent for NSImageView on Mac OS X.

	* Source/TagLibrary/GSMarkupTagPopUpButtonItem.m: Sort of
	hackishly rewritten to store a platform object, so that outlets
	such as target can be used on it; added tag and action attributes.
	* Source/TagLibrary/GSMarkupTagPopUpButtonItem.h: Corresponding
	update.
	* Source/TagLibrary/GSMarkupTagPopUpButton.m ([-platformObjectInit]):
	Localize titles; updated code for new popup button items.

	* Source/TagLibrary/GSMarkupTagControl.m: Removed editable and
	selectable attributes, added enabled attribute.
	* Source/TagLibrary/GSMarkupTagImage.m: Added editable attribute.
	* Source/TagLibrary/GSMarkupTagTextField.m: Added editable and
	selectable attributes.
	* Source/TagLibrary/GSMarkupTagTextView.m: The same.

	* Source/TagLibrary/GSMarkupTagImage.m: New file.
	* Source/TagLibrary/GSMarkupTagImage.h: New file.
	* Source/TagLibrary/GNUmakefile: Added the new files.
	
	* Documentation/gsmarkup.tex: Documented the image tag.
	* Documentation/gsmarkup.dtd: Added some code for the image tag.
	* Documentation/Pregenerated/: Regenerated.

	* Documentation/gsmarkup.tex: When talking about portability of
	<menu> tags, explain that on OSX there should be a single
	type="apple" submenu.
	* Documentation/Pregenerated/: Regenerated.

	* Documentation/Tutorials/Renaissance/Renaissance.tex (Adding a
	menu): Explain that there should be a single menu with
	type="apple" on Apple OSX.
	* Documentation/Tutorials/Renaissance/Pregenerated/: Regenerated.
```

## 0.5 - 2002-12-31

```

	* README: Added reference to GNUstep Renaissance homepage.
	* GNUmakefile (CVS_MODULE_NAME, CVS_FLAGS, RELEASE_DIR): Added.

	* ANNOUNCE: Cut down the last few sentences, which do
	not really explain much.
	* README: Expanded; rewritten.

	* Source/GNUmakefile (VERSION): Version is now 0.5.0.

	* Source/GNUmakefile: Use apple, not nx library-combo.

	* GNUmakefile: Check that FOUNDATION_LIB is apple, not nx.
	* INSTALL.OSX: Updated configure instructions -- the 
	--with-library-combo=nx flag is no longer needed.

	* Documentation/Tutorials/Renaissance/Renaissance.tex: Updated to
	latest gnustep-make from CVS: use apple, not nx library-combo in
	makefiles.
	* Documentation/Tutorials/Renaissance/Pregenerated/: Regenerated.

	* Documentation/Tutorials/Renaissance/Renaissance.tex (section{Adding
	a menu}): Fixed typo: type="menu" instead of type="main" (Reported
	by b.gohla@gmx.de).
	* Documentation/Tutorials/Renaissance/Pregenerated/: Regenerated.

	* Documentation/GNUmakefile: Added Tutorials subproject.
	* Documentation/Tutorials/: New directory.
	* Documentation/Tutorials/GNUmakefile: New file. 
	* Documentation/Tutorials/Renaissance/: New directory.
	* Documentation/Tutorials/Renaissance/.latex2html-init: New file.
	* Documentation/Tutorials/Renaissance/GNUmakefile: New file.
	* Documentation/Tutorials/Renaissance/Renaissance.tex: New file.
	* Documentation/Tutorials/Renaissance/Pregenerated/: New directory.
	* Documentation/Tutorials/Renaissance/Pregenerated/*: New files.

	* Documentation/.latex2html-init: New file.
	* Documentation/Pregenerated/: Regenerated.
	
	* ANNOUNCE: New file added.

	* Source/TagLibrary/GSMarkupTagWindow.m ([-platformObjectInit]):
	Do not defer the window -- deferred windows are somewhat fragile
	on GNUstep -- better keep the code robust for now.
	
	* TODO: Marked fixing comments as done.

	* Documentation/autolayout.tex (Renaissance AutoLayout support for
	minimum sizes): Fixed error in example code.
	* Documentation/Pregenerated/: Regenerated.

	* Documentation/autolayout.tex: Minor spelling fixes and small
	tidyups.
	* Documentation/Pregenerated/: Regenerated.

	* Examples/comment.gsmarkup: New file.
	* Examples/comment2.gsmarkup: New file.
	* Examples/comment3.gsmarkup: New file.

	* Source/Markup/GSMarkupDecoderBackend.m (GSMarkupCreateStructure):
	Copy the CFXML text of a node before using it.  Fixes weird
	decoding bugs on Apple OSX.

	Fixed processing comments, and implemented collapsing whitespaces,
	newlines and tabs in the HTML way.
	* Source/Markup/GSMarkupDecoder.m ([NSString
	-stringByStrippingWhitespaces]): New auxiliary method.
	([GSMarkupTag -addStringToContent:]): New method.
	([GSMarkupTag -finalizeStrings]): New method.
	([GSMarkupDecoder +initialize]): New method.
	([GSMarkupDecoder -foundFreeString:name]): Use the new methods of
	GSMarkupTag; updated for changes.
	([GSMarkupDecoder -processParsedTag:]): Call finalizeStrings.
	* Source/Markup/GSMarkupDecoderBackend.m: Do not trim manually the
	free strings when found.  That stage has been moved in the upper
	layer, the decoder, where it can be done more intelligently.

	* Source/AutoLayout/GSHBox.m ([-sizeToFitContent]): Implemented.
	* Source/AutoLayout/GSVBox.m ([-sizeToFitContent]): Implemented.

	* Source/AutoLayout/GSHBox.m: For simplicity use int not unsigned
	int.
	* Source/AutoLayout/GSVBox.m: Same change.

	* Source/AutoLayout/GSHBox.m ([-setHorizontalAlignment:forView:]):
	Recompute the _hExpand and _hWeakExpand flags properly.
	([-setVerticalAlignment:forView:]): The same for the _vExpand and
	_vWeakExpand flags.
	* Source/AutoLayout/GSVBox.m: Same changes.
```

## 0.1 - 2002-12-26

I am very excited to announce the first public release of GNUstep
Renaissance.

GNUstep Renaissance is meant to provide us with a new, revolutionary way
of writing GNUstep applications.

In a few words, GNUstep Renaissance replaces .nib (and .gorm and .gmodel)
files with .gsmarkup files.

.gsmarkup files are plain XML files with a syntax designed to be very
easily edited by hand.  Rather than encoding all the internal details of
objects to disk, in the way that .nib and .gorm (and, in a similar way,
.gmodel do), .gsmarkup files contain a simple logical description of what
the user interface is meant to be.

That way, .gsmarkup files are easy to edit, and avoid completely the
portability problems that affect all previous technologies (.nib, .gorm,
.gmodel).

.gsmarkup do not encode absolute positions and sizes of widgets in the way
.nib, .gorm and .gmodel do.  GNUstep Renaissance provides box objects and
intelligent default autolayout behaviour.  All widgets positions and sizes
are automatically computed at run time.

As another beneficial side effect, .gsmarkup are very easily translated.  
You just provide a .strings file with the translations, and GNUstep
Renaissance automatically replacese the strings with their translations at
run time.  No need to generate a separate interface for each language!

There is more than this :-) but I'm trying to make a very short summary
(and easy to grasp).

Just a last thing - outlets and connectors have been integrated really
neatly in the XML files.

I have personally ported GNUstep Renaissance to run on Apple OSX 10.2.3.  
This means that *any* application using .gsmarkup files for its interfaces
will compile and run exactly the same on GNUstep and Apple OSX.  GNUstep
Renaissance finally smashes down the .nib portability barrier!! :-)

As demonstrators, GNUstep Renaissance includes a few applications -
CurrencyConverter, Calculator, Finger - which use .gsmarkup files for
their interfaces, and compile, build and run without changes in source
code between GNUstep and Apple OSX.  I also ported Gomoku to run in the
same way, but I'd like to keep it separate.

Portability works - there is only one real tweak - menus need to be build
from separate files for the two platforms.  The reason is that the menu
layouts and conventions differ so much between the two platforms, that to
have your menus look & feel 'native', you really have to have
platform-specific menus.

The future of GNUstep Renaissance will include a graphical .gsmarkup
editor.  A clone of IB/Gorm if you want, possibly derived from Gorm.  The
application itself will be written using GNUstep Renaissance, and so will
hopefully run on both GNUstep and Apple OSX, putting a final end of the
story to any .nib portability problem.

Before starting work on the IB clone, I want to finalize the .gsmarkup and
autolayout API and documentation.

Last, I want to point out that GNUstep Renaissance is experimental
software, and the internals (and probably part of the public APIs too) are
bound to change a lot still.  Keep in mind that it's alpha software,
experimental, and I'm making it public not because it's finished but
because ... well because it's enough powerful and usable that it really
makes no longer sense to keep it locked inside my laptop(s). :-)

GNUstep Renaissance is free software (LGPL), and it's part of the GNUstep
suite; it is available on gnustep's CVS, under

 dev-libs/Renaissance

I suppose the CVS command to get it should be something like 

  cvs -d:pserver:anoncvs@subversions.gnu.org:/cvsroot/gnustep login

  cvs -z3 -d:pserver:anoncvs@subversions.gnu.org:/cvsroot/gnustep co dev-libs/Renaissance

If you want to try it out on Apple OSX, you need gnustep-make from CVS in
order to compile GNUstep Renaissance from sources (you don't need it to
use the framework, but I don't provide a binary distribution at the
moment).  Full instructions inside Renaissance.

If you want to try it out on GNUstep, just grab Renaissance.