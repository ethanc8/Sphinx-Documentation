<span id="title$gsdoc">GNUstep Documentation XML markup language (GSDoc)</span>
===============================================================================

### Authors

[Richard Frith-Macdonald](http://www.gnustep.org/developers/whoiswho.html) ([`rfm@gnu.org`](mailto:rfm@gnu.org))  
A person who devotes far too much time to GNUstep development.

**Version:** 1.0.3

**Date:** 6 Nov, 2006

> This documents the GNUstep Documentation markup language.

**Copyright:** (C) Free Software Foundation, Inc.

<!-- ------------------------------------------------------------------------

### Contents -

1.  [Introduction](#001000000000)
2.  [Why another documentation language?](#001001000000)
3.  [The gsdoc DTD and what it means](#002000000000)
4.  [Overall document structure](#002001000000)
5.  [The document head](#002002000000)
6.  [The document body](#002003000000)
7.  [Element reference](#003000000000)
8.  [Sectioning Elements](#003001000000)
9.  [Block Elements](#003002000000)
10. [Text Elements](#003003000000)
11. [List Elements](#003004000000)
12. [Cross-Reference Elements](#003005000000)
13. [Definition Elements](#003006000000)

------------------------------------------------------------------------ -->

## <span id="001000000000">Introduction</span>


The GNUstep documentation markup language (GSDoc) is an XML language designed specifically for writing documentation for the [GNUstep project](http://www.gnustep.org). In practice, that means that it is designed for writing about software, and in particular, for writing about Objective-C classes.

This document itself is an example, as well as a test case, of GSDoc itself.

### <span id="001001000000">Why another documentation language?</span>


There are several reasons for producing the new markup language -

-   There were no existing markup languages that dealt well with documenting software written in the Objective-C language, except the GDML language - which has no easy to use support software.
-   While the DocBook system works nicely for general software documentation, it requires a relatively large amount of support software and comes with a lot of baggage that's not directly useful for GNUstep.
-   The GNU info system comes with easy to use, lightweight conversion tools, but is particularly ill suited to Objective-C documentation because the colon character using in Objective-C method names is used in info markup.
-   LinuxDoc, while being a nice basic system, seems to be in the process of being replaced by DocBook.

So, with only one markup language available that supported Objective-C, and with XML software becoming available, the decision was to take GDML and update it to be an XML language, in the hope that this would -

-   Provide optimal support for GNUstep documentation.
-   Minimize the amount of work needed for development of software tools.
-   Provide future-proofing in that documentation written in one XML language should be quite easy to convert to another if necessary.

## <span id="002000000000">The gsdoc DTD and what it means</span>


The GSDoc markup language is defined by an SGML DTD, that specifies the tags that may be used in marking up a GSDoc document, and how and where those tags may be placed. The reader is encouraged to consult the DTD directly on any points that the present document leaves unclear. The DTD is stored under `GNUSTEP_SYSTEM_LIBRARY/DTDs` in a standard GNUstep installation. .. where GNUSTEP\_SYSTEM\_LIBRARY is defined in the GNUstep configuration file (GNUstep.conf).

The gsdoc DTD defines an XML language - that is, a markup language that conforms to a specific subset of SGML features defined as XML. The advantage of XML is that it provides most of the useful features of SGML while being much more light-weight (easy to use) because you can forget about the rest of SGML. As XML looks set to become increasingly popular, we can hope that documentation written with an XML language will be easily imported into XML software tools as they become available, so we will not (in the GNUstep project) need to devote a lot of time and effort to maintaining documentation tools.

<span id="label$gsdoc"></span>

### <span id="002001000000">Overall document structure</span>


A GSDoc document consists of a [head](#label$head) and a [body](#label$body) wrapped inside the overall document framework that looks like this -

    <?xml version="1.0"?>
    <!DOCTYPE gsdoc PUBLIC "-//GNUstep//DTD gsdoc 1.0.2//EN" "http://www.gnustep.org/gsdoc-1_0_2.xml">
    <gsdoc base="MyDoc" prev="First" next="Last" up="Overview">
      <head>
      ... your document head here
      </head>
      <body>
      ... your document body here
      </body>
    </gsdoc>
            

The above example shows a GSDoc document framework. The first line specifies the XML version that the document conforms to. The second line specifies the version of GSDoc that the document conforms to. The third and final lines frame the main part of the document and supply all the (optional) attributes of the *gsdoc* element -

`base`  
This is optional, but recommended - it specifies the base name for the document. When the document is translated to another format, the output file name should be based on this - eg. if the base name of a document is *foo* then an html output for this file would be *foo.html*.

`prev`  
This optional attribute may be used as the name of a document that precedes this one in logical reading order. If the converted output format of the document supports some sort of link between documents, the converter software may insert a link between the two documents.

`next`  
This optional attribute may be used as the name of a document that follows this one in logical reading order. If the converted output format of the document supports some sort of link between documents, the converter software may insert a link between the two documents.

`up`  
This optional attribute may be used as the name of a document that is above this document in some sort of hierarchical structure (a contents list perhaps). If the converted output format of the document supports some sort of link between documents, the converter software may insert a link between the two documents.

<span id="label$head"></span>

### <span id="002002000000">The document head</span>


The document head contains information about the document as a whole: its title, authors, version, modification date, copyright, and perhaps an abstract of its contents. The title is the only part of the document head that must be present, although at least one author is strongly encouraged.

    <head>
      <title>GNUstep Documentation XML markup language (GSDoc)</title>
      <author name="Richard Frith-Macdonald">
        <email address="rfm@gnu.org"/>
        <url url="http://www.gnustep.org/developers/whoiswho.html"/>
        <desc>
          A person who devotes far too much time to GNUstep development.
        </desc>
      </author>
      <version>0.1</version>
      <date>4 march, 2000</date>
      <abstract>
        This documents the GNUstep Documentation markup language and tools
      </abstract>
      <copy>Free Software Foundation, Inc.</copy>
    </head>
            

The above example shows all the elements possible in a document head. Only title is required (author is strongly encouraged), but if present they must occur in the order shown -

`<title>`  
The title of the document. Required.

`<author>`  
The author of the document, also specifying an email address at which the author may be reached, a URL for a web page giving some information about the author, and an additional description of the author. (Of course, a document may have more than one author, in which case you simply write multiple author elements.) Not required, but strongly encouraged.

`<version>`  
The version number of the document.

`<date>`  
The date at which the document was last modified.

`<abstract>`  
A *short* description of the document contents.

`<copy>`  
The copyright owner of the document.

<span id="label$body"></span>

<span id="002003000000">The document body</span>
------------------------------------------------

The document body contains the main part of the document, it consists of an optional front part (for contents pages, overview etc), a sequence of any number of chapters, and an optional back part (for indexes, appendices etc). Normally, each of these three parts of the document would be expected to have their own separate page numbering schemes.

    <body>
      <front>
        <contents/>
        <chapter>
          <heading>Preface</heading>
          <p>
            Here is an introductory chapter for a dummy document.
          </p>
        </chapter>
      </front>
      <chapter>
        <heading>Main text</heading>
        <p>
          Here is the main text of a chapter in the document.
        </p>
      </chapter>
      <back>
        <chapter>
          <heading>Afterword</heading>
          <p>
            And after the main part of the doucment we can have some other stuff.
          </p>
        </chapter>
        <index type="class"/>
      </back>
    </body>
            

The above example shows all the elements possible at the top level in a document body -

`<front>`  
This is an optional part of the document that can come before the main text. Typically, this could be used to contain an automatically generated contents page and possibly an introduction. When output is generated in book form, this part of the document would probably have a different page numbering scheme from the main part.

The `<contents>` subelement is used as a marker to specify that an automatically generated contents page (listing the chapters in the document) is to be inserted.

`<chapter>`  
After the *front* part of the document body comes a mandatory sequence of one or more chapters. This is where the main part of the document resides. Each [chapter](#label$chapter) consists of a [heading](#label$heading) , any number of blocks of information, and any number of sections.

  
`<back>`  
After the chapters making up the main part of the body of the document is an optional *back* part which may contain chapters (such as appendices) possibly followed by an automatically generated index.

The `<index>` element is used as a marker to specify that an automatically generated index is to be inserted. See [below](#label$index) for details.

## <span id="003000000000">Element reference</span>


The allowable elements in GSDoc documents are described below, broken into sections by usage context.

<span id="label$sectioningElements"></span>

### <span id="003001000000">Sectioning Elements</span>


*Sectioning elements* define hierarchical document structure.

`<chapter>`  
This is the basic, top-level element of the document body. Each chapter consists of a [heading](#label$heading) , zero or more [blocks](#label$blockElements) , and zero or more [sections](#label$section) . Each chapter in the document is automatically listed in the documents contents page (if it has one).

`<section>`  
First level below `chapter`. It contains [sub-sections](#label$subsection) where a chapter would contain sections.

`<subsection>`  
Level below `section`.

`<subsubsection>`  
Level below `subsection`.

`<heading>`  
Each [chapter](#label$chapter) , [section](#label$section) [sub-section](#label$subsection) , or [sub-sub-section](#label$subsubsection) has a heading as the first thing in it. These headings introduce the sections and are listed in the contents page.

<span id="label$blockElements"></span>

### <span id="003002000000">Block Elements</span>


*Block elements* can occur at the top level of sections, as well is in certain other contexts. The block elements are -

`<embed>`  
marks embedded information from elsewhere

  
`<example>`  
marks an example

  
`<index>`  
The `<index>` tag is special in that it is dynamically expanded during output based on information that has been collated from reading in various documentation and source files. The `type` attribute of the index specifies what sort of item is to be in the index - the default type of `label` causes an index of all *label* and *entry* elements to be generated. Currently the allowable types are: `class`, `category`, `protocol`, `method`, `ivariable`, `function`, `type`, `macro`, `variable`, `constant`, `label`, `title`, `EOModel` (associated with the Enterprise Objects Framework, for interacting with databases), `EOEntity`. The default is "`label`".

The `<index>` element also takes three optional attributes -

`scope`  
Determines whether the index is generated for the current file ("`file`" scope), or for the whole of the current project ("`project`" scope), or for everything the software can find ("`global`" scope). In certain contexts the specified scope is automatically overridden ... if the document is processed in a standalone manner, the scope is always "`file`". For method or ivariable indexing, if the index is inside a class, protocol, or category, only indexes for that unit are generated.

`style`  
Determines whether the index is presented with standard embellishments such as bulleted entries and a header ("`normal`" style) or in a minimalist style suitable for, e.g., a navigation bar ("`bare`" style).

`target`  
Provides additional information to accompany links formed from the index. For HTML output, this is translated into a "`target`" attribute to the `<a>                 href="..."` element generated for a link. In most cases this can safely be left out.

  
*text elements*  
A variety of elements for text formatting, many based on HTML tags. See [below](#label$textElements) for details.

  
*list elements*  
A variety of lists. See [below](#label$listElements) for details.

  
*cross reference elements*  
A variety of elements for representing external references and internal references to other parts of a document. See [below](#label$crossrefElements) for details.

  
*definition elements*  
A variety of specialised elements for software documentation. See [below](#label$definitionElements) for details.

<span id="label$textElements"></span>

### <span id="003003000000">Text Elements</span>


*Text elements* can occur within blocks and typically within other block elements such as `example` as well. They carry out various presentation-related purposed. The text elements are -

`<p>`  
The paragraph, as in HTML. The paragraph element simply contains [text](#label$textElements) . Most descriptive writing is inside paragraphs.

`<br>`  
The line-break, as in HTML.

`<example>`  
Marks an example.

`<footnote>`  
A reference to a footnote that appears in full elsewhere.

`<code>`  
The content is either a name for code (e.g. class names), or a relatively short code fragment.

`<em>`  
Emphasized text.

`<strong>`  
More strongly emphasized text.

`<file>`  
The content is a filename.

`<ivar>`  
The content is a metasyntactic ivariable name.

`<var>`  
The content is a metasyntactic variable or argument name.

`<site>`  
The content is a fully qualified domain name on the Internet.

`(text)`  
Unstructured text content is also allowed.

<span id="label$listElements"></span>

### <span id="003004000000">List Elements</span>


*List elements* can occur within blocks and typically within other block elements such as `example` as well. They support presentation of various types of lists. The list elements are -

`<list>`  
A simple, unnumbered list of items, each contained within an `<item>` tag.

`<enum>`  
A numbered list (`<item>` tags).

`<deflist>`  
A list of terms with definitions, marked as alternating `<term>` and `<desc>` tags.

`<dictionary>`  
An attribute-value list similar to an NSDictionary. Consists of a sequence of `<dictionaryItem>` tags each with a required `key` attribute and an optional `value` attribute. If this is excluded, the element content, which may be any [*block* element](#label$blockElements) (including another `<dictionary>` tag) is the value.

`<qalist>`  
A list of `<question>`s and `<answer>`s.

<span id="label$crossrefElements"></span>

### <span id="003005000000">Cross-Reference Elements</span>


*Cross-reference elements* can occur within blocks and typically anywhere text elements can occur. They represent references to other entities inside or outside the project being documented. In output formats that support it, they are generally transformed into hyperlinks. The cross-reference elements are -

`<ref>`  
A reference to another entity within collection of documents describing the current project. In practice this means a reference to an element in a GSDoc document. Standard conventions for document naming and structure are used to generate a hyperlink in output. To support this resolution, two attributes must be specified.

`type`  
This is the type of entity being referenced. It may take one of the following values: `class`, `category`, `protocol`, `method`, `ivariable`, `function`, `type`, `macro`, `variable`, `constant`, `label`, `EOModel`, `EOEntity`. If `type` is not specified, "`label`" is assumed.

`id`  
Specifies the identifier of the reference. In most cases this will be the name of the class, method, or other specific entity being referenced. In the case of `label` references, this is the `id` attribute of the label being referenced.

`class`  
In the case where a `method` is being referenced, the `class` attribute should be specified as well, and should contain the name of the class the method occurs in, in one of the following formats: "classname", "classname(categoryname)", or "(protocolname)".

`<prjref>`  
A reference to another project, which assumedly has also had GSDoc generated for it. A link in the output will be generated to ???. The `<prjref>` tag may contain text content, which appears in the output.

`<uref>`  
A reference to a URL. Usage is similar to the `<A>` tag in HTML, except that the attribute '`url`' is used for the URL rather than '`href`'. Text contents are shown in the output to label the hyperlink.

`<url>`  
Similar to `<uref>` except the URL itself is automatically used as the hyperlink label (and so the tag itself does not have text content).

`<email>`  
An email address. Translates in HTML output to a `mailto:` link.

`<entry>`  
An entry for the general index. Contains text elements but this text appears only in the index, and never in the text itself. It takes a single attribute, `id`, which may be used to refer to the entry. (If it is absent any text content is taken to be the id.)

`<label>`  
A general purpose marker that can contain text elements, which will appear in the output where the label occurs. It takes a single attribute, `id`, which may be used to refer to the label. (If it is absent any text content is taken to be the id.)

<span id="label$definitionElements"></span>

### <span id="003006000000">Definition Elements</span>


*Definition elements* are specialized elements for software documentation. They can occur in most places that block elements can occur. They represent specific Objective-C elements, and are formatted specially in output. In the majority of cases, you will not need to write GSDoc using these elements, since they can be autogenerated from Objective-C source files and special comments within them. Most of the elements representing parts of the API have optional attributes ovadd, ovdep and ovrem which may be used to specify the OpenStep/OPENSTEP/MacOS-X versions at which the documented element was added to, deprecated in, or removed from the API, Similarly they have gvadd, gvdep and gvrem which may be used to specify when an elment was added to or removed from the API of the source code being documented (eg a gnustep library).  
The definition elements are -

`<class>`  
An Objective-C *class* definition. This is the main element for Objective-C code documentation. The `name` attribute is required for this element - it is the name of the class. The `super` attribute is normally necessary to provide the name of the superclass.

The elements in a `<class>` are - an optional [declared](#label$declared) element, zero or more [conform](#label$conform) elements, an optional [desc](#label$desc) , zero or more [ivariable](#label$ivariable) elements, zero or more [method](#label$method) elements.

`<category>`  
An Objective-C *category* definition. It requires both a `name` attribute providing the name of the category, and a `class` attribute naming the class the category is associated with.

The elements in a `<category>` are - an optional [declared](#label$declared) element, zero or more [conform](#label$conform) elements, an optional [desc](#label$desc) , zero or more [method](#label$method) elements.

`<protocol>`  
An Objective-C *protocol* definition. It requires a `name` attribute providing the name of the protocol.

The elements in a `<protocol>` are - an optional [declared](#label$declared) element, zero or more [conform](#label$conform) elements, an optional [desc](#label$desc) , zero or more [method](#label$method) elements.

`<function>`  
A C *function* definition. It requires a `name` attribute providing the function's name and a `type` attribute providing the return type.

The elements in a `<function>` are - a series of zero or more [arg](#label$arg) elements, followed by an optional [arg](#label$vararg) element, then an optional [declared](#label$declared) element, an optional [desc](#label$desc) .

`<macro>`  
A C *macro* definition. It requires a `name` attribute providing the macro's name.

The elements in a `<macro>` are - a series of zero or more [arg](#label$arg) elements, followed by an optional [arg](#label$vararg) element, then an optional [declared](#label$declared) element, an optional [desc](#label$desc) .

`<type>`  
A C *type* definition. It requires a `name` attribute providing the macro's name.

The elements in a `<macro>` are - an optional [declared](#label$declared) element, an optional [desc](#label$desc) .

`<constant>`  
A C *constant* definition. It requires `name` and `type` attributes and a `value` attribute is optional. In addition, an Objective-C role for the constant may be specified using the `role` attribute. Acceptable values for this attribute are: "`except`", "`defaults`", "`notify`", or "`key`".

The elements in a `<constant>` are - an optional [declared](#label$declared) element, an optional [desc](#label$desc) .

`<variable>`  
A C *variable* definition. It requires `name` and `type` attributes and a `value` attribute is optional.

The elements in a `<variable>` are - an optional [declared](#label$declared) element, an optional [desc](#label$desc) .

`<ivariable>`  
An objective C *instance variable* definition. It requires `name` and `type` attributes and a `validity` attribute optionally specifies the access level for the variable (may be "`public`", "`protected`", or "`private`", the default is "`public`").

The elements in a `<variable>` are - an optional [desc](#label$desc) .

`<desc>`  
An element for general descriptive text. Contains a block and occurs in various contexts including [deflists](#label$deflist) as well as most [definition elements](#label$definitionElements) .  
  

`<conform>`  
This element contains simple text giving the name of a protocol or interface to which a class conforms.  
  

`<declared>`  
This element contains simple text giving the name of the header file in which something is declared.  
  

`<method>`  
Describes an Objective-C method. Only valid within a [class](#label$class) , [protocol](#label$protocol) , or [category](#label$category) . An optional `type` attribute describes the return type; an optional `factory` attribute ("`yes`" or "`no`", defaults to "`no`") specifies whether this is a class or instance method. (Class methods are typically only used for construction purposes in Objective-C.) An optional `init` attribute (also taking "`yes`" / "`no`") specifies whether this is the designated constructor. An optional `override` attribute specifies whether this method should be overridden. If it *must* be overridden enter "`subclass`", if it must *not* be overridden enter `never`", if it is an empty/dummy implementation which is intended to be overridden enter `dummy`, otherwise (for most methods which may be but are not particularly designed to be overridden) leave this attribute unset.

The elements in a `<method>` are - the method's name (in a [sel](#label$sel) element), the method's arguments (a sequence of [arg](#label$arg) then [sel](#label$sel) ,[arg](#label$arg) pairs, then an optional [vararg](#label$vararg) element), followed by an optional [desc](#label$desc) , zero or more [ivariable](#label$ivariable) elements, zero or more [method](#label$method) elements.

`<sel>`  
Content is a method name or argument name (referred to as a "selector" in some cases, but different from an Objective-C method selector (runtime pointer to a method implementation).  
  

`<arg>`  
Content is a an argument name. Takes a mandatory `type` attribute giving the argument's type.  
  

`<vararg>`  
An empty element indicating that a variable argument list may be used (in a [method](#label$method) or [function](#label$function) definition).  
  

  
