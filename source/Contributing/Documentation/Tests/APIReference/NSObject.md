<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<title>NSObject class reference</title>
</head>
<body>
<!-- <font face="serif"> -->
<a href="Base.html">Up</a>
<br />
<h1><a name="title$NSObject">NSObject class reference</a></h1>
<h3>Authors</h3>
<dl>
<dt>Andrew Kachites McCallum (<a href="mailto:mccallum@gnu.ai.mit.edu"><code>mccallum@gnu.ai.mit.edu</code></a>)</dt>
<dd>
</dd>
</dl>
<p><b>Copyright:</b> (C) 1995, 1996, 1998 Free Software Foundation, Inc.</p>

<div>
<hr width="50%" align="left" />
<h3>Contents -</h3>
<ol>
<li>
<a href="#001000000000">Software documentation for the NSObject class</a>
</li>
<li>
<a href="#002000000000">Software documentation for the NSObject(GNUstep)
category</a>
</li>
<li>
<a href="#003000000000">Software documentation for the NSObject(NEXTSTEP)
category</a>
</li>
<li>
<a href="#004000000000">Software documentation for the
NSObject(TimedPerformers) informal
protocol</a>
</li>
<li>
<a href="#005000000000">Software documentation for the NSCoding protocol</a>
</li>
<li>
<a href="#006000000000">Software documentation for the NSCopying protocol</a>
</li>
<li>
<a href="#007000000000">Software documentation for the NSDiscardableContent
protocol</a>
</li>
<li>
<a href="#008000000000">Software documentation for the NSMutableCopying
protocol</a>
</li>
<li>
<a href="#009000000000">Software documentation for the NSObject protocol</a>
</li>
<li>
<a href="#010000000000">Software documentation for the NSSecureCoding protocol</a>
</li>
</ol>
<hr width="50%" align="left" />
</div>

<h1><a name="001000000000">
Software documentation for the NSObject class
</a></h1>
<h2><a name="class$NSObject">NSObject</a></h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<blockquote>
<dl>
<dt><b>Conforms to:</b></dt>
<dd><a rel="gsdoc" href="#protocol$(NSObject)">NSObject</a></dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">


</p>
<p>

<code>NSObject</code> is the root class (a root
class is a class with no superclass) of the GNUstep
base library class hierarchy, so all classes normally
inherit from <code>NSObject</code>. There is an
exception though: <code>NSProxy</code> (which is
used for remote messaging) does not inherit from
<code>NSObject</code>.
</p>
<p>


</p>
<p>

Unless you are really sure of what you are doing,
all your own classes should inherit (directly or
indirectly) from <code>NSObject</code> (or in
special cases from <code>NSProxy</code>).
<code>NSObject</code> provides the basic common
functionality shared by all GNUstep classes
and objects.
</p>
<p>


</p>
<p>

The essential methods which must be implemented by all
classes for their instances to be usable within
GNUstep are declared in a separate protocol, which
is the <code>NSObject</code> protocol. Both
<code>NSObject</code> and <code>NSProxy</code>
conform to this protocol, which means all objects
in a GNUstep application will conform to this protocol
(btw, if you don&apos;t find a method of
<code>NSObject</code> you are looking for in this
documentation, make sure you also look into
the documentation for the <code>NSObject</code>
protocol).
</p>
<p>


</p>
<p>

Theoretically, in special cases you might
need to implement a new root class. If you do, you
need to make sure that your root class conforms (at
least) to the <code>NSObject</code> protocol,
otherwise it will not interact correctly with the
GNUstep framework. Said that, I must note that I
have never seen a case in which a new root class is
needed.
</p>
<p>


</p>
<p>

<code>NSObject</code> is a root class, which implies
that instance methods of <code>NSObject</code> are
treated in a special way by the Objective-C
runtime. This is an exception to the normal way
messaging works with class and instance methods:
if the Objective-C runtime can&apos;t find a class method for
a class object, as a last resort it looks for an instance
method of the root class with the same name, and
executes it if it finds it. This means that
instance methods of the root class (such as
<code>NSObject</code>) can be performed by class
objects which inherit from that root class ! This
can only happen if the class doesn&apos;t have a class
method with the same name, otherwise that method -
of course - takes the precedence. Because of this
exception, <code>NSObject</code> &apos;s instance
methods are written in such a way that they work
both on <code>NSObject</code> &apos;s instances and on
class objects.
</p>
<p>


</div>
<hr width="50%" align="left" />
<a href="#_NSObject_ivars">Instance Variables</a>
<br/><br/>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(GNUstep)+enableDoubleReleaseCheck$">+enableDoubleReleaseCheck:</a></li>
<li><a rel="gsdoc" href="NSLock.html#method$NSObject(GSTraceLocks)+shouldCreateTraceableLocks$">+shouldCreateTraceableLocks:</a></li>
<li><a rel="gsdoc" href="NSLock.html#method$NSObject(GSTraceLocks)+tracedCondition">+tracedCondition</a></li>
<li><a rel="gsdoc" href="NSLock.html#method$NSObject(GSTraceLocks)+tracedConditionLockWithCondition$">+tracedConditionLockWithCondition:</a></li>
<li><a rel="gsdoc" href="NSLock.html#method$NSObject(GSTraceLocks)+tracedLock">+tracedLock</a></li>
<li><a rel="gsdoc" href="NSLock.html#method$NSObject(GSTraceLocks)+tracedRecursiveLock">+tracedRecursiveLock</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(NEXTSTEP)-error$,...">-error:,...</a></li>
<li><a rel="gsdoc" href="NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-attributeKeys">-attributeKeys</a></li>
<li><a rel="gsdoc" href="NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-classDescription">-classDescription</a></li>
<li><a rel="gsdoc" href="NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-inverseForRelationshipKey$">-inverseForRelationshipKey:</a></li>
<li><a rel="gsdoc" href="NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-toManyRelationshipKeys">-toManyRelationshipKeys</a></li>
<li><a rel="gsdoc" href="NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-toOneRelationshipKeys">-toOneRelationshipKeys</a></li>
<li><a rel="gsdoc" href="NSConnection.html#method$NSObject(NSConnectionDelegate)-authenticateComponents$withData$">-authenticateComponents:withData:</a></li>
<li><a rel="gsdoc" href="NSConnection.html#method$NSObject(NSConnectionDelegate)-authenticationDataForComponents$">-authenticationDataForComponents:</a></li>
<li><a rel="gsdoc" href="NSConnection.html#method$NSObject(NSConnectionDelegate)-connection$didConnect$">-connection:didConnect:</a></li>
<li><a rel="gsdoc" href="NSConnection.html#method$NSObject(NSConnectionDelegate)-connection$shouldMakeNewConnection$">-connection:shouldMakeNewConnection:</a></li>
<li><a rel="gsdoc" href="NSConnection.html#method$NSObject(NSConnectionDelegate)-makeNewConnection$sender$">-makeNewConnection:sender:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldCopyItemAtPath$toPath$">-fileManager:shouldCopyItemAtPath:toPath:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldCopyItemAtURL$toURL$">-fileManager:shouldCopyItemAtURL:toURL:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldLinkItemAtPath$toPath$">-fileManager:shouldLinkItemAtPath:toPath:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldLinkItemAtURL$toURL$">-fileManager:shouldLinkItemAtURL:toURL:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldMoveItemAtPath$toPath$">-fileManager:shouldMoveItemAtPath:toPath:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldMoveItemAtURL$toURL$">-fileManager:shouldMoveItemAtURL:toURL:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$copyingItemAtPath$toPath$">-fileManager:shouldProceedAfterError:copyingItemAtPath:toPath:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$copyingItemAtURL$toURL$">-fileManager:shouldProceedAfterError:copyingItemAtURL:toURL:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$linkingItemAtPath$toPath$">-fileManager:shouldProceedAfterError:linkingItemAtPath:toPath:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$linkingItemAtURL$toURL$">-fileManager:shouldProceedAfterError:linkingItemAtURL:toURL:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$movingItemAtPath$toPath$">-fileManager:shouldProceedAfterError:movingItemAtPath:toPath:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$movingItemAtURL$toURL$">-fileManager:shouldProceedAfterError:movingItemAtURL:toURL:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$removingItemAtPath$">-fileManager:shouldProceedAfterError:removingItemAtPath:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$removingItemAtURL$">-fileManager:shouldProceedAfterError:removingItemAtURL:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldRemoveItemAtPath$">-fileManager:shouldRemoveItemAtPath:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldRemoveItemAtURL$">-fileManager:shouldRemoveItemAtURL:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerHandler)-fileManager$shouldProceedAfterError$">-fileManager:shouldProceedAfterError:</a></li>
<li><a rel="gsdoc" href="NSFileManager.html#method$NSObject(NSFileManagerHandler)-fileManager$willProcessPath$">-fileManager:willProcessPath:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)+accessInstanceVariablesDirectly">+accessInstanceVariablesDirectly</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)+useStoredAccessor">+useStoredAccessor</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-dictionaryWithValuesForKeys$">-dictionaryWithValuesForKeys:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-handleQueryWithUnboundKey$">-handleQueryWithUnboundKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-handleTakeValue$forUnboundKey$">-handleTakeValue:forUnboundKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-mutableArrayValueForKey$">-mutableArrayValueForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-mutableArrayValueForKeyPath$">-mutableArrayValueForKeyPath:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-mutableSetValueForKey$">-mutableSetValueForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-mutableSetValueForKeyPath$">-mutableSetValueForKeyPath:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setNilValueForKey$">-setNilValueForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setValue$forKey$">-setValue:forKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setValue$forKeyPath$">-setValue:forKeyPath:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setValue$forUndefinedKey$">-setValue:forUndefinedKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setValuesForKeysWithDictionary$">-setValuesForKeysWithDictionary:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-storedValueForKey$">-storedValueForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeStoredValue$forKey$">-takeStoredValue:forKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeStoredValuesFromDictionary$">-takeStoredValuesFromDictionary:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeValue$forKey$">-takeValue:forKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeValue$forKeyPath$">-takeValue:forKeyPath:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeValuesFromDictionary$">-takeValuesFromDictionary:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-unableToSetNilForKey$">-unableToSetNilForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-validateValue$forKey$error$">-validateValue:forKey:error:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-validateValue$forKeyPath$error$">-validateValue:forKeyPath:error:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-valueForKey$">-valueForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-valueForKeyPath$">-valueForKeyPath:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-valueForUndefinedKey$">-valueForUndefinedKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-valuesForKeys$">-valuesForKeys:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-didChange$valuesAtIndexes$forKey$">-didChange:valuesAtIndexes:forKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-didChangeValueForKey$">-didChangeValueForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-didChangeValueForKey$withSetMutation$usingObjects$">-didChangeValueForKey:withSetMutation:usingObjects:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-willChange$valuesAtIndexes$forKey$">-willChange:valuesAtIndexes:forKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-willChangeValueForKey$">-willChangeValueForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-willChangeValueForKey$withSetMutation$usingObjects$">-willChangeValueForKey:withSetMutation:usingObjects:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverRegistration)-addObserver$forKeyPath$options$context$">-addObserver:forKeyPath:options:context:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverRegistration)-removeObserver$forKeyPath$">-removeObserver:forKeyPath:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObserving)-observeValueForKeyPath$ofObject$change$context$">-observeValueForKeyPath:ofObject:change:context:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)+automaticallyNotifiesObserversForKey$">+automaticallyNotifiesObserversForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)+keyPathsForValuesAffectingValueForKey$">+keyPathsForValuesAffectingValueForKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)+setKeys$triggerChangeNotificationsForDependentKey$">+setKeys:triggerChangeNotificationsForDependentKey:</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)-observationInfo">-observationInfo</a></li>
<li><a rel="gsdoc" href="NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)-setObservationInfo$">-setObservationInfo:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiver$didEncodeObject$">-archiver:didEncodeObject:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiver$willEncodeObject$">-archiver:willEncodeObject:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiver$willReplaceObject$withObject$">-archiver:willReplaceObject:withObject:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiverDidFinish$">-archiverDidFinish:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiverWillFinish$">-archiverWillFinish:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverObjectSubstitution)-classForKeyedArchiver">-classForKeyedArchiver</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverObjectSubstitution)-replacementObjectForKeyedArchiver$">-replacementObjectForKeyedArchiver:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiver$cannotDecodeObjectOfClassName$originalClasses$">-unarchiver:cannotDecodeObjectOfClassName:originalClasses:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiver$didDecodeObject$">-unarchiver:didDecodeObject:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiver$willReplaceObject$withObject$">-unarchiver:willReplaceObject:withObject:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiverDidFinish$">-unarchiverDidFinish:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiverWillFinish$">-unarchiverWillFinish:</a></li>
<li><a rel="gsdoc" href="NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverObjectSubstitution)+classForKeyedUnarchiver">+classForKeyedUnarchiver</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didFindDomain$moreComing$">-netServiceBrowser:didFindDomain:moreComing:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didFindService$moreComing$">-netServiceBrowser:didFindService:moreComing:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didNotSearch$">-netServiceBrowser:didNotSearch:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didRemoveDomain$moreComing$">-netServiceBrowser:didRemoveDomain:moreComing:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didRemoveService$moreComing$">-netServiceBrowser:didRemoveService:moreComing:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowserDidStopSearch$">-netServiceBrowserDidStopSearch:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowserWillSearch$">-netServiceBrowserWillSearch:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netService$didAcceptConnectionWithInputStream$outputStream$">-netService:didAcceptConnectionWithInputStream:outputStream:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netService$didNotPublish$">-netService:didNotPublish:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netService$didNotResolve$">-netService:didNotResolve:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netService$didUpdateTXTRecordData$">-netService:didUpdateTXTRecordData:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceDidPublish$">-netServiceDidPublish:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceDidResolveAddress$">-netServiceDidResolveAddress:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceDidStop$">-netServiceDidStop:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceWillPublish$">-netServiceWillPublish:</a></li>
<li><a rel="gsdoc" href="NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceWillResolve$">-netServiceWillResolve:</a></li>
<li><a rel="gsdoc" href="NSPortCoder.html#method$NSObject(NSPortCoder)-classForPortCoder">-classForPortCoder</a></li>
<li><a rel="gsdoc" href="NSPortCoder.html#method$NSObject(NSPortCoder)-replacementObjectForPortCoder$">-replacementObjectForPortCoder:</a></li>
<li><a rel="gsdoc" href="NSPort.html#method$NSObject(NSPortDelegateMethods)-handlePortMessage$">-handlePortMessage:</a></li>
<li><a rel="gsdoc" href="NSStream.html#method$NSObject(NSStreamDelegate)-stream$handleEvent$">-stream:handleEvent:</a></li>
<li><a rel="gsdoc" href="NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelector$onThread$withObject$waitUntilDone$">-performSelector:onThread:withObject:waitUntilDone:</a></li>
<li><a rel="gsdoc" href="NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelector$onThread$withObject$waitUntilDone$modes$">-performSelector:onThread:withObject:waitUntilDone:modes:</a></li>
<li><a rel="gsdoc" href="NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelectorInBackground$withObject$">-performSelectorInBackground:withObject:</a></li>
<li><a rel="gsdoc" href="NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelectorOnMainThread$withObject$waitUntilDone$">-performSelectorOnMainThread:withObject:waitUntilDone:</a></li>
<li><a rel="gsdoc" href="NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelectorOnMainThread$withObject$waitUntilDone$modes$">-performSelectorOnMainThread:withObject:waitUntilDone:modes:</a></li>
<li><a rel="gsdoc" href="NSURL.html#method$NSObject(NSURLClient)-URL$resourceDataDidBecomeAvailable$">-URL:resourceDataDidBecomeAvailable:</a></li>
<li><a rel="gsdoc" href="NSURL.html#method$NSObject(NSURLClient)-URL$resourceDidFailLoadingWithReason$">-URL:resourceDidFailLoadingWithReason:</a></li>
<li><a rel="gsdoc" href="NSURL.html#method$NSObject(NSURLClient)-URLResourceDidCancelLoading$">-URLResourceDidCancelLoading:</a></li>
<li><a rel="gsdoc" href="NSURL.html#method$NSObject(NSURLClient)-URLResourceDidFinishLoading$">-URLResourceDidFinishLoading:</a></li>
<li><a rel="gsdoc" href="NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$didFailWithError$">-connection:didFailWithError:</a></li>
<li><a rel="gsdoc" href="NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$didReceiveAuthenticationChallenge$">-connection:didReceiveAuthenticationChallenge:</a></li>
<li><a rel="gsdoc" href="NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$didReceiveData$">-connection:didReceiveData:</a></li>
<li><a rel="gsdoc" href="NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$didReceiveResponse$">-connection:didReceiveResponse:</a></li>
<li><a rel="gsdoc" href="NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$willCacheResponse$">-connection:willCacheResponse:</a></li>
<li><a rel="gsdoc" href="NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$willSendRequest$redirectResponse$">-connection:willSendRequest:redirectResponse:</a></li>
<li><a rel="gsdoc" href="NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connectionDidFinishLoading$">-connectionDidFinishLoading:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$decideDestinationWithSuggestedFilename$">-download:decideDestinationWithSuggestedFilename:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didCancelAuthenticationChallenge$">-download:didCancelAuthenticationChallenge:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didCreateDestination$">-download:didCreateDestination:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didFailWithError$">-download:didFailWithError:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didReceiveAuthenticationChallenge$">-download:didReceiveAuthenticationChallenge:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didReceiveDataOfLength$">-download:didReceiveDataOfLength:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didReceiveResponse$">-download:didReceiveResponse:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$shouldDecodeSourceDataOfMIMEType$">-download:shouldDecodeSourceDataOfMIMEType:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$willResumeWithResponse$fromByte$">-download:willResumeWithResponse:fromByte:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$willSendRequest$redirectResponse$">-download:willSendRequest:redirectResponse:</a></li>
<li><a rel="gsdoc" href="NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-downloadDidFinish$">-downloadDidFinish:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$didEndElement$namespaceURI$qualifiedName$">-parser:didEndElement:namespaceURI:qualifiedName:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$didEndMappingPrefix$">-parser:didEndMappingPrefix:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$didStartElement$namespaceURI$qualifiedName$attributes$">-parser:didStartElement:namespaceURI:qualifiedName:attributes:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$didStartMappingPrefix$toURI$">-parser:didStartMappingPrefix:toURI:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundAttributeDeclarationWithName$forElement$type$defaultValue$">-parser:foundAttributeDeclarationWithName:forElement:type:defaultValue:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundCDATA$">-parser:foundCDATA:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundCharacters$">-parser:foundCharacters:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundComment$">-parser:foundComment:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundElementDeclarationWithName$model$">-parser:foundElementDeclarationWithName:model:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundExternalEntityDeclarationWithName$publicID$systemID$">-parser:foundExternalEntityDeclarationWithName:publicID:systemID:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundIgnorableWhitespace$">-parser:foundIgnorableWhitespace:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundInternalEntityDeclarationWithName$value$">-parser:foundInternalEntityDeclarationWithName:value:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundNotationDeclarationWithName$publicID$systemID$">-parser:foundNotationDeclarationWithName:publicID:systemID:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundProcessingInstructionWithTarget$data$">-parser:foundProcessingInstructionWithTarget:data:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundUnparsedEntityDeclarationWithName$publicID$systemID$notationName$">-parser:foundUnparsedEntityDeclarationWithName:publicID:systemID:notationName:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$parseErrorOccurred$">-parser:parseErrorOccurred:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$resolveExternalEntityName$systemID$">-parser:resolveExternalEntityName:systemID:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$validationErrorOccurred$">-parser:validationErrorOccurred:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parserDidEndDocument$">-parserDidEndDocument:</a></li>
<li><a rel="gsdoc" href="NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parserDidStartDocument$">-parserDidStartDocument:</a></li>
<li><a rel="gsdoc" href="NSRunLoop.html#method$NSObject(RunLoopEvents)-runLoopShouldBlock$">-runLoopShouldBlock:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$">+cancelPreviousPerformRequestsWithTarget:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$selector$object$">+cancelPreviousPerformRequestsWithTarget:selector:object:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$">-performSelector:withObject:afterDelay:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$inModes$">-performSelector:withObject:afterDelay:inModes:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+alloc">+alloc</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+allocWithZone$">+allocWithZone:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+class">+class</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+initialize">+initialize</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+instanceMethodForSelector$">+instanceMethodForSelector:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+instanceMethodSignatureForSelector$">+instanceMethodSignatureForSelector:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+instancesRespondToSelector$">+instancesRespondToSelector:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+isSubclassOfClass$">+isSubclassOfClass:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+load">+load</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+new">+new</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+poseAsClass$">+poseAsClass:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+resolveClassMethod$">+resolveClassMethod:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+resolveInstanceMethod$">+resolveInstanceMethod:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+setVersion$">+setVersion:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject+version">+version</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-autoContentAccessingProxy">-autoContentAccessingProxy</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-awakeAfterUsingCoder$">-awakeAfterUsingCoder:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-classForArchiver">-classForArchiver</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-classForCoder">-classForCoder</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-className">-className</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-copy">-copy</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-dealloc">-dealloc</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-doesNotRecognizeSelector$">-doesNotRecognizeSelector:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-finalize">-finalize</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-forwardInvocation$">-forwardInvocation:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-forwardingTargetForSelector$">-forwardingTargetForSelector:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-init">-init</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-methodForSelector$">-methodForSelector:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-methodSignatureForSelector$">-methodSignatureForSelector:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-mutableCopy">-mutableCopy</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-replacementObjectForArchiver$">-replacementObjectForArchiver:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-replacementObjectForCoder$">-replacementObjectForCoder:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject-superclass">-superclass</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$NSObject+alloc">alloc&nbsp;</a></h3>
+ (id) <b>alloc</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Allocates a new instance of the receiver from the
default zone, by invoking
<a rel="gsdoc" href="#method$NSObject+allocWithZone$">
+allocWithZone:
</a>

with
<code>
<a rel="gsdoc" href="Functions.html#function$NSDefaultMallocZone">
NSDefaultMallocZone()
</a>

</code>
as the zone argument. <br /> Returns the created
instance.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+allocWithZone$">allocWithZone:&nbsp;</a></h3>
+ (id) <b>allocWithZone:</b> (<a rel="gsdoc" href="TypesAndConstants.html#type$NSZone">NSZone</a>*)z;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

This is the basic method to create a new instance. It
allocates a new instance of the receiver from the
specified memory zone.

</p>
<p>

Memory for an instance of the receiver is
allocated; a pointer to this newly created
instance is returned. All instance variables are
set to 0. No initialization of the instance is
performed apart from setup to be an instance of
the correct class: it is your responsibility to
initialize the instance by calling an
appropriate <code>init</code> method. If you
are not using the garbage collector, it is also your
responsibility to make sure the returned
instance is destroyed when you finish using it,
by calling the <code>release</code> method to destroy
the instance directly, or by using
<code>autorelease</code> and autorelease pools.
</p>
<p>


</p>
<p>

You do not normally need to override this method in
subclasses, unless you are implementing a
class which for some reasons silently allocates
instances of another class (this is typically
needed to implement class clusters and similar
design schemes).
</p>
<p>


</p>
<p>

If you have turned on debugging of object allocation
(by calling the <code>GSDebugAllocationActive</code>
function), this method will also update the
various debugging counts and monitors of
allocated objects, which you can access using
the <code>GSDebugAllocation...</code> functions.
</p>
<p>


</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+class">class&nbsp;</a></h3>
+ (Class) <b>class</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the receiver.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+initialize">initialize&nbsp;</a></h3>
+ (void) <b>initialize</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

This message is automatically sent to a class by the
runtime. It is sent once for each class, just
before the class is used for the first time
(excluding any automatic call to
<a rel="gsdoc" href="#method$NSObject+load">
+load
</a>

by the runtime). <br /> The message is sent in a
thread-safe manner... other threads may not
call methods of the class until
<a rel="gsdoc" href="#method$NSObject+initialize">
+initialize
</a>

has finished executing. <br /> If the class has a
superclass, its implementation of
<a rel="gsdoc" href="#method$NSObject+initialize">
+initialize
</a>

is called first. <br /> If the class does not implement
<a rel="gsdoc" href="#method$NSObject+initialize">
+initialize
</a>

then the implementation in the closest superclass may
be called. This means that
<a rel="gsdoc" href="#method$NSObject+initialize">
+initialize
</a>

may be called more than once, and the recommended way
to handle this by using the
<code>if (self == [classname class])</code>
conditional to check whether the method is
being called for a subclass. <br /> You should never
call
<a rel="gsdoc" href="#method$NSObject+initialize">
+initialize
</a>

yourself... let the runtime do it. <br /> You can
implement
<a rel="gsdoc" href="#method$NSObject+initialize">
+initialize
</a>

in your own class if you need to. NSObject&apos;s
implementation handles essential root object
and base library initialization. <br /> It should be
safe to call [super initialize] in your implementation
of <a rel="gsdoc" href="#method$NSObject+initialize">+initialize</a>

.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+instanceMethodForSelector$">instanceMethodForSelector:&nbsp;</a></h3>
+ (IMP) <b>instanceMethodForSelector:</b> (SEL)aSelector;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns a pointer to the C function implementing
the method used to respond to messages with
<var>aSelector</var> by instances of the receiving
class. <br /> Raises NSInvalidArgumentException if
given a null selector.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+instanceMethodSignatureForSelector$">instanceMethodSignatureForSelector:&nbsp;</a></h3>
+ (<a rel="gsdoc" href="NSMethodSignature.html#class$NSMethodSignature">NSMethodSignature</a>*) <b>instanceMethodSignatureForSelector:</b> (SEL)aSelector;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns a pointer to the C function implementing
the method used to respond to messages with
<var>aSelector</var> which are sent to instances of
the receiving class. <br /> Raises
NSInvalidArgumentException if
given a null selector.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+instancesRespondToSelector$">instancesRespondToSelector:&nbsp;</a></h3>
+ (BOOL) <b>instancesRespondToSelector:</b> (SEL)aSelector;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns a flag to say if instances of the receiver
class will respond to the specified selector. This
ignores situations where a subclass implements
<a rel="gsdoc" href="#method$NSObject-forwardInvocation$">
-forwardInvocation:
</a>

to respond to selectors not normally handled... in these
cases the subclass may override this method to handle
it. <br /> If given a null selector, raises
NSInvalidArgumentException when
in MacOS-X compatibility more, or returns
<code>NO</code> otherwise.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+isSubclassOfClass$">isSubclassOfClass:&nbsp;</a></h3>
+ (BOOL) <b>isSubclassOfClass:</b> (Class)aClass;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns <code>YES</code> if the receiver is
<var>aClass</var> or a subclass of <var>aClass</var>.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+load">load&nbsp;</a></h3>
+ (void) <b>load</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

This method is automatically invoked on any class
which implements it when the class is loaded into the
runtime. <br /> It is also invoked on any category
where the method is implemented when that category is
loaded into the runtime. <br /> The
<a rel="gsdoc" href="#method$NSObject+load">
+load
</a>

method is called directly by the runtime and you
should never send a
<a rel="gsdoc" href="#method$NSObject+load">
+load
</a>

message to a class yourself. <br /> This method is
called <em>before</em> the
<a rel="gsdoc" href="#method$NSObject+initialize">
+initialize
</a>

message is sent to the class, so you cannot depend
on class initialisation having been performed, or upon
other classes existing (apart from superclasses of
the receiver, since
<a rel="gsdoc" href="#method$NSObject+load">
+load
</a>

is called on superclasses before it is called on their
subclasses). <br /> As a gross generalisation,
it is safe to use C code, including most ObjectiveC
runtime functions within
<a rel="gsdoc" href="#method$NSObject+load">
+load
</a>

, but attempting to send messages to ObjectiveC objects
is likely to fail. <br /> In GNUstep, this method is
implemented for NSObject to perform some
initialisation for the base library. <br />
If you implement
<a rel="gsdoc" href="#method$NSObject+load">
+load
</a>

for a class, don&apos;t call [super load] in your
implementation.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+new">new&nbsp;</a></h3>
+ (id) <b>new</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">


</p>
<p>

This method is a short-hand for alloc followed by
init, that is,
</p>
<p>


</p>
<p>

<code>NSObject *object = [NSObject new];</code>
</p>
<p>

is exactly the same as

</p>
<p>

<code>
NSObject *object = [[NSObject alloc] init];
</code>
</p>
<p>


</p>
<p>

This is a general convention: all
<code>new...</code> methods are supposed to return
a newly allocated and initialized instance, as would be
generated by an <code>alloc</code> method
followed by a corresponding <code>init...</code>
method. Please note that if you are not using a
garbage collector, this means that instances
generated by the <code>new...</code> methods
are not autoreleased, that is, you are responsible
for releasing (autoreleasing) the instances yourself.
So when you use <code>new</code> you typically do
something like:
</p>
<p>


</p>
<p>

<code>
NSMutableArray *array = AUTORELEASE
([NSMutableArray new]);
</code>
</p>
<p>


</p>
<p>

You do not normally need to override <code>new</code>
in subclasses, because if you override
<code>init</code> (and optionally
<code>allocWithZone:</code> if you really need),
<code>new</code> will automatically use your
subclass methods.
</p>
<p>


</p>
<p>

You might need instead to define new
<code>new...</code> methods specific to your
subclass to match any <code>init...</code>
specific to your subclass. For example, if your
subclass defines an instance method
</p>
<p>


</p>
<p>

<code>initWithName:</code>
</p>
<p>


</p>
<p>

it might be handy for you to have a class method
</p>
<p>


</p>
<p>

<code>newWithName:</code>
</p>
<p>


</p>
<p>

which combines <code>alloc</code> and
<code>initWithName:</code>. You would implement it
as follows:
</p>
<p>


</p>
<p>

<code>
+ (<strong>id</strong>) newWithName: (NSString
*)aName {return [[self alloc] initWithName:
aName];}
</code>
</p>
<p>


</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+poseAsClass$">poseAsClass:&nbsp;</a></h3>
+ (void) <b>poseAsClass:</b> (Class)aClassObject;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Sets up the ObjC runtime so that the receiver is used
wherever code calls for <var>aClassObject</var> to
be used.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+resolveClassMethod$">resolveClassMethod:&nbsp;</a></h3>
+ (BOOL) <b>resolveClassMethod:</b> (SEL)name;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.5.0</div>
<br />
<div class="desc">

This method will be called when attempting to send a
message a class that does not understand it. The
class may install a new method for the given selector
and return <code>YES</code>, otherwise it should return
<code>NO</code>. Note: This method is only reliable
when using the GNUstep runtime. If you require
compatibility with the GCC runtime, you must
also implement
<a rel="gsdoc" href="#method$NSObject-forwardInvocation$">
-forwardInvocation:
</a>

with equivalent semantics. This will be considerably
slower, but more portable.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+resolveInstanceMethod$">resolveInstanceMethod:&nbsp;</a></h3>
+ (BOOL) <b>resolveInstanceMethod:</b> (SEL)name;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.5.0</div>
<br />
<div class="desc">

This method will be called when attempting to send a
message an instance that does not understand it.
The class may install a new method for the given
selector and return <code>YES</code>, otherwise it
should return <code>NO</code>. Note: This method is
only reliable when using the GNUstep runtime. If you
require compatibility with the GCC runtime, you
must also implement
<a rel="gsdoc" href="#method$NSObject-forwardInvocation$">
-forwardInvocation:
</a>

with equivalent semantics. This will be considerably
slower, but more portable.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+setVersion$">setVersion:&nbsp;</a></h3>
+ (id) <b>setVersion:</b> (<a rel="gsdoc" href="TypesAndConstants.html#type$NSInteger">NSInteger</a>)aVersion;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Sets the version number of the receiving class. Should
be nonnegative.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject+version">version&nbsp;</a></h3>
+ (<a rel="gsdoc" href="TypesAndConstants.html#type$NSInteger">NSInteger</a>) <b>version</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the version number of the receiving class.
This will default to a number assigned by the
Objective C compiler if [NSObject -setVersion]
has not been called.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-autoContentAccessingProxy">autoContentAccessingProxy&nbsp;</a></h3>
- (id) <b>autoContentAccessingProxy</b>;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.6.0</div>
<br />
<div class="desc">

Returns an auto-accessing proxy for the given
object. This proxy sends a
<a rel="gsdoc" href="#method$(NSDiscardableContent)-beginContentAccess">
-beginContentAccess
</a>

message to the receiver when it is created and an
<a rel="gsdoc" href="#method$(NSDiscardableContent)-endContentAccess">
-endContentAccess
</a>

message when it is destroyed. This prevents an
object that implements the NSDiscardableContent
protocol from having its contents discarded for as
<strong>long</strong> as the proxy exists. On
systems using the GNUstep runtime, messages send to
the proxy will be slightly slower than direct messages.
With the GCC runtime, they will be approximately two
orders of magnitude slower. The GNUstep runtime,
therefore, is strongly recommended for code
calling this method.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-awakeAfterUsingCoder$">awakeAfterUsingCoder:&nbsp;</a></h3>
- (id) <b>awakeAfterUsingCoder:</b> (<a rel="gsdoc" href="NSCoder.html#class$NSCoder">NSCoder</a>*)aDecoder;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Called after the receiver has been created by
decoding some sort of archive. Returns self.
Subclasses may override this to perform some
special initialisation upon being decoded.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-classForArchiver">classForArchiver&nbsp;</a></h3>
- (Class) <b>classForArchiver</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Override to substitute class when an instance is
being archived by an
<a rel="gsdoc" href="NSArchiver.html#class$NSArchiver">NSArchiver</a>

. Default implementation returns
<a rel="gsdoc" href="#method$NSObject-classForCoder">
-classForCoder
</a>

.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-classForCoder">classForCoder&nbsp;</a></h3>
- (Class) <b>classForCoder</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Override to substitute class when an instance is
being serialized by an
<a rel="gsdoc" href="NSCoder.html#class$NSCoder">NSCoder</a>

. Default implementation returns
<code>[self class]</code> (no substitution).

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-className">className&nbsp;</a></h3>
- (<a rel="gsdoc" href="NSString.html#class$NSString">NSString</a>*) <b>className</b>;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.0.0</div>
<br />
<div class="desc">

Returns the name of the class of the receiving
object by using the
<a rel="gsdoc" href="Functions.html#function$NSStringFromClass">
NSStringFromClass()
</a>

function. <br /> This is a MacOS-X addition for
apple scripting, which is also generally useful.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-copy">copy&nbsp;</a></h3>
- (id) <b>copy</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Creates and returns a copy of the receiver by
calling
<a rel="gsdoc" href="#method$(NSCopying)-copyWithZone$">
-copyWithZone:
</a>

passing
<a rel="gsdoc" href="Functions.html#function$NSDefaultMallocZone">
NSDefaultMallocZone()
</a>


</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-dealloc">dealloc&nbsp;</a></h3>
- (void) <b>dealloc</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Deallocates the receiver by calling
<a rel="gsdoc" href="Functions.html#function$NSDeallocateObject">
NSDeallocateObject()
</a>

with self as the argument. <br />

</p>
<p>

You should normally call the superclass
implementation of this method when you
override it in a subclass, or the memory
occupied by your object will not be released.
</p>
<p>


</p>
<p>

<code>NSObject</code> &apos;s implementation of this
method destroys the receiver, by returning the
memory allocated to the receiver to the system.
After this method has been called on an instance,
you must not refer the instance in any way, because
it does not exist any longer. If you do, it is a bug
and your program might even crash with a segmentation
fault.
</p>
<p>


</p>
<p>

If you have turned on the debugging facilities for
instance allocation, <code>NSObject</code> &apos;s
implementation of this method will also
update the various counts and monitors of
allocated instances (see the
<code>GSDebugAllocation...</code> functions for
more info).
</p>
<p>


</p>
<p>

Normally you are supposed to manage the memory
taken by objects by using the high level interface
provided by the <code>retain</code>,
<code>release</code> and <code>autorelease</code>
methods (or better by the corresponding macros
<code>RETAIN</code>, <code>RELEASE</code> and
<code>AUTORELEASE</code>), and by autorelease
pools and such; whenever the release/autorelease
mechanism determines that an object is no
longer needed (which happens when its retain count
reaches 0), it will call the <code>dealloc</code>
method to actually deallocate the object. This
means that normally, you should not need to call
<code>dealloc</code> directly as the gnustep base
library automatically calls it for you when the
retain count of an object reaches 0.
</p>
<p>


</p>
<p>

Because the <code>dealloc</code> method will be
called when an instance is being destroyed, if
instances of your subclass use objects or
resources (as it happens for most useful
classes), you must override
<code>dealloc</code> in subclasses to release all
objects and resources which are used by the
instance, otherwise these objects and resources
would be leaked. In the subclass implementation,
you should first release all your subclass specific
objects and resources, and then invoke super&apos;s
implementation (which will do the same,
and so on up in the class hierarchy to
<code>NSObject</code> &apos;s implementation, which
finally destroys the object). Here is an example
of the implementation of <code>dealloc</code> for a
subclass whose instances have a single instance
variable <code>name</code> which needs to be
released when an instance is deallocated:
</p>
<p>


</p>
<p>

<code>
- (<strong>void</strong>) dealloc {RELEASE (name);
[super dealloc];}
</code>
</p>
<p>


</p>
<p>

<code>dealloc</code> might contain code to release
not only objects, but also other resources, such as
open files, network connections, raw memory
allocated in other ways, etc.
</p>
<p>


</p>
<p>

If you have allocated the memory using a non-standard
mechanism, you will not call the superclass
(NSObject) implementation of the method as you
will need to handle the deallocation specially.
<br /> In some circumstances, an object may wish
to prevent itself from being deallocated, it can do
this simply be refraining from calling the
superclass implementation.
</p>
<p>


</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-doesNotRecognizeSelector$">doesNotRecognizeSelector:&nbsp;</a></h3>
- (void) <b>doesNotRecognizeSelector:</b> (SEL)aSelector;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Raises an invalid argument exception providing
information about the receivers inability to
handle <var>aSelector</var>.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-finalize">finalize&nbsp;</a></h3>
- (void) <b>finalize</b>;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.5.0</div>
<br />
<div class="desc">

On a system which performs garbage collection, you
should implement this method to execute code when
the receiver is collected. <br /> You must not call
this method yourself (except when a subclass calls the
superclass method within its own
implementation).

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-forwardInvocation$">forwardInvocation:&nbsp;</a></h3>
- (void) <b>forwardInvocation:</b> (<a rel="gsdoc" href="NSInvocation.html#class$NSInvocation">NSInvocation</a>*)anInvocation;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

This method is called automatically to handle a
message sent to the receiver for which the
receivers class has no method. <br /> The default
implementation calls
<a rel="gsdoc" href="#method$NSObject-doesNotRecognizeSelector$">
-doesNotRecognizeSelector:
</a>


</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-forwardingTargetForSelector$">forwardingTargetForSelector:&nbsp;</a></h3>
- (id) <b>forwardingTargetForSelector:</b> (SEL)aSelector;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.6.0</div>
<br />
<div class="desc">

If an object does not understand a message, it may
delegate it to another object. Returning
<code>nil</code> indicates that forwarding should
not take place. The default implementation of this
returns <code>nil</code>, but care should be taken
when subclassing NSObject subclasses and overriding
this method that the superclass implementation is
called if returning <code>nil</code>. Note: This
method is only reliable when using the GNUstep
runtime and code compiled with clang. If you
require compatibility with GCC and the GCC runtime,
you must also implement
<a rel="gsdoc" href="#method$NSObject-forwardInvocation$">
-forwardInvocation:
</a>

with equivalent semantics. This will be considerably
slower, but more portable.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-init">init&nbsp;</a></h3>
- (id) <b>init</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Initialises the receiver... the NSObject
implementation simply returns self.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-methodForSelector$">methodForSelector:&nbsp;</a></h3>
- (IMP) <b>methodForSelector:</b> (SEL)aSelector;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns a pointer to the C function implementing
the method used to respond to messages with
<var>aSelector</var>. <br /> Raises
NSInvalidArgumentException if
given a null selector.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-methodSignatureForSelector$">methodSignatureForSelector:&nbsp;</a></h3>
- (<a rel="gsdoc" href="NSMethodSignature.html#class$NSMethodSignature">NSMethodSignature</a>*) <b>methodSignatureForSelector:</b> (SEL)aSelector;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the method signature describing how the
receiver would handle a message with
<var>aSelector</var>. <br /> Returns <code>nil</code>
if given a null selector.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-mutableCopy">mutableCopy&nbsp;</a></h3>
- (id) <b>mutableCopy</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Creates and returns a mutable copy of the receiver
by calling
<a rel="gsdoc" href="#method$(NSMutableCopying)-mutableCopyWithZone$">
-mutableCopyWithZone:
</a>

passing
<a rel="gsdoc" href="Functions.html#function$NSDefaultMallocZone">
NSDefaultMallocZone()
</a>

.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-replacementObjectForArchiver$">replacementObjectForArchiver:&nbsp;</a></h3>
- (id) <b>replacementObjectForArchiver:</b> (<a rel="gsdoc" href="NSArchiver.html#class$NSArchiver">NSArchiver</a>*)anArchiver;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Override to substitute another object for this
instance when being archived by given
<a rel="gsdoc" href="NSArchiver.html#class$NSArchiver">NSArchiver</a>

. Default implementation returns
<a rel="gsdoc" href="#method$NSObject-replacementObjectForCoder$">
-replacementObjectForCoder:
</a>

.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-replacementObjectForCoder$">replacementObjectForCoder:&nbsp;</a></h3>
- (id) <b>replacementObjectForCoder:</b> (<a rel="gsdoc" href="NSCoder.html#class$NSCoder">NSCoder</a>*)anEncoder;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Override to substitute another object for this
instance when being serialized by given
<a rel="gsdoc" href="NSCoder.html#class$NSCoder">NSCoder</a>

. Default implementation returns <code>self</code>.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject-superclass">superclass&nbsp;</a></h3>
- (Class) <b>superclass</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the super class from which the receivers
class was derived.

</div>
<hr width="25%" align="left" />
</div>
<a name="_NSObject_ivars"/>    <br/><hr width="50%" align="left" />
<h2>Instance Variables for NSObject Class</h2>
<h3><a name="ivariable$NSObject*isa">isa</a></h3>
@protected Class <b>isa</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Points to instance&apos;s class. Used by runtime to
access method implementations, etc.. Set in
<a rel="gsdoc" href="#method$NSObject+alloc">
+alloc
</a>

, Unlike other instance variables, which are cleared
there.

</div>
<hr width="25%" align="left" />
<br/><hr width="50%" align="left" /><br/>

<h1><a name="002000000000">
Software documentation for the NSObject(GNUstep)
category
</a></h1>
<h2><a rel="gsdoc" href="#class$NSObject">NSObject</a>(<a name="category$NSObject(GNUstep)">GNUstep</a>)</h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> Not in OpenStep/MacOS-X, Base Likely to be changed/moved/removed at 1.17.0</div>
<br />
<div class="desc">

Some non-standard extensions mainly needed for backwards
compatibility and internal utility reasons.

</div>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(GNUstep)+enableDoubleReleaseCheck$">+enableDoubleReleaseCheck:</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$NSObject(GNUstep)+enableDoubleReleaseCheck$">enableDoubleReleaseCheck:&nbsp;</a></h3>
+ (void) <b>enableDoubleReleaseCheck:</b> (BOOL)enable;<br />
<div class="availability">
<b>Availability:</b> Not in OpenStep/MacOS-X, Base Likely to be changed/moved/removed at 1.17.0</div>
<br />
<div class="desc">

Enables runtime checking of
retain/release/autorelease
operations. <br />

</p>
<p>

Whenever either
<a rel="gsdoc" href="#method$(NSObject)-autorelease">
-autorelease
</a>

or <a rel="gsdoc" href="#method$(NSObject)-release">-release</a>
is
called, the contents of any autorelease pools
will be checked to see if there are more outstanding
release operations than the objects retain count.
In which case an exception is raised to say that the
object is released too many times.
</p>
<p>


</p>
<p>

<strong>Beware</strong>, since this feature
entails examining all active autorelease pools
every time an object is released or autoreleased,
it can cause a massive performance degradation... it
should only be enabled for debugging.
</p>
<p>


</p>
<p>

When you are having memory allocation problems, it
may make more sense to look at the memory allocation
debugging functions documented in NSDebug.h, or
use the NSZombie features.
</p>
<p>


</div>
<hr width="25%" align="left" />
</div>

<h1><a name="003000000000">
Software documentation for the NSObject(NEXTSTEP)
category
</a></h1>
<h2><a rel="gsdoc" href="#class$NSObject">NSObject</a>(<a name="category$NSObject(NEXTSTEP)">NEXTSTEP</a>)</h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> Not in OpenStep/MacOS-X</div>
<br />
<div class="desc">

Methods for compatibility with the NEXTSTEP
(pre-OpenStep) &apos;Object&apos; class.

</div>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(NEXTSTEP)-error$,...">-error:,...</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$NSObject(NEXTSTEP)-error$,...">error:&nbsp;,...</a></h3>
- (id) <b>error:</b> (const char*)aString<b>,...</b>;<br />
<div class="availability">
<b>Availability:</b> Not in OpenStep/MacOS-X</div>
<br />
<div class="desc">

Logs a message. <em>Deprecated.</em> Use
<a rel="gsdoc" href="Functions.html#function$NSLog">
NSLog()
</a>

in new code.

</div>
<hr width="25%" align="left" />
</div>

<h1><a name="004000000000">
Software documentation for the
NSObject(TimedPerformers) informal
protocol
</a></h1>
<h2><a rel="gsdoc" href="#class$NSObject">NSObject</a>(<a name="category$NSObject(TimedPerformers)">TimedPerformers</a>)</h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Declares some methods for sending messages to self
after a fixed delay. (These methods <em>are</em> in
OpenStep and OS X.)

</div>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$">+cancelPreviousPerformRequestsWithTarget:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$selector$object$">+cancelPreviousPerformRequestsWithTarget:selector:object:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$">-performSelector:withObject:afterDelay:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$inModes$">-performSelector:withObject:afterDelay:inModes:</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$">cancelPreviousPerformRequestsWithTarget:&nbsp;</a></h3>
+ (void) <b>cancelPreviousPerformRequestsWithTarget:</b> (id)obj;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Cancels any perform operations set up for the
specified target in the current run loop.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$selector$object$">cancelPreviousPerformRequestsWithTarget:&nbsp;selector:&nbsp;object:&nbsp;</a></h3>
+ (void) <b>cancelPreviousPerformRequestsWithTarget:</b> (id)obj<b> selector:</b> (SEL)s<b> object:</b> (id)arg;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Cancels any perform operations set up for the
specified target in the current loop, but only if
the value of aSelector and argument with which the
performs were set up match those supplied. <br />
Matching of the argument may be either by pointer
equality or by use of the

[NSObject -isEqual:]


method.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$">performSelector:&nbsp;withObject:&nbsp;afterDelay:&nbsp;</a></h3>
- (void) <b>performSelector:</b> (SEL)s<b> withObject:</b> (id)arg<b> afterDelay:</b> (<a rel="gsdoc" href="TypesAndConstants.html#type$NSTimeInterval">NSTimeInterval</a>)seconds;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Sets given message to be sent to this instance after
given delay, in any run loop mode. See
<a rel="gsdoc" href="NSRunLoop.html#class$NSRunLoop">NSRunLoop</a>

.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$inModes$">performSelector:&nbsp;withObject:&nbsp;afterDelay:&nbsp;inModes:&nbsp;</a></h3>
- (void) <b>performSelector:</b> (SEL)s<b> withObject:</b> (id)arg<b> afterDelay:</b> (<a rel="gsdoc" href="TypesAndConstants.html#type$NSTimeInterval">NSTimeInterval</a>)seconds<b> inModes:</b> (<a rel="gsdoc" href="NSArray.html#class$NSArray">NSArray</a>*)modes;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Sets given message to be sent to this instance after
given delay, in given run loop <var>modes</var>. See
<a rel="gsdoc" href="NSRunLoop.html#class$NSRunLoop">NSRunLoop</a>

.

</div>
<hr width="25%" align="left" />
</div>

<h1><a name="005000000000">
Software documentation for the NSCoding protocol
</a></h1>
<h2><a name="protocol$(NSCoding)">NSCoding</a></h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

This protocol must be adopted by any class wishing to
support saving and restoring instances to an archive,
or copying them to remote processes via the Distributed
Objects mechanism.

</div>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$(NSCoding)-encodeWithCoder$">-encodeWithCoder:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSCoding)-initWithCoder$">-initWithCoder:</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$(NSCoding)-encodeWithCoder$">encodeWithCoder:&nbsp;</a></h3>
- (void) <b>encodeWithCoder:</b> (<a rel="gsdoc" href="NSCoder.html#class$NSCoder">NSCoder</a>*)aCoder;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Called when it is time for receiver to be serialized
for writing to an archive or network connection.
Receiver should record all of its instance
variables using methods on <var>aCoder</var>. See
documentation for
<a rel="gsdoc" href="NSCoder.html#class$NSCoder">NSCoder</a>

,
<a rel="gsdoc" href="NSArchiver.html#class$NSArchiver">NSArchiver</a>

,
<a rel="gsdoc" href="NSKeyedArchiver.html#class$NSKeyedArchiver">NSKeyedArchiver</a>

, and/or
<a rel="gsdoc" href="NSPortCoder.html#class$NSPortCoder">NSPortCoder</a>

for more information.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSCoding)-initWithCoder$">initWithCoder:&nbsp;</a></h3>
- (id) <b>initWithCoder:</b> (<a rel="gsdoc" href="NSCoder.html#class$NSCoder">NSCoder</a>*)aDecoder;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Called on a freshly allocated receiver when it is
time to reconstitute from serialized bytes in an
archive or from a network connection. Receiver
should load all of its instance variables using
methods on aCoder. See documentation for
<a rel="gsdoc" href="NSCoder.html#class$NSCoder">NSCoder</a>

,
<a rel="gsdoc" href="NSArchiver.html#class$NSUnarchiver">NSUnarchiver</a>

,
<a rel="gsdoc" href="NSKeyedArchiver.html#class$NSKeyedUnarchiver">NSKeyedUnarchiver</a>

, and/or
<a rel="gsdoc" href="NSPortCoder.html#class$NSPortCoder">NSPortCoder</a>

for more information.

</div>
<hr width="25%" align="left" />
</div>

<h1><a name="006000000000">
Software documentation for the NSCopying protocol
</a></h1>
<h2><a name="protocol$(NSCopying)">NSCopying</a></h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

This protocol must be adopted by any class wishing to
support copying - ie where instances of the class
should be able to create new instances which are
copies of the original and, where a class has mutable
and immutable versions, where the copies are immutable.

</div>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$(NSCopying)-copyWithZone$">-copyWithZone:</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$(NSCopying)-copyWithZone$">copyWithZone:&nbsp;</a></h3>
- (id) <b>copyWithZone:</b> (<a rel="gsdoc" href="TypesAndConstants.html#type$NSZone">NSZone</a>*)zone;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Called by
<a rel="gsdoc" href="#method$NSObject-copy">
[NSObject -copy]
</a>

passing
<a rel="gsdoc" href="Functions.html#function$NSDefaultMallocZone">
NSDefaultMallocZone()
</a>

as <var>zone</var>. <br /> This method returns a copy of
the receiver and, where the receiver is a mutable
variant of a class which has an immutable partner
class, the object returned is an instance of that
immutable class. <br /> The new object is
<em>not</em> autoreleased, and is considered to be
&apos;owned&apos; by the calling code... which is therefore
responsible for releasing it. <br /> In the
case where the receiver is an instance of a container
class, it is undefined whether contained objects are
merely retained in the new copy, or are themselves
copied, or whether some other mechanism entirely is
used.

</div>
<hr width="25%" align="left" />
</div>

<h1><a name="007000000000">
Software documentation for the NSDiscardableContent
protocol
</a></h1>
<h2><a name="protocol$(NSDiscardableContent)">NSDiscardableContent</a></h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> MacOS-X 10.6.0</div>
<br />
<div class="desc">

The NSDiscardableContent protocol is used by objects
which encapsulate data which may be discarded if
resource constraints are exceeded. These constraints
are typically, but not always, related memory.

</div>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$(NSDiscardableContent)-beginContentAccess">-beginContentAccess</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSDiscardableContent)-discardContentIfPossible">-discardContentIfPossible</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSDiscardableContent)-endContentAccess">-endContentAccess</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSDiscardableContent)-isContentDiscarded">-isContentDiscarded</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$(NSDiscardableContent)-beginContentAccess">beginContentAccess&nbsp;</a></h3>
- (BOOL) <b>beginContentAccess</b>;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.6.0</div>
<br />
<div class="desc">

This method is called before any access to the object.
It returns <code>YES</code> if the object&apos;s content is
still valid. The caller must call
<a rel="gsdoc" href="#method$(NSDiscardableContent)-endContentAccess">
-endContentAccess
</a>

once for every call to
<a rel="gsdoc" href="#method$(NSDiscardableContent)-beginContentAccess">
-beginContentAccess
</a>

;

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSDiscardableContent)-discardContentIfPossible">discardContentIfPossible&nbsp;</a></h3>
- (void) <b>discardContentIfPossible</b>;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.6.0</div>
<br />
<div class="desc">

Discards the contents of the object if it is not
currently being edited.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSDiscardableContent)-endContentAccess">endContentAccess&nbsp;</a></h3>
- (void) <b>endContentAccess</b>;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.6.0</div>
<br />
<div class="desc">

This method indicates that the caller has finished
accessing the contents of the object adopting
this protocol. Every call to
<a rel="gsdoc" href="#method$(NSDiscardableContent)-beginContentAccess">
-beginContentAccess
</a>

must be be paired with a call to this method after the
caller has finished accessing the contents.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSDiscardableContent)-isContentDiscarded">isContentDiscarded&nbsp;</a></h3>
- (BOOL) <b>isContentDiscarded</b>;<br />
<div class="availability">
<b>Availability:</b> MacOS-X 10.6.0</div>
<br />
<div class="desc">

Returns <code>YES</code> if the contents of the
object have been discarded, either via a call to
<a rel="gsdoc" href="#method$(NSDiscardableContent)-discardContentIfPossible">
-discardContentIfPossible
</a>

while the object is not in use, or by some
implementation dependent mechanism.

</div>
<hr width="25%" align="left" />
</div>

<h1><a name="008000000000">
Software documentation for the NSMutableCopying
protocol
</a></h1>
<h2><a name="protocol$(NSMutableCopying)">NSMutableCopying</a></h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

This protocol must be adopted by any class wishing to
support mutable copying - ie where instances of the
class should be able to create mutable copies of
themselves.

</div>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$(NSMutableCopying)-mutableCopyWithZone$">-mutableCopyWithZone:</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$(NSMutableCopying)-mutableCopyWithZone$">mutableCopyWithZone:&nbsp;</a></h3>
- (id) <b>mutableCopyWithZone:</b> (<a rel="gsdoc" href="TypesAndConstants.html#type$NSZone">NSZone</a>*)zone;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Called by
<a rel="gsdoc" href="#method$NSObject-mutableCopy">
[NSObject -mutableCopy]
</a>

passing
<a rel="gsdoc" href="Functions.html#function$NSDefaultMallocZone">
NSDefaultMallocZone()
</a>

as <var>zone</var>. <br /> This method returns a copy of
the receiver and, where the receiver is an immutable
variant of a class which has a mutable partner
class, the object returned is an instance of that
mutable class. The new object is <em>not</em>
autoreleased, and is considered to be &apos;owned&apos;
by the calling code... which is therefore responsible
for releasing it. <br /> In the case where the receiver
is an instance of a container class, it is undefined
whether contained objects are merely retained in
the new copy, or are themselves copied, or whether some
other mechanism entirely is used.

</div>
<hr width="25%" align="left" />
</div>

<h1><a name="009000000000">
Software documentation for the NSObject protocol
</a></h1>
<h2><a name="protocol$(NSObject)">NSObject</a></h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

The NSObject protocol describes a minimal set of methods
that all objects are expected to support. You should be
able to send any of the messages listed in this protocol
to an object, and be safe in assuming that the receiver
can handle it.

</div>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-autorelease">-autorelease</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-class">-class</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-conformsToProtocol$">-conformsToProtocol:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-description">-description</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-hash">-hash</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-isEqual$">-isEqual:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-isKindOfClass$">-isKindOfClass:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-isMemberOfClass$">-isMemberOfClass:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-isProxy">-isProxy</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-performSelector$">-performSelector:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-performSelector$withObject$">-performSelector:withObject:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-performSelector$withObject$withObject$">-performSelector:withObject:withObject:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-release">-release</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-respondsToSelector$">-respondsToSelector:</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-retain">-retain</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-retainCount">-retainCount</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-self">-self</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-superclass">-superclass</a></li>
<li><a rel="gsdoc" href="NSObject.html#method$(NSObject)-zone">-zone</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$(NSObject)-autorelease">autorelease&nbsp;</a></h3>
- (id) <b>autorelease</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Performs a deferred
<a rel="gsdoc" href="#method$(NSObject)-release">
-release
</a>

operation. The object&apos;s reference count is
decremented at the end of the scope of the
current autorelease pool, identified either by a
<a rel="gsdoc" href="NSAutoreleasePool.html#method$NSAutoreleasePool-drain">
-drain
</a>

message sent to the current NSAutoreleasePool
instance, or in more recent versions of
Objective-C by the end of an @autorelease_pool
scope. In garbage collected mode, this method does
nothing. In automated reference counting mode, you
may neither implement this method nor call it directly.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-class">class&nbsp;</a></h3>
- (Class) <b>class</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the class of the receiver. If the receiver
is a proxy, then this may return the class of the proxy
target. Use
<a rel="gsdoc" href="#method$(NSObject)-isProxy">
-isProxy
</a>

to determine whether the receiver is a proxy. If you
wish to find the real class of the receiver, ignoring
proxies, then use

object_getClass()


.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-conformsToProtocol$">conformsToProtocol:&nbsp;</a></h3>
- (BOOL) <b>conformsToProtocol:</b> (Protocol*)aProtocol;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns <code>YES</code> if the receiver conforms
to the specified protocol.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-description">description&nbsp;</a></h3>
- (<a rel="gsdoc" href="NSString.html#class$NSString">NSString</a>*) <b>description</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the description of the object. This is used
by the %@ format specifier in strings.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-hash">hash&nbsp;</a></h3>
- (<a rel="gsdoc" href="TypesAndConstants.html#type$NSUInteger">NSUInteger</a>) <b>hash</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns a hash value for the object. All objects
that are equal *MUST* return the same hash value. For
efficient storage in sets, or as keys in
dictionaries, different objects should return
hashes spread evenly over the range of an integer.
An object may not return different values from this
method after being stored in a collection. This
typically means that ether the hash value must be
constant after the object&apos;s creation, or that the
object may not be modified while stored in an
unordered collection.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-isEqual$">isEqual:&nbsp;</a></h3>
- (BOOL) <b>isEqual:</b> (id)anObject;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns whether the receiver is equal to the
argument. Defining equality is complex, so be
careful when implementing this method. Collections
such as NSSet depend on the behaviour of this method.
In particular, this method must be commutative, so for
any objects a and b: [a isEqual: b] == [b isEqual: a]
This means that you must be very careful when
returning <code>YES</code> if the argument is of
another class. For example, if you define a number
class that returns <code>YES</code> if the argument
is a string representation of the number, then this will
break because the string will not recognise your
object as being equal to itself. If two objects are
equal, then they must have the same hash value,
however equal hash values do not imply equality.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-isKindOfClass$">isKindOfClass:&nbsp;</a></h3>
- (BOOL) <b>isKindOfClass:</b> (Class)aClass;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns <code>YES</code> if the receiver is an
instance of the class, an instance of the
subclass, or (in the case of proxies), an
instance of something that can be treated as an
instance of the class.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-isMemberOfClass$">isMemberOfClass:&nbsp;</a></h3>
- (BOOL) <b>isMemberOfClass:</b> (Class)aClass;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns <code>YES</code> if the receiver is an
instance of the class or (in the case of proxies),
an instance of something that can be treated as an
instance of the class. Calling this method is
rarely the correct thing to do. In most cases, a
subclass can be substituted for a superclass, so
you should never need to check that an object is really
an instance of a specific class and not a subclass.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-isProxy">isProxy&nbsp;</a></h3>
- (BOOL) <b>isProxy</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns <code>YES</code> if the receiver is a
proxy, <code>NO</code> otherwise. The default
implementation of this method in NSObject
returns <code>NO</code>, while the implementation
in NSProxy returns <code>YES</code>.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-performSelector$">performSelector:&nbsp;</a></h3>
- (id) <b>performSelector:</b> (SEL)aSelector;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Performs the specified selector. The selector must
correspond to a method that takes no arguments.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-performSelector$withObject$">performSelector:&nbsp;withObject:&nbsp;</a></h3>
- (id) <b>performSelector:</b> (SEL)aSelector<b> withObject:</b> (id)anObject;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Performs the specified selector, with the object
as the argument. This method does not perform any
automatic unboxing, so the selector must
correspond to a method that takes one object
argument.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-performSelector$withObject$withObject$">performSelector:&nbsp;withObject:&nbsp;withObject:&nbsp;</a></h3>
- (id) <b>performSelector:</b> (SEL)aSelector<b> withObject:</b> (id)object1<b> withObject:</b> (id)object2;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Performs the specified selector, with the objects
as the arguments. This method does not perform any
automatic unboxing, so the selector must
correspond to a method that takes two object
arguments.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-release">release&nbsp;</a></h3>
- (oneway void) <b>release</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Decrements the reference count of the object and
destroys if it there are no remaining references.
In garbage collected mode, this method does nothing. In
automated reference counting mode, you may
neither implement this method nor call it directly.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-respondsToSelector$">respondsToSelector:&nbsp;</a></h3>
- (BOOL) <b>respondsToSelector:</b> (SEL)aSelector;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns <code>YES</code> if the object can respond
to messages with the specified selector. The default
implementation in NSObject returns
<code>YES</code> if the receiver has a method
corresponding to the method, but other
classes may return <code>YES</code> if they can
respond to a selector using one of the various
forwarding mechanisms.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-retain">retain&nbsp;</a></h3>
- (id) <b>retain</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Increments the reference count of the object and
returns the receiver. In garbage collected mode,
this method does nothing. In automated reference
counting mode, you may neither implement this
method nor call it directly.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-retainCount">retainCount&nbsp;</a></h3>
- (<a rel="gsdoc" href="TypesAndConstants.html#type$NSUInteger">NSUInteger</a>) <b>retainCount</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the current retain count of an object. This
does not include the result of any pending autorelease
operations. Code that relies on this method
returning a sane value is broken. For singletons,
it may return NSUIntegerMax. Even when it is tracking a
retain count, it will not include on-stack pointers
in manual retain/release mode, pointers marked as
__unsafe_unretain or __weak in ARC mode,
or pending autorelease operations. Its value is
therefore largely meaningless. It can
occasionally be useful for debugging.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-self">self&nbsp;</a></h3>
- (id) <b>self</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the receiver. In a proxy, this may (but is
not required to) return the proxied object.

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-superclass">superclass&nbsp;</a></h3>
- (Class) <b>superclass</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the superclass of receiver&apos;s class. If the
receiver is a proxy, then this may return the
class of the proxy target. Use
<a rel="gsdoc" href="#method$(NSObject)-isProxy">
-isProxy
</a>

to determine whether the receiver is a proxy. If you
wish to find the real superclass of the receiver&apos;s
class, ignoring proxies, then use
class_getSuperclass(object_getClass()).

</div>
<hr width="25%" align="left" />
</div>
<div class="method">
<h3><a name="method$(NSObject)-zone">zone&nbsp;</a></h3>
- (<a rel="gsdoc" href="TypesAndConstants.html#type$NSZone">NSZone</a>*) <b>zone</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

Returns the zone of the object.

</div>
<hr width="25%" align="left" />
</div>

<h1><a name="010000000000">
Software documentation for the NSSecureCoding protocol
</a></h1>
<h2><a name="protocol$(NSSecureCoding)">NSSecureCoding</a></h2>
<blockquote class="declared">
<dl>
<dt><b>Declared in:</b></dt>
<dd>Foundation/NSObject.h</dd>
</dl>
</blockquote>
<blockquote>
<dl>
<dt><b>Conforms to:</b></dt>
<dd><a rel="gsdoc" href="#protocol$(NSCoding)">NSCoding</a></dd>
</dl>
</blockquote>
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

<em>Description forthcoming.</em>

</div>
<b>Method summary</b>
<ul>
<li><a rel="gsdoc" href="NSObject.html#method$(NSSecureCoding)+supportsSecureCoding">+supportsSecureCoding</a></li>
</ul>
<hr width="50%" align="left" />
<div class="method">
<h3><a name="method$(NSSecureCoding)+supportsSecureCoding">supportsSecureCoding&nbsp;</a></h3>
+ (BOOL) <b>supportsSecureCoding</b>;<br />
<div class="availability">
<b>Availability:</b> OpenStep</div>
<br />
<div class="desc">

<em>Description forthcoming.</em>

</div>
<hr width="25%" align="left" />
</div>
<br />
<a href="Base.html">Up</a>
</font>
</body>
</html>