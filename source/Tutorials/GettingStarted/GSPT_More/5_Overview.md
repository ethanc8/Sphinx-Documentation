<span id="AEN1177">Overview</span>
----------------------------------

NSOutlineView is a subclass of NSTableView. The only difference is that
the rows of NSOutlineView act like a data-structure tree of multiple
children. In NSTableView, we can use an array of dictionary to store the
data of NSTableView. In NSOutlineView, we need a tree strcuture. Here, I
will make an application to display several system information in
outline view.

First, create "New Application" in Gorm and drag a NSOutlineView into
the window

<span id="AEN1181"></span>

**Figure 4-44. Interface of Overview**

![](GSPT_files/Overview-01.jpg)&gt;

Change the Autoresizing attribute of NSOutlineView

<span id="AEN1187"></span>

**Figure 4-45. Autoresizing attribute of NSOutlineView**

![](GSPT_files/Overview-02.jpg)&gt;

Double-click on the column to select

<span id="AEN1193"></span>

**Figure 4-46. Select column in NSOutlineView**

![](GSPT_files/Overview-03.jpg)&gt;

Uncheck the "Editable" and change the identifier to "Attribute" in the
first column and "Value" in the second column

<span id="AEN1199"></span>

**Figure 4-47. Change attribute of NSTableColumn**

![](GSPT_files/Overview-04.jpg)&gt;

The makeing of interface is done. Now, I need a controller for the
interface. Create a subclass of NSObject, called "Controller"

<span id="AEN1205"></span>

**Figure 4-48. Create subclass in Gorm**

![](GSPT_files/Overview-05.jpg)&gt;

Add a outlet called "outlineview"

<span id="AEN1211"></span>

**Figure 4-49. Create outlet**

![](GSPT_files/Overview-06.jpg)&gt;

Create an instance of Controller, and connect the outlet "outlineview"
to the outline view in the window. Be sure that you connect to outline
view, not the scroll view or the table column

<span id="AEN1217"></span>

**Figure 4-50. Connect outlet to NSOutlineView**

![](GSPT_files/Overview-07.jpg)&gt;

Since NSOutlineView is the subclass of NSTableView, we need to assing
the data source and delegate of NSOutlineView by connecting the
"dataSource" and "delegate" from NSOutlineView to Controller.

<span id="AEN1223"></span>

**Figure 4-51. Connect data source of NSOutlineView**

![](GSPT_files/Overview-08.jpg)&gt;

Finally, we can assign Controller as the delegate of NSApp

<span id="AEN1229"></span>

**Figure 4-52. Assign delegate of NSApp**

![](GSPT_files/Overview-09.jpg)&gt;

Now, save the Gorm file as "Overview.gorm", and generate the files of
Controller.

I need a data source for the NSOutlineView. I can do that by creating a
tree sturcture with very simple nodes

`Node.h`

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><pre class="PROGRAMLISTING"><code>#ifndef _Overview_Node_
#define _Overview_Node_

#include &lt;Foundation/NSObject.h&gt;

@class NSArray;
@class NSMutableArray;
@class NSString;

@interface Node: NSObject
{
  NSString *name;
  NSString *value;
  NSMutableArray *children;
}

- (void) setName: (NSString *) name;
- (NSString *) name;
- (void) setValue: (NSString *) value;
- (NSString *) value;
- (void) addChild: (id) child;
- (NSArray *) children;
@end

#endif /* _Overview_Node_ */</code></pre></td>
</tr>
</tbody>
</table>

`Node.m`

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><pre class="PROGRAMLISTING"><code>#include &quot;Node.h&quot;
#include &lt;Foundation/Foundation.h&gt;

@implementation Node

- (id) init
{
  self = [super init];

  children = [NSMutableArray new];

  return self;
}

- (void) setName: (NSString *) string
{
  ASSIGN(name, string);
}

- (NSString *) name
{
  return name;
}

- (void) setValue: (NSString *) string
{
  ASSIGN(value, string);
}

- (NSString *) value
{
  return value;
}

- (void) addChild: (id) child
{
  [children addObject: child];
}

- (NSArray *) children
{
  return children;
}

- (void) dealloc
{
  RELEASE(name);
  RELEASE(value);
  RELEASE(children);
  [super dealloc];
}

@end</code></pre></td>
</tr>
</tbody>
</table>

Now, I can build a tree by connect these nodes

In NSTableView, there are two necessary methods to display the data:

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><pre class="PROGRAMLISTING"><code>- (int) numberOfRowsInTableView: (NSTableView *) tableView;

- (id) tableView: (NSTableView *) tableView
       objectValueForTableColumn: (NSTableColumn *) column
       row: (int) row;</code></pre></td>
</tr>
</tbody>
</table>

In NSOutlineView, due to the tree-like structure, there are 4 mecessary
methods to display the data:

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><pre class="PROGRAMLISTING"><code>- (id)outlineView: (NSOutlineView *)outlineView 
            child: (int)index 
           ofItem: (id)item;

- (BOOL)outlineView: (NSOutlineView *)outlineView
        isItemExpandable: (id)item;

- (int)outlineView: (NSOutlineView *)outlineView
       numberOfChildrenOfItem: (id)item;

- (id)outlineView: (NSOutlineView *)outlineView 
      objectValueForTableColumn:(NSTableColumn *)tableColumn 
      byItem:(id)item;</code></pre></td>
</tr>
</tbody>
</table>

"Item" means the node in the data source. If item is nil, it means it is
root node. Starting from root node, NSOutlineView ask each node how many
children it has ? is it expandable ? display the object value of the
node, and get the next child. After it goes over the nodes, it finish
displaying the data source.

So I have to build the tree first:

`Controller.h`

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><pre class="PROGRAMLISTING"><code>/* All Rights reserved */

#include &lt;AppKit/AppKit.h&gt;

@class Node;

@interface Controller : NSObject
{
  id outlineview;
  Node *root;
  
}
@end</code></pre></td>
</tr>
</tbody>
</table>

`Controller.m`

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><pre class="PROGRAMLISTING"><code>/* All Rights reserved */

#include &lt;AppKit/AppKit.h&gt;
#include &quot;Controller.h&quot;
#include &quot;Node.h&quot;

@implementation Controller

- (id) init
{
  Node *child, *temp;

  self = [super init];

  root = [Node new];

  child = [Node new];
  [child setName: @&quot;System&quot;];

  /* Add operating system */
  temp = [Node new];
  [temp setName: @&quot;Operating System&quot;];
  [temp setValue: [[NSProcessInfo processInfo] operatingSystemName]];
  [child addChild: temp];
  RELEASE(temp);

  /* Add user name */
  temp = [Node new];
  [temp setName: @&quot;User Name&quot;];
  [temp setValue: NSUserName()];
  [child addChild: temp];
  RELEASE(temp);

  /* Add home directory */
  temp = [Node new];
  [temp setName: @&quot;Home Directory&quot;];
  [temp setValue: NSHomeDirectory()];
  [child addChild: temp];
  RELEASE(temp);

  [root addChild: child];
  RELEASE(child);

  return self;
}

- (void) dealloc
{
  RELEASE(root);
  [super dealloc];
}</code></pre></td>
</tr>
</tbody>
</table>

I create a root node, add an "System" node. Then add three nodes into
"System" node. That's a very simple tree for now. Once I have a tree, I
can display it in outline view.

`Controller.m`

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><pre class="PROGRAMLISTING"><code>- (id) outlineView: (NSOutlineView *) outlineView
             child: (int) index
            ofItem: (id) item
{
  /* Root */
  if (item == nil)
    return [[root children] objectAtIndex: index];

  /* Others */
  if ([[item children] count])
    return [[item children] objectAtIndex: index];
  else
    return nil;
}

- (BOOL) outlineView: (NSOutlineView *) outlineView
         isItemExpandable: (id) item
{
  /* Root */
  if (item == nil)
    return YES;

  /* Others */
  if ([[item children] count])
    return YES;
  else
    return NO;
}

- (int) outlineView: (NSOutlineView *) outlineView
        numberOfChildrenOfItem: (id) item
{
  /* Root */
  if (item == nil)
    return [[root children] count];

  /* Others */
  return [[item children] count];
}

- (id) outlineView: (NSOutlineView *) outlineView
       objectValueForTableColumn: (NSTableColumn *) tableColumn
       byItem: (id) item
{
  if ([[tableColumn identifier] isEqualToString: @&quot;Attribute&quot;])
    return [(Node *)item name];
  else
    return [item value];
}</code></pre></td>
</tr>
</tbody>
</table>

These methods are straight-forward. Just need to take care the case when
item is nil, which means it is root node.

Now, this application is ready to go. You can finish the `main.m` and
`GNUmakefile`. Here is the source code:
[Overview-src.tar.gz](http://gnustep.made-it.com/GSPT/Overview/Overview-src.tar.gz)

Actually I can get more information

`Controller.m`

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><pre class="PROGRAMLISTING"><code>- (id) init
{
  Node *child, *temp;
  NSCalendarDate *date;
  NSRect frame;
  id object;

#define ADD_NAME_VALUE(name, value) \
        temp = [Node new]; \
        [temp setName: name]; \
        [temp setValue: value]; \
        [child addChild: temp]; \
        RELEASE(temp);


  self = [super init];

  root = [Node new];

  child = [Node new];
  [child setName: @&quot;System&quot;];

  /* operating system */
  ADD_NAME_VALUE(@&quot;Operating System&quot;, [[NSProcessInfo processInfo] operatingSystemName]);

  /* user name */
  ADD_NAME_VALUE(@&quot;User Name&quot;, NSUserName());

  /* home directory */
  ADD_NAME_VALUE(@&quot;Home Directory&quot;, NSHomeDirectory());

  /* gnustep root directory */
  ADD_NAME_VALUE(@&quot;GNUstep Directory&quot;, NSOpenStepRootDirectory());

  /* host and address */
  ADD_NAME_VALUE(@&quot;Host&quot;, [[NSHost currentHost] name]);
  ADD_NAME_VALUE(@&quot;Address&quot;, [[NSHost currentHost] address]); 

  /* Screen */
  ADD_NAME_VALUE(@&quot;Screen Depth&quot;, [[NSNumber numberWithInt: [[NSScreen mainScree
n] depth]] description]);
  frame = [[NSScreen mainScreen] frame];
  object = [NSString stringWithFormat: @&quot;%d x %d&quot;, (int)frame.size.width, (int)f
rame.size.height];
  ADD_NAME_VALUE(@&quot;Screen Size&quot;, object);

  [root addChild: child];
  RELEASE(child);

  child = [Node new];
  [child setName: @&quot;Date &amp; Time&quot;];

  /* Time Zone */
  ADD_NAME_VALUE(@&quot;System Time Zone&quot;, [[NSTimeZone systemTimeZone] timeZoneName]
);
  ADD_NAME_VALUE(@&quot;Local Time Zone&quot;, [[NSTimeZone localTimeZone] timeZoneName]);

  /* Date */
  date = [NSCalendarDate calendarDate];
  [date setCalendarFormat: @&quot;%a, %b %e, %Y&quot;];
  ADD_NAME_VALUE(@&quot;Date&quot;, [date description]);
  [date setCalendarFormat: @&quot;%H : %M : %S&quot;];
  ADD_NAME_VALUE(@&quot;Time&quot;, [date description]);

  [root addChild: child];
  RELEASE(child);

  child = [Node new];
  [child setName: @&quot;Text Related&quot;];

  /* default encoding */
  ADD_NAME_VALUE(@&quot;Default Encoding&quot;, [NSString localizedNameOfStringEncoding: [NSString defaultCStringEncoding]]);

  /* Font */
  ADD_NAME_VALUE(@&quot;System Font&quot;, [[NSFont systemFontOfSize: [NSFont systemFontSize]] displayName]);
  ADD_NAME_VALUE(@&quot;System Font Size&quot;, [[NSNumber numberWithFloat: [NSFont systemFontSize]] description]);
  ADD_NAME_VALUE(@&quot;System Font Encoding&quot;, [[NSFont systemFontOfSize: [NSFont systemFontSize]] encodingScheme]);
  ADD_NAME_VALUE(@&quot;System Bold Font&quot;, [[NSFont boldSystemFontOfSize: [NSFont systemFontSize]] displayName]);

  [root addChild: child];
  RELEASE(child);

  return self;
}</code></pre></td>
</tr>
</tbody>
</table>

Now, it looks better:

<span id="AEN1269"></span>

**Figure 4-53. Overview**

![](GSPT_files/Overview-10.jpg)&gt;

You will notice that when window is close, the application is not quit.
We can make the application quit when last window closes.

`Controller.m`

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td><pre class="PROGRAMLISTING"><code>- (BOOL) applicationShouldTerminateAfterLastWindowClosed: (id) sender
{
  return YES;
}</code></pre></td>
</tr>
</tbody>
</table>

This is the method for NSApp delegate. Therefore, Controller must be the
delegate of NSApp. I assign it already in Gorm

------------------------------------------------------------------------