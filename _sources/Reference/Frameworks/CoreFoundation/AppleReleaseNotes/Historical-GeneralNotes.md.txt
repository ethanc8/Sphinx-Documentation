<span id="GeneralNotes"></span>  

# General Notes

## Property Lists

CFPropertyLists have been extended to include CFDate, CFNumber, and CFBoolean (extended from Foundation-style property lists); this makes the complete list of property list types CFArray, CFBoolean, CFData, CFDate, CFDictionary, CFNumber, and CFString. Please note that, although all these types are bridged between CF and the Foundation class equivalents, the Foundation methods that read property lists will silently fail (returning nil) if one of the new types are detected - this is to ensure compatibility with Foundation clients that are not prepared to handle the new types.  
  

## XML Parsing

Generalized XML handling has been added through CFXMLParser. There are still some parse options that are not supported. These are kCFXMLParserValidateDocument, kCFXMLParserReplacePhysicalEntities, and kCFXMLParserAddImpliedAttributes. Please see the comments in CFXMLParser.h for further details.  
  
There is a known bug in CFXMLCreateDataTypeDescriptionCopy(). If the description to be copied contains a NULL URL, CFXMLCreateDataTypeDescriptionCopy() tries to retain it, thereby crashing the program. Unfortunately, this will occur if CFXMLTreeCreateFromData() is called with a NULL dataSource argument. This can be worked around by providing any valid, non-NULL CFURL as the data source. This will be fixed in the first release after Developer Preview 3.  
  

## String

Please keep in mind that whether or not CFStringGetCStringPtr() and CFStringGetPascalStringPtr() return NULL might change between various releases of the CoreFoundation. These functions are provided for optimization purposes, and if they return NULL your code should fall back to the other functions which will return a value (if there is a value). See comments in CFString.h for details.  
  
We reemphasize this point as some internal performance changes in CFString could lead to these functions returning NULL more often in some cases (and less in others).  
  

## Debug Library

The CoreFoundation ships with a debug version of the binary. If you build your project with the "debug" target, it should be linked to the debug CoreFoundation binary.  
  
The debug binary contains debugging assertions and other checks to aid in project development. The debug binary is provided because the ordinary production binary for CoreFoundation does little or no checking at all, and in general does whatever you tell it to do, even if that is obviously wrong. For example, you can tell a CFArray to remove the value at index -1 (valid indices are non-negative from 0 to generally one less than the number of values in the array), and CFArray will do that -- however, that operation has now corrupted memory. If you are running with the debug CoreFoundation library, an assertion will catch this and a message will be printed out and the program terminated.  
  
Note that the use of debugging assertions is not totally wide-spread yet. We plan to introduce more assertions throughout CoreFoundation as the opportunity comes up.  
  

## "Toll-free" Bridging with Foundation classes

See the Foundation notes for information on the toll-free bridging between some CF types and Foundation classes. Types that are toll-free bridged (for instance, NSString and CFStringRef) can be used interchangeably in all APIs accepting either type.  
  

## CoreFoundation Examples

There are some small command-line CoreFoundation examples in /System/Developer/Examples/CoreFoundation. These are ready to use on Mac OS X; to bring them up on Mac OS 9 you need to import the source files into a project and link against CarbonLib and something like SIOUX to see the output.  