<!-- [Up](BaseTools.html)   -->

<span id="title$autogsdoc">Autogsdoc -- a tool to make documentation from source code</span>
============================================================================================

### Authors

Richard Frith-Macdonald ([`richard@brainstorm.co.uk`](mailto:richard@brainstorm.co.uk))  

**Copyright:** (C) 2001-2016 Free Software Foundation, Inc.

<!-- ------------------------------------------------------------------------

### Contents -

1.  [The autogsdoc tool](#001000000000)
2.  [Overview](#001001000000)
3.  [Source Code Markup](#001002000000)
4.  [Extra markup](#001003000000)
5.  [Method markup](#001004000000)
6.  [Automated markup](#001005000000)
7.  [Arguments and Defaults](#001006000000)
8.  [Inter-document linkage](#001007000000)
9.  [Implementation Notes](#001008000000)

------------------------------------------------------------------------

<span id="001000000000">The autogsdoc tool</span>
================================================= -->

<span id="001001000000">Overview</span>
---------------------------------------

The autogsdoc tool is a command-line utility that helps developers produce reference documentation for GNUstep APIs. It also enables developers to write and maintain other documentation in XML and have it converted to HTML. In detail, autogsdoc will:

-   Extract special comments describing the public interfaces of classes, categories, protocols, functions, and macros from Objective C source code (header files and optionally source files) into GSDoc XML files. (Note that since C is a subset of Objective C, this tool can operate to document functions and other C structures in plain C source.)
-   Convert GSDoc XML files, whether generated from source code or written manually by developers, into HTML.
-   Construct indices based on GSDoc XML file sets, and convert those to HTML as well.

synopsis: `autogsdoc (options) (files)`  
    (options) described below  
    (files) `.h`, `.m`, `.gsdoc`, and/or `.html` files, in any order.

The most common usage this is to run the command with one or more header file names as arguments... the tool will automatically parse corresponding source files in the same directory as the headers (or the current directory, or the directory specified using the DocumentationDirectory default), and produce GSDoc and HTML files as output. For best results this mode should be run from the directory containing the source files.

GSDoc files may also be given directly in addition or by themselves, and will be converted to HTML. See the [GSDoc reference](gsdoc.html) for information on the GSDoc format.

Finally, HTML files may be given on the command line. Cross-references to other parts of code documentation found within them will be rewritten based on what is found in the project currently.

<span id="001002000000">Source Code Markup</span>
-------------------------------------------------

The source code parser will automatically produce GSDoc documents listing the methods in the classes found in the source files, and it will include text from specially formatted comments from the source files.

Any comment beginning with slash and *two* asterisks rather than the common slash and single asterisk, is taken to be GSDoc markup, to be use as the description of the class or method following it. This comment text is reformatted and then inserted into the output.  
Where multiple comments are associated with the same item, they are joined together with a line break (&lt;br /&gt;) between each if necessary.  
Within a comment the special markup &lt;ignore&gt; and &lt;/ignore&gt; may be used to tell autogsdoc to completely ignore the sourcecode between these two pieces of markup (ie. the parser will skip from the point just before it is told to start ignoring, to just after the point where it is told to stop (or end of file if that occurs first).

The tool can easily be used to document programs as well as libraries, simply by giving it the name of the source file containing the main() function of the program - it takes the special comments from that function and handles them specially, inserting them as a section at the end of the first chapter of the document (it creates the first chapter if necessary).

**Options** are described in the section *Arguments and Defaults* below.

<span id="001003000000">Extra markup</span>
-------------------------------------------

There are some cases where special extra processing is performed, predominantly in the first comment found in the source file, from which various chunks of GSDoc markup may be extracted and placed into appropriate locations in the output document -

-   **AutogsdocSource** :  In any line where `AutogsdocSource` :  is found, the remainder of the line is taken as a source file name to be used instead of making the assumption that each .h file processed uses a  .m file of the same name. You may supply multiple `AutogsdocSource` :  lines where a header file declares items which are defined in multiple source files.  
    If a file name is absolute, it is used just as supplied.  
    If on the other hand, it is a relative path, the software looks for the source file first relative to the location of the header file, and if not found there, relative to the current directory in which autogsdoc is running, and finally relative to the directory specified by the `DocumentationDirectory` default.
-   **&lt;abstract&gt;** An abstract of the content of the document... placed in the head of the GSDoc output.
-   **&lt;author&gt;** A description of the author of the code - may be repeated to handle the case where a document has multiple authors. Placed in the head of the GSDoc output.  
    As an aid to readability of the source, some special additional processing is performed related to the document author -  
    Any line of the form ' `Author` : name &lt;email-address&gt;', or ' `By` : name &lt;email-address&gt;', or ' `Author` : name' or ' `By` : name' will be recognised and converted to an *author* element, possibly containing an *email* element.
-   **&lt;back&gt;** Placed in the GSDoc output just before the end of the body of the document - intended to be used for appendices, index etc..
-   **&lt;chapter&gt;** Placed immediately before any generated class documentation... intended to be used to provide overall description of how the code being documented works.  
    Any documentation for the main() function of a program is inserted as a section at the end of this chapter.
-   **&lt;copy&gt;** Copyright of the content of the document... placed in the head of the GSDoc output.  
    As an aid to readability of the source, some special additional processing is performed -  
    Any line of the form 'Copyright (C) text' will be recognised and converted to a *copy* element.
-   **&lt;date&gt;** Date of the revision of the document... placed in the head of the GSDoc output. If this is omitted the tool will try to construct a value from the RCS Date tag (if available).
-   **&lt;front&gt;** Inserted into the document at the start of the body... intended to provide for introduction or contents pages etc.
-   **&lt;title&gt;** Title of the document... placed in the head of the GSDoc output. If this is omitted the tool will generate a (probably poor) title of its own - so you should include this markup manually.
-   **&lt;version&gt;** Version identifier of the document... placed in the head of the GSDoc output. If this is omitted the tool will try to construct a value from the RCS Revision tag (if available).

**NB** The markup just described may be used within class, category, or protocol documentation ... if so, it is extracted and wrapped round the rest of the documentation for the class as the class's chapter. The rest of the class documentation is normally inserted at the end of the chapter, but may instead be substituted in in place of the &lt;unit /&gt; pseudo-element within the &lt;chapter&gt; element.

<span id="001004000000">Method markup</span>
--------------------------------------------

In comments being used to provide text for a method description, the following markup is removed from the text and handled specially -

-   **&lt;init /&gt;** The method is marked as being the designated initialiser for the class.
-   **&lt;override-subclass /&gt;** The method is marked as being one which subclasses must override (e.g. an abstract method).
-   **&lt;override-dummy /&gt;** The method is marked as being one which is a dummy implementation intended for subclasses to override, though not one they are forced to implement.
-   **&lt;override-never /&gt;** The method is marked as being one which subclasses should *NOT* override.

<span id="001005000000">Automated markup</span>
-----------------------------------------------

Generally, the text in comments is reformatted to standardise and indent it nicely... the reformatting is *not* performed on any text inside an &lt;example&gt; element.  
When the text is reformatted, it is broken into whitespace separated 'words' which are then subjected to some extra processing...

-   Certain well known constants such as `YES`, `NO`, and `nil` are enclosed in &lt;code&gt;... &lt;/code&gt; markup.
-   The names of method arguments within method descriptions are enclosed in &lt;var&gt;... &lt;/var&gt; markup.
-   Method names (beginning with a plus or minus) are enclosed in &lt;ref...&gt;... &lt;/ref&gt; markup.  
    e.g. "-init" (without the quotes) would be wrapped in a GSDoc reference element to point to the init method of the current class or, if only one known class had an init method, it would refer to the method of that class.  
    Note the fact that the method name must be surrounded by whitespace to be recognized (though a comma, fullstop, or semicolon at the end of the specifier will act like whitespace).
-   Method specifiers including class names (beginning and ending with square brackets) are enclosed in &lt;ref...&gt;... &lt;/ref&gt; markup.  
    e.g. `[` NSObject-init `]`, will create a reference to the init method of NSObject (either the class proper, or any of its categories), while  
    `[` (NSCopying)-copyWithZone: `]`, creates a reference to a method in the NSCopying protocol.  
    Note that no spaces must appear between the square brackets in these specifiers.  
    Protocol names are enclosed in round brackets rather than the customary angle brackets, because GSDoc is an XML language, and XML treats angle brackets specially.
-   **Class** names (and also protocol and category names) enclosed in square brackets are also cross referenced.  
    Protocol names are enclosed in round brackets rather than the customary angle brackets, because GSDoc is an XML language, and XML treats angle brackets specially.
-   Function names (ending with '()') other than 'main()' are enclosed in &lt;ref...&gt;... &lt;/ref&gt; markup.  
    e.g. "NSLogv()" (without the quotes) would be wrapped in a GSDoc reference element to point to the documentation of the NSLog function.  
    Note the fact that the function name must be surrounded by whitespace (though a comma, fullstop, or semicolon at the end of the specifier will also act as a whitespace terminator).  

<span id="001006000000">Arguments and Defaults</span>
-----------------------------------------------------

The tool accepts certain user defaults (which can of course be supplied as command-line arguments by prepending '-' before the default name and giving the value afterwards, as in - `Clean YES`):

-   **Clean** If this boolean value is set to `YES`, then rather than generating documentation, the tool removes all GSDoc files generated in the project, and all html files generated from them (as well as any which would be generated from GSDoc files listed explicitly), and finally removes the project index file.  
    The only exception to this is that template GSDoc files (i.e. those specified using "-ConstantsTemplate...", "-FunctionsTemplate..." arguments etc) are not deleted unless the CleanTemplates flag is set.
-   **CleanTemplates** This flag specifies whether template GSDoc files are to be removed along with other files when the Clean option is specified. The default is for them not to be removed... since these templates may have been produced manually and just had data inserted into them.
-   **ConstantsTemplate** Specify the name of a template document into which documentation about constants should be inserted from all files in the project.  
    This is useful if constants in the source code are scattered around many files, and you need to group them into one place.  
    You are responsible for ensuring that the basic template document (into which individual constant documentation is inserted) contains all the other information you want, but as a convenience autogsdoc will generate a simple template (which you may then edit) for you if the file does not exist.  
    Insertion takes place immediately before the *back* element (or if that does not exist, immediately before the end of the *body* element) in the template.
-   **Declared** Specify where headers are to be documented as being found.  
    The actual name produced in the documentation is formed by appending the last component of the header file name to the value of this default.  
    If this default is not specified, the full name of the header file (as supplied on the command line), with the HeaderDirectory default prepended, is used.  
    A typical usage of this might be `"-Declared Foundation"` when generating documentation for the GNUstep base library. This would result in the documentation saying that NSString is declared in `Foundation/NSString.h`
-   **DocumentAllInstanceVariables** This flag permits you to generate documentation for all instance variables. Normally, only those explicitly declared 'public' or 'protected' will be documented.
-   **DocumentInstanceVariables** This flag permits you to turn off documentation for instance variables completely. Normally, explicitly declared 'public' or 'protected' instance variables will be documented.
-   **InstanceVariablesAtEnd** This flag, if set, directs the HTML generator to place instance variable documentation at the end of the class, instead of the beginning. This is useful if you use a lot of protected instance variables which are only going to be of secondary interest to general users of the class.
-   **DocumentationDirectory** May be used to specify the directory in which generated documentation is to be placed. If this is not set, output is placed in the current directory. This directory is also used as a last resort to locate source files (not headers), and more importantly, it is used as the *first and only* resort to locate any `.gsdoc` files that are passed in on the command line. Any path information given for these files is ***removed*** and they are searched for in `DocumentationDirectory` (even though they may not have been autogenerated).
-   **Files** Specifies the name of a file containing a list of file names as a property list array *(name1,name2,...)* format. If this is present, filenames in the program argument list are ignored and the names in this file are used as the list of names to process.
-   **FunctionsTemplate** Specify the name of a template document into which documentation about functions should be inserted from all files in the project.  
    This is useful if function source code is scattered around many files, and you need to group it into one place.  
    You are responsible for ensuring that the basic template document (into which individual function documentation is inserted) contains all the other information you want, but as a convenience autogsdoc will generate a simple template (which you may then edit) for you if the file does not exist.  
    Insertion takes place immediately before the *back* element (or if that does not exist, immediately before the end of the *body* element) in the template.
-   **GenerateHtml** May be used to specify if HTML output is to be generated. Defaults to `YES`.
-   **HeaderDirectory** May be used to specify the directory to be searched for header files. When supplied, this value is prepended to relative header names, otherwise the relative header names are interpreted relative to the current directory.  
    Header files specified as absolute paths are not influenced by this default.
-   **IgnoreDependencies** A boolean value which may be used to specify that the program should ignore file modification times and regenerate files anyway. Provided for use in conjunction with the `make` system, which is expected to manage dependency checking itself.
-   **LocalProjects** This value is used to control the automatic inclusion of local external projects into the indexing system for generation of cross-references in final document output.  
    If set to 'None', then no local project references are done, otherwise, the 'Local' GNUstep documentation directory is recursively searched for files with a `.igsdoc` extension, and the indexing information from those files is used.  
    The value of this string is also used to generate the filenames in the cross reference... if it is an empty string, the path to use is assumed to be a file in the same directory where the igsdoc file was found, otherwise it is used as a prefix to the name in the index.  
    NB. Local projects with the same name as the project currently being documented will *not* be included by this mechanism. If you wish to include such projects, you must do so explicitly using *"-Projects..."*
-   **MacrosTemplate** Specify the name of a template document into which documentation about macros should be inserted from all files in the project.  
    This is useful if macro code is scattered around many files, and you need to group it into one place.  
    You are responsible for ensuring that the basic template document (into which individual macro documentation is inserted) contains all the other information you want, but as a convenience autogsdoc will generate a simple template (which you may then edit) for you if the file does not exist.  
    Insertion takes place immediately before the *back* element (or if that does not exist, immediately before the end of the *body* element) in the template.
-   **MakeDependencies** A filename to be used to output dependency information for make. This will take the form of listing all header and source files known for the project as dependencies of the project name (see `Project`).
-   **Project** Specifies the name of this project... determines the name of the index reference file produced as part of the documentation to provide information enabling other projects to cross-reference to items in this project. If not set, 'Untitled' is used.
-   **Projects** This value may be supplied as a dictionary containing the paths to the igsdoc index/reference files used by external projects, along with values to be used to map the filenames found in the indexes.  
    For example, if a project index (igsdoc) file says that the class `Foo` is found in the file `Foo`, and the path associated with that project index is `/usr/doc/proj`, Then generated html output may reference the class as being in `/usr/doc/prj/Foo.html`. Note that a dictionary may be given on the command line by using the standard PropertyList format (not the XML format of OS X), using semicolons as line-separators, and enclosing it in single quotes.
-   **ShowDependencies** A boolean value which may be used to specify that the program should log which files are being regenerated because of their dependencies on other files.
-   **Standards** A boolean value used to specify whether the program should insert information about standards complience into the documentation. This should only be used when documenting the GNUstep libraries and tools themselves as it assumes that the code being documented is part of GNUstep and possibly complies with the OpenStep standard or implements MacOS-X compatible methods.
-   **SystemProjects** This value is used to control the automatic inclusion of system external projects into the indexing system for generation of cross-references in final document output.  
    If set to 'None', then no system project references are done, otherwise, the 'System' GNUstep documentation directory is recursively searched for files with a `.igsdoc` extension, and the indexing information from those files is used.  
    The value of this string is also used to generate the filenames in the cross reference... if it is an empty string, the path to use is assumed to be a file in the same directory where the igsdoc file was found, otherwise it is used as a prefix to the name in the index.  
    NB. System projects with the same name as the project currently being documented will *not* be included by this mechanism. If you wish to include such projects, you must do so explicitly using *"-Projects..."*
-   **TypedefsTemplate** Specify the name of a template document into which documentation about typedefs should be inserted from all files in the project.  
    This is useful if typedef source code is scattered around many files, and you need to group it into one place.  
    You are responsible for ensuring that the basic template document (into which individual typedef documentation is inserted) contains all the other information you want, but as a convenience autogsdoc will generate a simple template (which you may then edit) for you if the file does not exist.  
    Insertion takes place immediately before the *back* element (or if that does not exist, immediately before the end of the *body* element) in the template.
-   **Up** A string used to supply the name to be used in the 'up' link from generated GSDoc documents. This should normally be the name of a file which contains an index of the contents of a project.  
    If this is missing or set to an empty string, then no 'up' link will be provided in the documents.
-   **VariablesTemplate** Specify the name of a template document into which documentation about variables should be inserted from all files in the project.  
    This is useful if variable source code is scattered around many files, and you need to group it into one place.  
    You are responsible for ensuring that the basic template document (into which individual variable documentation is inserted) contains all the other information you want, but as a convenience autogsdoc will generate a simple template (which you may then edit) for you if the file does not exist.  
    Insertion takes place immediately before the *back* element (or if that does not exist, immediately before the end of the *body* element) in the template.
-   **Verbose** A boolean used to specify whether you want verbose debug/warning output to be produced.
-   **Warn** A boolean used to specify whether you want standard warning output (e.g. report of undocumented methods) produced.
-   **WordMap** This value is a dictionary used to map identifiers/keywords found in the source files to other words. Generally you will not have to use this, but it is sometimes helpful to avoid the parser being confused by the use of C preprocessor macros. You can effectively redefine the macro to something less confusing.  
    The value you map the identifier to must be one of -  
    Another identifier,  
    An empty string - the value is ignored,  
    Two slashes ('//') - the rest of the line is ignored.  
    Note that a dictionary may be given on the command line by using the standard PropertyList format (not the XML format of OS X), using semicolons as line-separators, and enclosing it in single quotes.

<span id="001007000000">Inter-document linkage</span>
-----------------------------------------------------

The 'Up' default is used to specify the name of a document which should be used as the 'up' link for any other documents used.  
This name must not include a path or extension.  
Generally, the document referred to by this default should be a hand-edited GSDoc document which should have a *back* section containing a project index. e.g.

      <?xml version="1.0"?>
      <!DOCTYPE gsdoc PUBLIC "-//GNUstep//DTD gsdoc 1.0.4//EN"
      "http://www.gnustep.org/gsdoc-1_0_4.dtd">
      <gsdoc base="index">
        <head>
          <title>My project reference</title>
          <author name="my name"></author>
        </head>
        <body>
          <chapter>
            <heading>My project reference</heading>
          </chapter>
          <back>
            <index scope="project" type="title" />
          </back>
        </body>
      </gsdoc>

<span id="001008000000">Implementation Notes</span>
---------------------------------------------------

The autogsdoc tool internally makes use of the following four classes-

<!-- [AGSParser](AGSParser.html#class$AGSParser)  
Parses source code comments to an internal representation.

[AGSOutput](AGSOutput.html#class$AGSOutput)  
Converts internal representation of source comments to a gsdoc document.

[AGSIndex](AGSIndex.html#class$AGSIndex)  
Internal representation of an igsdoc file, representing indices of a project's files.

[AGSHtml](AGSHtml.html#class$AGSHtml)  
Converts gsdoc XML to HTML, using AGSIndex instances.

**Title Index**

-   [AGSHtml... a class to output html for a gsdoc file](AGSHtml.html#title$AGSHtml)
-   [AGSIndex... a class to create references for a gsdoc file](AGSIndex.html#title$AGSIndex)
-   [AGSOutput... a class to output gsdoc source](AGSOutput.html#title$AGSOutput)
-   [AGSParser...a class to get documention info from ObjC source](AGSParser.html#title$AGSParser)
-   [Base Tools](BaseTools.html#title$BaseTools)
-   [cvtenc documentation](cvtenc.html#title$cvtenc)
-   [defaults documentation](defaults.html#title$defaults)
-   [gdnc documentation](gdnc.html#title$gdnc)
-   [gdomap documentation](gdomap.html#title$gdomap)
-   [GNUstep Documentation XML markup language (GSDoc)](gsdoc.html#title$gsdoc)
-   [gspath documentation](gspath.html#title$gspath)
-   [pldes documentation](pldes.html#title$pldes)
-   [plmerge documentation](plmerge.html#title$plmerge)
-   [plparse documentation](plparse.html#title$plparse)
-   [plser documentation](plser.html#title$plser)
-   [sfparse documentation](sfparse.html#title$sfparse)
-   [xmlparse... a tool to parse xml documents](xmlparse.html#title$xmlparse)

  
[Up](BaseTools.html) -->
