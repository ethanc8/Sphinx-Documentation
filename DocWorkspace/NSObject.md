[Up](Base.html)  

<span id="title$NSObject">NSObject class reference</span>
=========================================================

### Authors

Andrew Kachites McCallum ([`mccallum@gnu.ai.mit.edu`](mailto:mccallum@gnu.ai.mit.edu))  

**Copyright:** (C) 1995, 1996, 1998 Free Software Foundation, Inc.

------------------------------------------------------------------------

### Contents -

1.  [Software documentation for the NSObject class](#001000000000)
2.  [Software documentation for the NSObject(GNUstep)
    category](#002000000000)
3.  [Software documentation for the NSObject(NEXTSTEP)
    category](#003000000000)
4.  [Software documentation for the NSObject(TimedPerformers) informal
    protocol](#004000000000)
5.  [Software documentation for the NSCoding protocol](#005000000000)
6.  [Software documentation for the NSCopying protocol](#006000000000)
7.  [Software documentation for the NSDiscardableContent
    protocol](#007000000000)
8.  [Software documentation for the NSMutableCopying
    protocol](#008000000000)
9.  [Software documentation for the NSObject protocol](#009000000000)
10. [Software documentation for the NSSecureCoding
    protocol](#010000000000)

------------------------------------------------------------------------

<span id="001000000000">Software documentation for the NSObject class</span>
============================================================================

<span id="class$NSObject">NSObject</span>
-----------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

> **Conforms to:**  
> [NSObject](#protocol$(NSObject))

**Availability:** OpenStep

  

`NSObject` is the root class (a root class is a class with no
superclass) of the GNUstep base library class hierarchy, so all classes
normally inherit from `NSObject`. There is an exception though:
`NSProxy` (which is used for remote messaging) does not inherit from
`NSObject`.

Unless you are really sure of what you are doing, all your own classes
should inherit (directly or indirectly) from `NSObject` (or in special
cases from `NSProxy`). `NSObject` provides the basic common
functionality shared by all GNUstep classes and objects.

The essential methods which must be implemented by all classes for their
instances to be usable within GNUstep are declared in a separate
protocol, which is the `NSObject` protocol. Both `NSObject` and
`NSProxy` conform to this protocol, which means all objects in a GNUstep
application will conform to this protocol (btw, if you don't find a
method of `NSObject` you are looking for in this documentation, make
sure you also look into the documentation for the `NSObject` protocol).

Theoretically, in special cases you might need to implement a new root
class. If you do, you need to make sure that your root class conforms
(at least) to the `NSObject` protocol, otherwise it will not interact
correctly with the GNUstep framework. Said that, I must note that I have
never seen a case in which a new root class is needed.

`NSObject` is a root class, which implies that instance methods of
`NSObject` are treated in a special way by the Objective-C runtime. This
is an exception to the normal way messaging works with class and
instance methods: if the Objective-C runtime can't find a class method
for a class object, as a last resort it looks for an instance method of
the root class with the same name, and executes it if it finds it. This
means that instance methods of the root class (such as `NSObject`) can
be performed by class objects which inherit from that root class ! This
can only happen if the class doesn't have a class method with the same
name, otherwise that method - of course - takes the precedence. Because
of this exception, `NSObject` 's instance methods are written in such a
way that they work both on `NSObject` 's instances and on class objects.

------------------------------------------------------------------------

[Instance Variables](#_NSObject_ivars)  
  
**Method summary**

-   [+enableDoubleReleaseCheck:](NSObject.html#method$NSObject(GNUstep)+enableDoubleReleaseCheck$)
-   [+shouldCreateTraceableLocks:](NSLock.html#method$NSObject(GSTraceLocks)+shouldCreateTraceableLocks$)
-   [+tracedCondition](NSLock.html#method$NSObject(GSTraceLocks)+tracedCondition)
-   [+tracedConditionLockWithCondition:](NSLock.html#method$NSObject(GSTraceLocks)+tracedConditionLockWithCondition$)
-   [+tracedLock](NSLock.html#method$NSObject(GSTraceLocks)+tracedLock)
-   [+tracedRecursiveLock](NSLock.html#method$NSObject(GSTraceLocks)+tracedRecursiveLock)
-   [-error:,...](NSObject.html#method$NSObject(NEXTSTEP)-error$,...)
-   [-attributeKeys](NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-attributeKeys)
-   [-classDescription](NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-classDescription)
-   [-inverseForRelationshipKey:](NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-inverseForRelationshipKey$)
-   [-toManyRelationshipKeys](NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-toManyRelationshipKeys)
-   [-toOneRelationshipKeys](NSClassDescription.html#method$NSObject(NSClassDescriptionPrimitives)-toOneRelationshipKeys)
-   [-authenticateComponents:withData:](NSConnection.html#method$NSObject(NSConnectionDelegate)-authenticateComponents$withData$)
-   [-authenticationDataForComponents:](NSConnection.html#method$NSObject(NSConnectionDelegate)-authenticationDataForComponents$)
-   [-connection:didConnect:](NSConnection.html#method$NSObject(NSConnectionDelegate)-connection$didConnect$)
-   [-connection:shouldMakeNewConnection:](NSConnection.html#method$NSObject(NSConnectionDelegate)-connection$shouldMakeNewConnection$)
-   [-makeNewConnection:sender:](NSConnection.html#method$NSObject(NSConnectionDelegate)-makeNewConnection$sender$)
-   [-fileManager:shouldCopyItemAtPath:toPath:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldCopyItemAtPath$toPath$)
-   [-fileManager:shouldCopyItemAtURL:toURL:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldCopyItemAtURL$toURL$)
-   [-fileManager:shouldLinkItemAtPath:toPath:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldLinkItemAtPath$toPath$)
-   [-fileManager:shouldLinkItemAtURL:toURL:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldLinkItemAtURL$toURL$)
-   [-fileManager:shouldMoveItemAtPath:toPath:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldMoveItemAtPath$toPath$)
-   [-fileManager:shouldMoveItemAtURL:toURL:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldMoveItemAtURL$toURL$)
-   [-fileManager:shouldProceedAfterError:copyingItemAtPath:toPath:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$copyingItemAtPath$toPath$)
-   [-fileManager:shouldProceedAfterError:copyingItemAtURL:toURL:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$copyingItemAtURL$toURL$)
-   [-fileManager:shouldProceedAfterError:linkingItemAtPath:toPath:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$linkingItemAtPath$toPath$)
-   [-fileManager:shouldProceedAfterError:linkingItemAtURL:toURL:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$linkingItemAtURL$toURL$)
-   [-fileManager:shouldProceedAfterError:movingItemAtPath:toPath:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$movingItemAtPath$toPath$)
-   [-fileManager:shouldProceedAfterError:movingItemAtURL:toURL:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$movingItemAtURL$toURL$)
-   [-fileManager:shouldProceedAfterError:removingItemAtPath:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$removingItemAtPath$)
-   [-fileManager:shouldProceedAfterError:removingItemAtURL:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldProceedAfterError$removingItemAtURL$)
-   [-fileManager:shouldRemoveItemAtPath:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldRemoveItemAtPath$)
-   [-fileManager:shouldRemoveItemAtURL:](NSFileManager.html#method$NSObject(NSFileManagerDelegate)-fileManager$shouldRemoveItemAtURL$)
-   [-fileManager:shouldProceedAfterError:](NSFileManager.html#method$NSObject(NSFileManagerHandler)-fileManager$shouldProceedAfterError$)
-   [-fileManager:willProcessPath:](NSFileManager.html#method$NSObject(NSFileManagerHandler)-fileManager$willProcessPath$)
-   [+accessInstanceVariablesDirectly](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)+accessInstanceVariablesDirectly)
-   [+useStoredAccessor](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)+useStoredAccessor)
-   [-dictionaryWithValuesForKeys:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-dictionaryWithValuesForKeys$)
-   [-handleQueryWithUnboundKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-handleQueryWithUnboundKey$)
-   [-handleTakeValue:forUnboundKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-handleTakeValue$forUnboundKey$)
-   [-mutableArrayValueForKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-mutableArrayValueForKey$)
-   [-mutableArrayValueForKeyPath:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-mutableArrayValueForKeyPath$)
-   [-mutableSetValueForKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-mutableSetValueForKey$)
-   [-mutableSetValueForKeyPath:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-mutableSetValueForKeyPath$)
-   [-setNilValueForKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setNilValueForKey$)
-   [-setValue:forKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setValue$forKey$)
-   [-setValue:forKeyPath:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setValue$forKeyPath$)
-   [-setValue:forUndefinedKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setValue$forUndefinedKey$)
-   [-setValuesForKeysWithDictionary:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-setValuesForKeysWithDictionary$)
-   [-storedValueForKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-storedValueForKey$)
-   [-takeStoredValue:forKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeStoredValue$forKey$)
-   [-takeStoredValuesFromDictionary:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeStoredValuesFromDictionary$)
-   [-takeValue:forKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeValue$forKey$)
-   [-takeValue:forKeyPath:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeValue$forKeyPath$)
-   [-takeValuesFromDictionary:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-takeValuesFromDictionary$)
-   [-unableToSetNilForKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-unableToSetNilForKey$)
-   [-validateValue:forKey:error:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-validateValue$forKey$error$)
-   [-validateValue:forKeyPath:error:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-validateValue$forKeyPath$error$)
-   [-valueForKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-valueForKey$)
-   [-valueForKeyPath:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-valueForKeyPath$)
-   [-valueForUndefinedKey:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-valueForUndefinedKey$)
-   [-valuesForKeys:](NSKeyValueCoding.html#method$NSObject(NSKeyValueCoding)-valuesForKeys$)
-   [-didChange:valuesAtIndexes:forKey:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-didChange$valuesAtIndexes$forKey$)
-   [-didChangeValueForKey:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-didChangeValueForKey$)
-   [-didChangeValueForKey:withSetMutation:usingObjects:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-didChangeValueForKey$withSetMutation$usingObjects$)
-   [-willChange:valuesAtIndexes:forKey:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-willChange$valuesAtIndexes$forKey$)
-   [-willChangeValueForKey:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-willChangeValueForKey$)
-   [-willChangeValueForKey:withSetMutation:usingObjects:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverNotification)-willChangeValueForKey$withSetMutation$usingObjects$)
-   [-addObserver:forKeyPath:options:context:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverRegistration)-addObserver$forKeyPath$options$context$)
-   [-removeObserver:forKeyPath:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObserverRegistration)-removeObserver$forKeyPath$)
-   [-observeValueForKeyPath:ofObject:change:context:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObserving)-observeValueForKeyPath$ofObject$change$context$)
-   [+automaticallyNotifiesObserversForKey:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)+automaticallyNotifiesObserversForKey$)
-   [+keyPathsForValuesAffectingValueForKey:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)+keyPathsForValuesAffectingValueForKey$)
-   [+setKeys:triggerChangeNotificationsForDependentKey:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)+setKeys$triggerChangeNotificationsForDependentKey$)
-   [-observationInfo](NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)-observationInfo)
-   [-setObservationInfo:](NSKeyValueObserving.html#method$NSObject(NSKeyValueObservingCustomization)-setObservationInfo$)
-   [-archiver:didEncodeObject:](NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiver$didEncodeObject$)
-   [-archiver:willEncodeObject:](NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiver$willEncodeObject$)
-   [-archiver:willReplaceObject:withObject:](NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiver$willReplaceObject$withObject$)
-   [-archiverDidFinish:](NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiverDidFinish$)
-   [-archiverWillFinish:](NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverDelegate)-archiverWillFinish$)
-   [-classForKeyedArchiver](NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverObjectSubstitution)-classForKeyedArchiver)
-   [-replacementObjectForKeyedArchiver:](NSKeyedArchiver.html#method$NSObject(NSKeyedArchiverObjectSubstitution)-replacementObjectForKeyedArchiver$)
-   [-unarchiver:cannotDecodeObjectOfClassName:originalClasses:](NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiver$cannotDecodeObjectOfClassName$originalClasses$)
-   [-unarchiver:didDecodeObject:](NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiver$didDecodeObject$)
-   [-unarchiver:willReplaceObject:withObject:](NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiver$willReplaceObject$withObject$)
-   [-unarchiverDidFinish:](NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiverDidFinish$)
-   [-unarchiverWillFinish:](NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverDelegate)-unarchiverWillFinish$)
-   [+classForKeyedUnarchiver](NSKeyedArchiver.html#method$NSObject(NSKeyedUnarchiverObjectSubstitution)+classForKeyedUnarchiver)
-   [-netServiceBrowser:didFindDomain:moreComing:](NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didFindDomain$moreComing$)
-   [-netServiceBrowser:didFindService:moreComing:](NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didFindService$moreComing$)
-   [-netServiceBrowser:didNotSearch:](NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didNotSearch$)
-   [-netServiceBrowser:didRemoveDomain:moreComing:](NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didRemoveDomain$moreComing$)
-   [-netServiceBrowser:didRemoveService:moreComing:](NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowser$didRemoveService$moreComing$)
-   [-netServiceBrowserDidStopSearch:](NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowserDidStopSearch$)
-   [-netServiceBrowserWillSearch:](NSNetServices.html#method$NSObject(NSNetServiceBrowserDelegateMethods)-netServiceBrowserWillSearch$)
-   [-netService:didAcceptConnectionWithInputStream:outputStream:](NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netService$didAcceptConnectionWithInputStream$outputStream$)
-   [-netService:didNotPublish:](NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netService$didNotPublish$)
-   [-netService:didNotResolve:](NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netService$didNotResolve$)
-   [-netService:didUpdateTXTRecordData:](NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netService$didUpdateTXTRecordData$)
-   [-netServiceDidPublish:](NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceDidPublish$)
-   [-netServiceDidResolveAddress:](NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceDidResolveAddress$)
-   [-netServiceDidStop:](NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceDidStop$)
-   [-netServiceWillPublish:](NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceWillPublish$)
-   [-netServiceWillResolve:](NSNetServices.html#method$NSObject(NSNetServiceDelegateMethods)-netServiceWillResolve$)
-   [-classForPortCoder](NSPortCoder.html#method$NSObject(NSPortCoder)-classForPortCoder)
-   [-replacementObjectForPortCoder:](NSPortCoder.html#method$NSObject(NSPortCoder)-replacementObjectForPortCoder$)
-   [-handlePortMessage:](NSPort.html#method$NSObject(NSPortDelegateMethods)-handlePortMessage$)
-   [-stream:handleEvent:](NSStream.html#method$NSObject(NSStreamDelegate)-stream$handleEvent$)
-   [-performSelector:onThread:withObject:waitUntilDone:](NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelector$onThread$withObject$waitUntilDone$)
-   [-performSelector:onThread:withObject:waitUntilDone:modes:](NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelector$onThread$withObject$waitUntilDone$modes$)
-   [-performSelectorInBackground:withObject:](NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelectorInBackground$withObject$)
-   [-performSelectorOnMainThread:withObject:waitUntilDone:](NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelectorOnMainThread$withObject$waitUntilDone$)
-   [-performSelectorOnMainThread:withObject:waitUntilDone:modes:](NSThread.html#method$NSObject(NSThreadPerformAdditions)-performSelectorOnMainThread$withObject$waitUntilDone$modes$)
-   [-URL:resourceDataDidBecomeAvailable:](NSURL.html#method$NSObject(NSURLClient)-URL$resourceDataDidBecomeAvailable$)
-   [-URL:resourceDidFailLoadingWithReason:](NSURL.html#method$NSObject(NSURLClient)-URL$resourceDidFailLoadingWithReason$)
-   [-URLResourceDidCancelLoading:](NSURL.html#method$NSObject(NSURLClient)-URLResourceDidCancelLoading$)
-   [-URLResourceDidFinishLoading:](NSURL.html#method$NSObject(NSURLClient)-URLResourceDidFinishLoading$)
-   [-connection:didFailWithError:](NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$didFailWithError$)
-   [-connection:didReceiveAuthenticationChallenge:](NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$didReceiveAuthenticationChallenge$)
-   [-connection:didReceiveData:](NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$didReceiveData$)
-   [-connection:didReceiveResponse:](NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$didReceiveResponse$)
-   [-connection:willCacheResponse:](NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$willCacheResponse$)
-   [-connection:willSendRequest:redirectResponse:](NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connection$willSendRequest$redirectResponse$)
-   [-connectionDidFinishLoading:](NSURLConnection.html#method$NSObject(NSURLConnectionDelegate)-connectionDidFinishLoading$)
-   [-download:decideDestinationWithSuggestedFilename:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$decideDestinationWithSuggestedFilename$)
-   [-download:didCancelAuthenticationChallenge:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didCancelAuthenticationChallenge$)
-   [-download:didCreateDestination:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didCreateDestination$)
-   [-download:didFailWithError:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didFailWithError$)
-   [-download:didReceiveAuthenticationChallenge:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didReceiveAuthenticationChallenge$)
-   [-download:didReceiveDataOfLength:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didReceiveDataOfLength$)
-   [-download:didReceiveResponse:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$didReceiveResponse$)
-   [-download:shouldDecodeSourceDataOfMIMEType:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$shouldDecodeSourceDataOfMIMEType$)
-   [-download:willResumeWithResponse:fromByte:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$willResumeWithResponse$fromByte$)
-   [-download:willSendRequest:redirectResponse:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-download$willSendRequest$redirectResponse$)
-   [-downloadDidFinish:](NSURLDownload.html#method$NSObject(NSURLDownloadDelegate)-downloadDidFinish$)
-   [-parser:didEndElement:namespaceURI:qualifiedName:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$didEndElement$namespaceURI$qualifiedName$)
-   [-parser:didEndMappingPrefix:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$didEndMappingPrefix$)
-   [-parser:didStartElement:namespaceURI:qualifiedName:attributes:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$didStartElement$namespaceURI$qualifiedName$attributes$)
-   [-parser:didStartMappingPrefix:toURI:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$didStartMappingPrefix$toURI$)
-   [-parser:foundAttributeDeclarationWithName:forElement:type:defaultValue:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundAttributeDeclarationWithName$forElement$type$defaultValue$)
-   [-parser:foundCDATA:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundCDATA$)
-   [-parser:foundCharacters:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundCharacters$)
-   [-parser:foundComment:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundComment$)
-   [-parser:foundElementDeclarationWithName:model:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundElementDeclarationWithName$model$)
-   [-parser:foundExternalEntityDeclarationWithName:publicID:systemID:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundExternalEntityDeclarationWithName$publicID$systemID$)
-   [-parser:foundIgnorableWhitespace:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundIgnorableWhitespace$)
-   [-parser:foundInternalEntityDeclarationWithName:value:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundInternalEntityDeclarationWithName$value$)
-   [-parser:foundNotationDeclarationWithName:publicID:systemID:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundNotationDeclarationWithName$publicID$systemID$)
-   [-parser:foundProcessingInstructionWithTarget:data:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundProcessingInstructionWithTarget$data$)
-   [-parser:foundUnparsedEntityDeclarationWithName:publicID:systemID:notationName:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$foundUnparsedEntityDeclarationWithName$publicID$systemID$notationName$)
-   [-parser:parseErrorOccurred:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$parseErrorOccurred$)
-   [-parser:resolveExternalEntityName:systemID:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$resolveExternalEntityName$systemID$)
-   [-parser:validationErrorOccurred:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parser$validationErrorOccurred$)
-   [-parserDidEndDocument:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parserDidEndDocument$)
-   [-parserDidStartDocument:](NSXMLParser.html#method$NSObject(NSXMLParserDelegateEventAdditions)-parserDidStartDocument$)
-   [-runLoopShouldBlock:](NSRunLoop.html#method$NSObject(RunLoopEvents)-runLoopShouldBlock$)
-   [+cancelPreviousPerformRequestsWithTarget:](NSObject.html#method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$)
-   [+cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject.html#method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$selector$object$)
-   [-performSelector:withObject:afterDelay:](NSObject.html#method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$)
-   [-performSelector:withObject:afterDelay:inModes:](NSObject.html#method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$inModes$)
-   [+alloc](NSObject.html#method$NSObject+alloc)
-   [+allocWithZone:](NSObject.html#method$NSObject+allocWithZone$)
-   [+class](NSObject.html#method$NSObject+class)
-   [+initialize](NSObject.html#method$NSObject+initialize)
-   [+instanceMethodForSelector:](NSObject.html#method$NSObject+instanceMethodForSelector$)
-   [+instanceMethodSignatureForSelector:](NSObject.html#method$NSObject+instanceMethodSignatureForSelector$)
-   [+instancesRespondToSelector:](NSObject.html#method$NSObject+instancesRespondToSelector$)
-   [+isSubclassOfClass:](NSObject.html#method$NSObject+isSubclassOfClass$)
-   [+load](NSObject.html#method$NSObject+load)
-   [+new](NSObject.html#method$NSObject+new)
-   [+poseAsClass:](NSObject.html#method$NSObject+poseAsClass$)
-   [+resolveClassMethod:](NSObject.html#method$NSObject+resolveClassMethod$)
-   [+resolveInstanceMethod:](NSObject.html#method$NSObject+resolveInstanceMethod$)
-   [+setVersion:](NSObject.html#method$NSObject+setVersion$)
-   [+version](NSObject.html#method$NSObject+version)
-   [-autoContentAccessingProxy](NSObject.html#method$NSObject-autoContentAccessingProxy)
-   [-awakeAfterUsingCoder:](NSObject.html#method$NSObject-awakeAfterUsingCoder$)
-   [-classForArchiver](NSObject.html#method$NSObject-classForArchiver)
-   [-classForCoder](NSObject.html#method$NSObject-classForCoder)
-   [-className](NSObject.html#method$NSObject-className)
-   [-copy](NSObject.html#method$NSObject-copy)
-   [-dealloc](NSObject.html#method$NSObject-dealloc)
-   [-doesNotRecognizeSelector:](NSObject.html#method$NSObject-doesNotRecognizeSelector$)
-   [-finalize](NSObject.html#method$NSObject-finalize)
-   [-forwardInvocation:](NSObject.html#method$NSObject-forwardInvocation$)
-   [-forwardingTargetForSelector:](NSObject.html#method$NSObject-forwardingTargetForSelector$)
-   [-init](NSObject.html#method$NSObject-init)
-   [-methodForSelector:](NSObject.html#method$NSObject-methodForSelector$)
-   [-methodSignatureForSelector:](NSObject.html#method$NSObject-methodSignatureForSelector$)
-   [-mutableCopy](NSObject.html#method$NSObject-mutableCopy)
-   [-replacementObjectForArchiver:](NSObject.html#method$NSObject-replacementObjectForArchiver$)
-   [-replacementObjectForCoder:](NSObject.html#method$NSObject-replacementObjectForCoder$)
-   [-superclass](NSObject.html#method$NSObject-superclass)

------------------------------------------------------------------------

### <span id="method$NSObject+alloc">alloc </span>

\+ (id) **alloc**;  

**Availability:** OpenStep

  

Allocates a new instance of the receiver from the default zone, by
invoking [+allocWithZone:](#method$NSObject+allocWithZone$) with
`                                NSDefaultMallocZone()                             `
as the zone argument.  
Returns the created instance.

------------------------------------------------------------------------

### <span id="method$NSObject+allocWithZone$">allocWithZone: </span>

\+ (id) **allocWithZone:**
([NSZone](TypesAndConstants.html#type$NSZone)\*)z;  

**Availability:** OpenStep

  

This is the basic method to create a new instance. It allocates a new
instance of the receiver from the specified memory zone.

Memory for an instance of the receiver is allocated; a pointer to this
newly created instance is returned. All instance variables are set to 0.
No initialization of the instance is performed apart from setup to be an
instance of the correct class: it is your responsibility to initialize
the instance by calling an appropriate `init` method. If you are not
using the garbage collector, it is also your responsibility to make sure
the returned instance is destroyed when you finish using it, by calling
the `release` method to destroy the instance directly, or by using
`autorelease` and autorelease pools.

You do not normally need to override this method in subclasses, unless
you are implementing a class which for some reasons silently allocates
instances of another class (this is typically needed to implement class
clusters and similar design schemes).

If you have turned on debugging of object allocation (by calling the
`GSDebugAllocationActive` function), this method will also update the
various debugging counts and monitors of allocated objects, which you
can access using the `GSDebugAllocation...` functions.

------------------------------------------------------------------------

### <span id="method$NSObject+class">class </span>

\+ (Class) **class**;  

**Availability:** OpenStep

  

Returns the receiver.

------------------------------------------------------------------------

### <span id="method$NSObject+initialize">initialize </span>

\+ (void) **initialize**;  

**Availability:** OpenStep

  

This message is automatically sent to a class by the runtime. It is sent
once for each class, just before the class is used for the first time
(excluding any automatic call to [+load](#method$NSObject+load) by the
runtime).  
The message is sent in a thread-safe manner... other threads may not
call methods of the class until
[+initialize](#method$NSObject+initialize) has finished executing.  
If the class has a superclass, its implementation of
[+initialize](#method$NSObject+initialize) is called first.  
If the class does not implement
[+initialize](#method$NSObject+initialize) then the implementation in
the closest superclass may be called. This means that
[+initialize](#method$NSObject+initialize) may be called more than once,
and the recommended way to handle this by using the
`if (self == [classname class])` conditional to check whether the method
is being called for a subclass.  
You should never call [+initialize](#method$NSObject+initialize)
yourself... let the runtime do it.  
You can implement [+initialize](#method$NSObject+initialize) in your own
class if you need to. NSObject's implementation handles essential root
object and base library initialization.  
It should be safe to call \[super initialize\] in your implementation of
[+initialize](#method$NSObject+initialize) .

------------------------------------------------------------------------

### <span id="method$NSObject+instanceMethodForSelector$">instanceMethodForSelector: </span>

\+ (IMP) **instanceMethodForSelector:** (SEL)aSelector;  

**Availability:** OpenStep

  

Returns a pointer to the C function implementing the method used to
respond to messages with `aSelector` by instances of the receiving
class.  
Raises NSInvalidArgumentException if given a null selector.

------------------------------------------------------------------------

### <span id="method$NSObject+instanceMethodSignatureForSelector$">instanceMethodSignatureForSelector: </span>

\+
([NSMethodSignature](NSMethodSignature.html#class$NSMethodSignature)\*)
**instanceMethodSignatureForSelector:** (SEL)aSelector;  

**Availability:** OpenStep

  

Returns a pointer to the C function implementing the method used to
respond to messages with `aSelector` which are sent to instances of the
receiving class.  
Raises NSInvalidArgumentException if given a null selector.

------------------------------------------------------------------------

### <span id="method$NSObject+instancesRespondToSelector$">instancesRespondToSelector: </span>

\+ (BOOL) **instancesRespondToSelector:** (SEL)aSelector;  

**Availability:** OpenStep

  

Returns a flag to say if instances of the receiver class will respond to
the specified selector. This ignores situations where a subclass
implements [-forwardInvocation:](#method$NSObject-forwardInvocation$) to
respond to selectors not normally handled... in these cases the subclass
may override this method to handle it.  
If given a null selector, raises NSInvalidArgumentException when in
MacOS-X compatibility more, or returns `NO` otherwise.

------------------------------------------------------------------------

### <span id="method$NSObject+isSubclassOfClass$">isSubclassOfClass: </span>

\+ (BOOL) **isSubclassOfClass:** (Class)aClass;  

**Availability:** OpenStep

  

Returns `YES` if the receiver is `aClass` or a subclass of `aClass`.

------------------------------------------------------------------------

### <span id="method$NSObject+load">load </span>

\+ (void) **load**;  

**Availability:** OpenStep

  

This method is automatically invoked on any class which implements it
when the class is loaded into the runtime.  
It is also invoked on any category where the method is implemented when
that category is loaded into the runtime.  
The [+load](#method$NSObject+load) method is called directly by the
runtime and you should never send a [+load](#method$NSObject+load)
message to a class yourself.  
This method is called *before* the
[+initialize](#method$NSObject+initialize) message is sent to the class,
so you cannot depend on class initialisation having been performed, or
upon other classes existing (apart from superclasses of the receiver,
since [+load](#method$NSObject+load) is called on superclasses before it
is called on their subclasses).  
As a gross generalisation, it is safe to use C code, including most
ObjectiveC runtime functions within [+load](#method$NSObject+load) , but
attempting to send messages to ObjectiveC objects is likely to fail.  
In GNUstep, this method is implemented for NSObject to perform some
initialisation for the base library.  
If you implement [+load](#method$NSObject+load) for a class, don't call
\[super load\] in your implementation.

------------------------------------------------------------------------

### <span id="method$NSObject+new">new </span>

\+ (id) **new**;  

**Availability:** OpenStep

  

This method is a short-hand for alloc followed by init, that is,

`NSObject *object = [NSObject new];`

is exactly the same as

`                 NSObject *object = [[NSObject alloc] init];               `

This is a general convention: all `new...` methods are supposed to
return a newly allocated and initialized instance, as would be generated
by an `alloc` method followed by a corresponding `init...` method.
Please note that if you are not using a garbage collector, this means
that instances generated by the `new...` methods are not autoreleased,
that is, you are responsible for releasing (autoreleasing) the instances
yourself. So when you use `new` you typically do something like:

`                 NSMutableArray *array = AUTORELEASE                 ([NSMutableArray new]);               `

You do not normally need to override `new` in subclasses, because if you
override `init` (and optionally `allocWithZone:` if you really need),
`new` will automatically use your subclass methods.

You might need instead to define new `new...` methods specific to your
subclass to match any `init...` specific to your subclass. For example,
if your subclass defines an instance method

`initWithName:`

it might be handy for you to have a class method

`newWithName:`

which combines `alloc` and `initWithName:`. You would implement it as
follows:

`                 + (id) newWithName: (NSString                 *)aName {return [[self alloc] initWithName:                 aName];}               `

------------------------------------------------------------------------

### <span id="method$NSObject+poseAsClass$">poseAsClass: </span>

\+ (void) **poseAsClass:** (Class)aClassObject;  

**Availability:** OpenStep

  

Sets up the ObjC runtime so that the receiver is used wherever code
calls for `aClassObject` to be used.

------------------------------------------------------------------------

### <span id="method$NSObject+resolveClassMethod$">resolveClassMethod: </span>

\+ (BOOL) **resolveClassMethod:** (SEL)name;  

**Availability:** MacOS-X 10.5.0

  

This method will be called when attempting to send a message a class
that does not understand it. The class may install a new method for the
given selector and return `YES`, otherwise it should return `NO`. Note:
This method is only reliable when using the GNUstep runtime. If you
require compatibility with the GCC runtime, you must also implement
[-forwardInvocation:](#method$NSObject-forwardInvocation$) with
equivalent semantics. This will be considerably slower, but more
portable.

------------------------------------------------------------------------

### <span id="method$NSObject+resolveInstanceMethod$">resolveInstanceMethod: </span>

\+ (BOOL) **resolveInstanceMethod:** (SEL)name;  

**Availability:** MacOS-X 10.5.0

  

This method will be called when attempting to send a message an instance
that does not understand it. The class may install a new method for the
given selector and return `YES`, otherwise it should return `NO`. Note:
This method is only reliable when using the GNUstep runtime. If you
require compatibility with the GCC runtime, you must also implement
[-forwardInvocation:](#method$NSObject-forwardInvocation$) with
equivalent semantics. This will be considerably slower, but more
portable.

------------------------------------------------------------------------

### <span id="method$NSObject+setVersion$">setVersion: </span>

\+ (id) **setVersion:**
([NSInteger](TypesAndConstants.html#type$NSInteger))aVersion;  

**Availability:** OpenStep

  

Sets the version number of the receiving class. Should be nonnegative.

------------------------------------------------------------------------

### <span id="method$NSObject+version">version </span>

\+ ([NSInteger](TypesAndConstants.html#type$NSInteger)) **version**;  

**Availability:** OpenStep

  

Returns the version number of the receiving class. This will default to
a number assigned by the Objective C compiler if \[NSObject
-setVersion\] has not been called.

------------------------------------------------------------------------

### <span id="method$NSObject-autoContentAccessingProxy">autoContentAccessingProxy </span>

\- (id) **autoContentAccessingProxy**;  

**Availability:** MacOS-X 10.6.0

  

Returns an auto-accessing proxy for the given object. This proxy sends a
[-beginContentAccess](#method$(NSDiscardableContent)-beginContentAccess)
message to the receiver when it is created and an
[-endContentAccess](#method$(NSDiscardableContent)-endContentAccess)
message when it is destroyed. This prevents an object that implements
the NSDiscardableContent protocol from having its contents discarded for
as **long** as the proxy exists. On systems using the GNUstep runtime,
messages send to the proxy will be slightly slower than direct messages.
With the GCC runtime, they will be approximately two orders of magnitude
slower. The GNUstep runtime, therefore, is strongly recommended for code
calling this method.

------------------------------------------------------------------------

### <span id="method$NSObject-awakeAfterUsingCoder$">awakeAfterUsingCoder: </span>

\- (id) **awakeAfterUsingCoder:**
([NSCoder](NSCoder.html#class$NSCoder)\*)aDecoder;  

**Availability:** OpenStep

  

Called after the receiver has been created by decoding some sort of
archive. Returns self. Subclasses may override this to perform some
special initialisation upon being decoded.

------------------------------------------------------------------------

### <span id="method$NSObject-classForArchiver">classForArchiver </span>

\- (Class) **classForArchiver**;  

**Availability:** OpenStep

  

Override to substitute class when an instance is being archived by an
[NSArchiver](NSArchiver.html#class$NSArchiver) . Default implementation
returns [-classForCoder](#method$NSObject-classForCoder) .

------------------------------------------------------------------------

### <span id="method$NSObject-classForCoder">classForCoder </span>

\- (Class) **classForCoder**;  

**Availability:** OpenStep

  

Override to substitute class when an instance is being serialized by an
[NSCoder](NSCoder.html#class$NSCoder) . Default implementation returns
`[self class]` (no substitution).

------------------------------------------------------------------------

### <span id="method$NSObject-className">className </span>

\- ([NSString](NSString.html#class$NSString)\*) **className**;  

**Availability:** MacOS-X 10.0.0

  

Returns the name of the class of the receiving object by using the
[NSStringFromClass()](Functions.html#function$NSStringFromClass)
function.  
This is a MacOS-X addition for apple scripting, which is also generally
useful.

------------------------------------------------------------------------

### <span id="method$NSObject-copy">copy </span>

\- (id) **copy**;  

**Availability:** OpenStep

  

Creates and returns a copy of the receiver by calling
[-copyWithZone:](#method$(NSCopying)-copyWithZone$) passing
[NSDefaultMallocZone()](Functions.html#function$NSDefaultMallocZone)

------------------------------------------------------------------------

### <span id="method$NSObject-dealloc">dealloc </span>

\- (void) **dealloc**;  

**Availability:** OpenStep

  

Deallocates the receiver by calling
[NSDeallocateObject()](Functions.html#function$NSDeallocateObject) with
self as the argument.  

You should normally call the superclass implementation of this method
when you override it in a subclass, or the memory occupied by your
object will not be released.

`NSObject` 's implementation of this method destroys the receiver, by
returning the memory allocated to the receiver to the system. After this
method has been called on an instance, you must not refer the instance
in any way, because it does not exist any longer. If you do, it is a bug
and your program might even crash with a segmentation fault.

If you have turned on the debugging facilities for instance allocation,
`NSObject` 's implementation of this method will also update the various
counts and monitors of allocated instances (see the
`GSDebugAllocation...` functions for more info).

Normally you are supposed to manage the memory taken by objects by using
the high level interface provided by the `retain`, `release` and
`autorelease` methods (or better by the corresponding macros `RETAIN`,
`RELEASE` and `AUTORELEASE`), and by autorelease pools and such;
whenever the release/autorelease mechanism determines that an object is
no longer needed (which happens when its retain count reaches 0), it
will call the `dealloc` method to actually deallocate the object. This
means that normally, you should not need to call `dealloc` directly as
the gnustep base library automatically calls it for you when the retain
count of an object reaches 0.

Because the `dealloc` method will be called when an instance is being
destroyed, if instances of your subclass use objects or resources (as it
happens for most useful classes), you must override `dealloc` in
subclasses to release all objects and resources which are used by the
instance, otherwise these objects and resources would be leaked. In the
subclass implementation, you should first release all your subclass
specific objects and resources, and then invoke super's implementation
(which will do the same, and so on up in the class hierarchy to
`NSObject` 's implementation, which finally destroys the object). Here
is an example of the implementation of `dealloc` for a subclass whose
instances have a single instance variable `name` which needs to be
released when an instance is deallocated:

`                 - (void) dealloc {RELEASE (name);                 [super dealloc];}               `

`dealloc` might contain code to release not only objects, but also other
resources, such as open files, network connections, raw memory allocated
in other ways, etc.

If you have allocated the memory using a non-standard mechanism, you
will not call the superclass (NSObject) implementation of the method as
you will need to handle the deallocation specially.  
In some circumstances, an object may wish to prevent itself from being
deallocated, it can do this simply be refraining from calling the
superclass implementation.

------------------------------------------------------------------------

### <span id="method$NSObject-doesNotRecognizeSelector$">doesNotRecognizeSelector: </span>

\- (void) **doesNotRecognizeSelector:** (SEL)aSelector;  

**Availability:** OpenStep

  

Raises an invalid argument exception providing information about the
receivers inability to handle `aSelector`.

------------------------------------------------------------------------

### <span id="method$NSObject-finalize">finalize </span>

\- (void) **finalize**;  

**Availability:** MacOS-X 10.5.0

  

On a system which performs garbage collection, you should implement this
method to execute code when the receiver is collected.  
You must not call this method yourself (except when a subclass calls the
superclass method within its own implementation).

------------------------------------------------------------------------

### <span id="method$NSObject-forwardInvocation$">forwardInvocation: </span>

\- (void) **forwardInvocation:**
([NSInvocation](NSInvocation.html#class$NSInvocation)\*)anInvocation;  

**Availability:** OpenStep

  

This method is called automatically to handle a message sent to the
receiver for which the receivers class has no method.  
The default implementation calls
[-doesNotRecognizeSelector:](#method$NSObject-doesNotRecognizeSelector$)

------------------------------------------------------------------------

### <span id="method$NSObject-forwardingTargetForSelector$">forwardingTargetForSelector: </span>

\- (id) **forwardingTargetForSelector:** (SEL)aSelector;  

**Availability:** MacOS-X 10.6.0

  

If an object does not understand a message, it may delegate it to
another object. Returning `nil` indicates that forwarding should not
take place. The default implementation of this returns `nil`, but care
should be taken when subclassing NSObject subclasses and overriding this
method that the superclass implementation is called if returning `nil`.
Note: This method is only reliable when using the GNUstep runtime and
code compiled with clang. If you require compatibility with GCC and the
GCC runtime, you must also implement
[-forwardInvocation:](#method$NSObject-forwardInvocation$) with
equivalent semantics. This will be considerably slower, but more
portable.

------------------------------------------------------------------------

### <span id="method$NSObject-init">init </span>

\- (id) **init**;  

**Availability:** OpenStep

  

Initialises the receiver... the NSObject implementation simply returns
self.

------------------------------------------------------------------------

### <span id="method$NSObject-methodForSelector$">methodForSelector: </span>

\- (IMP) **methodForSelector:** (SEL)aSelector;  

**Availability:** OpenStep

  

Returns a pointer to the C function implementing the method used to
respond to messages with `aSelector`.  
Raises NSInvalidArgumentException if given a null selector.

------------------------------------------------------------------------

### <span id="method$NSObject-methodSignatureForSelector$">methodSignatureForSelector: </span>

\-
([NSMethodSignature](NSMethodSignature.html#class$NSMethodSignature)\*)
**methodSignatureForSelector:** (SEL)aSelector;  

**Availability:** OpenStep

  

Returns the method signature describing how the receiver would handle a
message with `aSelector`.  
Returns `nil` if given a null selector.

------------------------------------------------------------------------

### <span id="method$NSObject-mutableCopy">mutableCopy </span>

\- (id) **mutableCopy**;  

**Availability:** OpenStep

  

Creates and returns a mutable copy of the receiver by calling
[-mutableCopyWithZone:](#method$(NSMutableCopying)-mutableCopyWithZone$)
passing
[NSDefaultMallocZone()](Functions.html#function$NSDefaultMallocZone) .

------------------------------------------------------------------------

### <span id="method$NSObject-replacementObjectForArchiver$">replacementObjectForArchiver: </span>

\- (id) **replacementObjectForArchiver:**
([NSArchiver](NSArchiver.html#class$NSArchiver)\*)anArchiver;  

**Availability:** OpenStep

  

Override to substitute another object for this instance when being
archived by given [NSArchiver](NSArchiver.html#class$NSArchiver) .
Default implementation returns
[-replacementObjectForCoder:](#method$NSObject-replacementObjectForCoder$)
.

------------------------------------------------------------------------

### <span id="method$NSObject-replacementObjectForCoder$">replacementObjectForCoder: </span>

\- (id) **replacementObjectForCoder:**
([NSCoder](NSCoder.html#class$NSCoder)\*)anEncoder;  

**Availability:** OpenStep

  

Override to substitute another object for this instance when being
serialized by given [NSCoder](NSCoder.html#class$NSCoder) . Default
implementation returns `self`.

------------------------------------------------------------------------

### <span id="method$NSObject-superclass">superclass </span>

\- (Class) **superclass**;  

**Availability:** OpenStep

  

Returns the super class from which the receivers class was derived.

------------------------------------------------------------------------

<span id="_NSObject_ivars"></span>  

------------------------------------------------------------------------

Instance Variables for NSObject Class
-------------------------------------

### <span id="ivariable$NSObject*isa">isa</span>

@protected Class **isa**;  

**Availability:** OpenStep

  

Points to instance's class. Used by runtime to access method
implementations, etc.. Set in [+alloc](#method$NSObject+alloc) , Unlike
other instance variables, which are cleared there.

------------------------------------------------------------------------

  

------------------------------------------------------------------------

  

<span id="002000000000">Software documentation for the NSObject(GNUstep) category</span>
========================================================================================

[NSObject](#class$NSObject)(<span id="category$NSObject(GNUstep)">GNUstep</span>)
---------------------------------------------------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

**Availability:** Not in OpenStep/MacOS-X, Base Likely to be
changed/moved/removed at 1.17.0

  

Some non-standard extensions mainly needed for backwards compatibility
and internal utility reasons.

**Method summary**

-   [+enableDoubleReleaseCheck:](NSObject.html#method$NSObject(GNUstep)+enableDoubleReleaseCheck$)

------------------------------------------------------------------------

### <span id="method$NSObject(GNUstep)+enableDoubleReleaseCheck$">enableDoubleReleaseCheck: </span>

\+ (void) **enableDoubleReleaseCheck:** (BOOL)enable;  

**Availability:** Not in OpenStep/MacOS-X, Base Likely to be
changed/moved/removed at 1.17.0

  

Enables runtime checking of retain/release/autorelease operations.  

Whenever either [-autorelease](#method$(NSObject)-autorelease) or
[-release](#method$(NSObject)-release) is called, the contents of any
autorelease pools will be checked to see if there are more outstanding
release operations than the objects retain count. In which case an
exception is raised to say that the object is released too many times.

**Beware**, since this feature entails examining all active autorelease
pools every time an object is released or autoreleased, it can cause a
massive performance degradation... it should only be enabled for
debugging.

When you are having memory allocation problems, it may make more sense
to look at the memory allocation debugging functions documented in
NSDebug.h, or use the NSZombie features.

------------------------------------------------------------------------

<span id="003000000000">Software documentation for the NSObject(NEXTSTEP) category</span>
=========================================================================================

[NSObject](#class$NSObject)(<span id="category$NSObject(NEXTSTEP)">NEXTSTEP</span>)
-----------------------------------------------------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

**Availability:** Not in OpenStep/MacOS-X

  

Methods for compatibility with the NEXTSTEP (pre-OpenStep) 'Object'
class.

**Method summary**

-   [-error:,...](NSObject.html#method$NSObject(NEXTSTEP)-error$,...)

------------------------------------------------------------------------

### <span id="method$NSObject(NEXTSTEP)-error$,...">error: ,...</span>

\- (id) **error:** (const char\*)aString**,...**;  

**Availability:** Not in OpenStep/MacOS-X

  

Logs a message. *Deprecated.* Use
[NSLog()](Functions.html#function$NSLog) in new code.

------------------------------------------------------------------------

<span id="004000000000">Software documentation for the NSObject(TimedPerformers) informal protocol</span>
=========================================================================================================

[NSObject](#class$NSObject)(<span id="category$NSObject(TimedPerformers)">TimedPerformers</span>)
-------------------------------------------------------------------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

**Availability:** OpenStep

  

Declares some methods for sending messages to self after a fixed delay.
(These methods *are* in OpenStep and OS X.)

**Method summary**

-   [+cancelPreviousPerformRequestsWithTarget:](NSObject.html#method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$)
-   [+cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject.html#method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$selector$object$)
-   [-performSelector:withObject:afterDelay:](NSObject.html#method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$)
-   [-performSelector:withObject:afterDelay:inModes:](NSObject.html#method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$inModes$)

------------------------------------------------------------------------

### <span id="method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$">cancelPreviousPerformRequestsWithTarget: </span>

\+ (void) **cancelPreviousPerformRequestsWithTarget:** (id)obj;  

**Availability:** OpenStep

  

Cancels any perform operations set up for the specified target in the
current run loop.

------------------------------------------------------------------------

### <span id="method$NSObject(TimedPerformers)+cancelPreviousPerformRequestsWithTarget$selector$object$">cancelPreviousPerformRequestsWithTarget: selector: object: </span>

\+ (void) **cancelPreviousPerformRequestsWithTarget:** (id)obj
**selector:** (SEL)s **object:** (id)arg;  

**Availability:** OpenStep

  

Cancels any perform operations set up for the specified target in the
current loop, but only if the value of aSelector and argument with which
the performs were set up match those supplied.  
Matching of the argument may be either by pointer equality or by use of
the \[NSObject -isEqual:\] method.

------------------------------------------------------------------------

### <span id="method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$">performSelector: withObject: afterDelay: </span>

\- (void) **performSelector:** (SEL)s **withObject:** (id)arg
**afterDelay:**
([NSTimeInterval](TypesAndConstants.html#type$NSTimeInterval))seconds;  

**Availability:** OpenStep

  

Sets given message to be sent to this instance after given delay, in any
run loop mode. See [NSRunLoop](NSRunLoop.html#class$NSRunLoop) .

------------------------------------------------------------------------

### <span id="method$NSObject(TimedPerformers)-performSelector$withObject$afterDelay$inModes$">performSelector: withObject: afterDelay: inModes: </span>

\- (void) **performSelector:** (SEL)s **withObject:** (id)arg
**afterDelay:**
([NSTimeInterval](TypesAndConstants.html#type$NSTimeInterval))seconds
**inModes:** ([NSArray](NSArray.html#class$NSArray)\*)modes;  

**Availability:** OpenStep

  

Sets given message to be sent to this instance after given delay, in
given run loop `modes`. See [NSRunLoop](NSRunLoop.html#class$NSRunLoop)
.

------------------------------------------------------------------------

<span id="005000000000">Software documentation for the NSCoding protocol</span>
===============================================================================

<span id="protocol$(NSCoding)">NSCoding</span>
----------------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

**Availability:** OpenStep

  

This protocol must be adopted by any class wishing to support saving and
restoring instances to an archive, or copying them to remote processes
via the Distributed Objects mechanism.

**Method summary**

-   [-encodeWithCoder:](NSObject.html#method$(NSCoding)-encodeWithCoder$)
-   [-initWithCoder:](NSObject.html#method$(NSCoding)-initWithCoder$)

------------------------------------------------------------------------

### <span id="method$(NSCoding)-encodeWithCoder$">encodeWithCoder: </span>

\- (void) **encodeWithCoder:**
([NSCoder](NSCoder.html#class$NSCoder)\*)aCoder;  

**Availability:** OpenStep

  

Called when it is time for receiver to be serialized for writing to an
archive or network connection. Receiver should record all of its
instance variables using methods on `aCoder`. See documentation for
[NSCoder](NSCoder.html#class$NSCoder) ,
[NSArchiver](NSArchiver.html#class$NSArchiver) ,
[NSKeyedArchiver](NSKeyedArchiver.html#class$NSKeyedArchiver) , and/or
[NSPortCoder](NSPortCoder.html#class$NSPortCoder) for more information.

------------------------------------------------------------------------

### <span id="method$(NSCoding)-initWithCoder$">initWithCoder: </span>

\- (id) **initWithCoder:**
([NSCoder](NSCoder.html#class$NSCoder)\*)aDecoder;  

**Availability:** OpenStep

  

Called on a freshly allocated receiver when it is time to reconstitute
from serialized bytes in an archive or from a network connection.
Receiver should load all of its instance variables using methods on
aCoder. See documentation for [NSCoder](NSCoder.html#class$NSCoder) ,
[NSUnarchiver](NSArchiver.html#class$NSUnarchiver) ,
[NSKeyedUnarchiver](NSKeyedArchiver.html#class$NSKeyedUnarchiver) ,
and/or [NSPortCoder](NSPortCoder.html#class$NSPortCoder) for more
information.

------------------------------------------------------------------------

<span id="006000000000">Software documentation for the NSCopying protocol</span>
================================================================================

<span id="protocol$(NSCopying)">NSCopying</span>
------------------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

**Availability:** OpenStep

  

This protocol must be adopted by any class wishing to support copying -
ie where instances of the class should be able to create new instances
which are copies of the original and, where a class has mutable and
immutable versions, where the copies are immutable.

**Method summary**

-   [-copyWithZone:](NSObject.html#method$(NSCopying)-copyWithZone$)

------------------------------------------------------------------------

### <span id="method$(NSCopying)-copyWithZone$">copyWithZone: </span>

\- (id) **copyWithZone:**
([NSZone](TypesAndConstants.html#type$NSZone)\*)zone;  

**Availability:** OpenStep

  

Called by [\[NSObject -copy\]](#method$NSObject-copy) passing
[NSDefaultMallocZone()](Functions.html#function$NSDefaultMallocZone) as
`zone`.  
This method returns a copy of the receiver and, where the receiver is a
mutable variant of a class which has an immutable partner class, the
object returned is an instance of that immutable class.  
The new object is *not* autoreleased, and is considered to be 'owned' by
the calling code... which is therefore responsible for releasing it.  
In the case where the receiver is an instance of a container class, it
is undefined whether contained objects are merely retained in the new
copy, or are themselves copied, or whether some other mechanism entirely
is used.

------------------------------------------------------------------------

<span id="007000000000">Software documentation for the NSDiscardableContent protocol</span>
===========================================================================================

<span id="protocol$(NSDiscardableContent)">NSDiscardableContent</span>
----------------------------------------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

**Availability:** MacOS-X 10.6.0

  

The NSDiscardableContent protocol is used by objects which encapsulate
data which may be discarded if resource constraints are exceeded. These
constraints are typically, but not always, related memory.

**Method summary**

-   [-beginContentAccess](NSObject.html#method$(NSDiscardableContent)-beginContentAccess)
-   [-discardContentIfPossible](NSObject.html#method$(NSDiscardableContent)-discardContentIfPossible)
-   [-endContentAccess](NSObject.html#method$(NSDiscardableContent)-endContentAccess)
-   [-isContentDiscarded](NSObject.html#method$(NSDiscardableContent)-isContentDiscarded)

------------------------------------------------------------------------

### <span id="method$(NSDiscardableContent)-beginContentAccess">beginContentAccess </span>

\- (BOOL) **beginContentAccess**;  

**Availability:** MacOS-X 10.6.0

  

This method is called before any access to the object. It returns `YES`
if the object's content is still valid. The caller must call
[-endContentAccess](#method$(NSDiscardableContent)-endContentAccess)
once for every call to
[-beginContentAccess](#method$(NSDiscardableContent)-beginContentAccess)
;

------------------------------------------------------------------------

### <span id="method$(NSDiscardableContent)-discardContentIfPossible">discardContentIfPossible </span>

\- (void) **discardContentIfPossible**;  

**Availability:** MacOS-X 10.6.0

  

Discards the contents of the object if it is not currently being edited.

------------------------------------------------------------------------

### <span id="method$(NSDiscardableContent)-endContentAccess">endContentAccess </span>

\- (void) **endContentAccess**;  

**Availability:** MacOS-X 10.6.0

  

This method indicates that the caller has finished accessing the
contents of the object adopting this protocol. Every call to
[-beginContentAccess](#method$(NSDiscardableContent)-beginContentAccess)
must be be paired with a call to this method after the caller has
finished accessing the contents.

------------------------------------------------------------------------

### <span id="method$(NSDiscardableContent)-isContentDiscarded">isContentDiscarded </span>

\- (BOOL) **isContentDiscarded**;  

**Availability:** MacOS-X 10.6.0

  

Returns `YES` if the contents of the object have been discarded, either
via a call to
[-discardContentIfPossible](#method$(NSDiscardableContent)-discardContentIfPossible)
while the object is not in use, or by some implementation dependent
mechanism.

------------------------------------------------------------------------

<span id="008000000000">Software documentation for the NSMutableCopying protocol</span>
=======================================================================================

<span id="protocol$(NSMutableCopying)">NSMutableCopying</span>
--------------------------------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

**Availability:** OpenStep

  

This protocol must be adopted by any class wishing to support mutable
copying - ie where instances of the class should be able to create
mutable copies of themselves.

**Method summary**

-   [-mutableCopyWithZone:](NSObject.html#method$(NSMutableCopying)-mutableCopyWithZone$)

------------------------------------------------------------------------

### <span id="method$(NSMutableCopying)-mutableCopyWithZone$">mutableCopyWithZone: </span>

\- (id) **mutableCopyWithZone:**
([NSZone](TypesAndConstants.html#type$NSZone)\*)zone;  

**Availability:** OpenStep

  

Called by [\[NSObject -mutableCopy\]](#method$NSObject-mutableCopy)
passing
[NSDefaultMallocZone()](Functions.html#function$NSDefaultMallocZone) as
`zone`.  
This method returns a copy of the receiver and, where the receiver is an
immutable variant of a class which has a mutable partner class, the
object returned is an instance of that mutable class. The new object is
*not* autoreleased, and is considered to be 'owned' by the calling
code... which is therefore responsible for releasing it.  
In the case where the receiver is an instance of a container class, it
is undefined whether contained objects are merely retained in the new
copy, or are themselves copied, or whether some other mechanism entirely
is used.

------------------------------------------------------------------------

<span id="009000000000">Software documentation for the NSObject protocol</span>
===============================================================================

<span id="protocol$(NSObject)">NSObject</span>
----------------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

**Availability:** OpenStep

  

The NSObject protocol describes a minimal set of methods that all
objects are expected to support. You should be able to send any of the
messages listed in this protocol to an object, and be safe in assuming
that the receiver can handle it.

**Method summary**

-   [-autorelease](NSObject.html#method$(NSObject)-autorelease)
-   [-class](NSObject.html#method$(NSObject)-class)
-   [-conformsToProtocol:](NSObject.html#method$(NSObject)-conformsToProtocol$)
-   [-description](NSObject.html#method$(NSObject)-description)
-   [-hash](NSObject.html#method$(NSObject)-hash)
-   [-isEqual:](NSObject.html#method$(NSObject)-isEqual$)
-   [-isKindOfClass:](NSObject.html#method$(NSObject)-isKindOfClass$)
-   [-isMemberOfClass:](NSObject.html#method$(NSObject)-isMemberOfClass$)
-   [-isProxy](NSObject.html#method$(NSObject)-isProxy)
-   [-performSelector:](NSObject.html#method$(NSObject)-performSelector$)
-   [-performSelector:withObject:](NSObject.html#method$(NSObject)-performSelector$withObject$)
-   [-performSelector:withObject:withObject:](NSObject.html#method$(NSObject)-performSelector$withObject$withObject$)
-   [-release](NSObject.html#method$(NSObject)-release)
-   [-respondsToSelector:](NSObject.html#method$(NSObject)-respondsToSelector$)
-   [-retain](NSObject.html#method$(NSObject)-retain)
-   [-retainCount](NSObject.html#method$(NSObject)-retainCount)
-   [-self](NSObject.html#method$(NSObject)-self)
-   [-superclass](NSObject.html#method$(NSObject)-superclass)
-   [-zone](NSObject.html#method$(NSObject)-zone)

------------------------------------------------------------------------

### <span id="method$(NSObject)-autorelease">autorelease </span>

\- (id) **autorelease**;  

**Availability:** OpenStep

  

Performs a deferred [-release](#method$(NSObject)-release) operation.
The object's reference count is decremented at the end of the scope of
the current autorelease pool, identified either by a
[-drain](NSAutoreleasePool.html#method$NSAutoreleasePool-drain) message
sent to the current NSAutoreleasePool instance, or in more recent
versions of Objective-C by the end of an @autorelease\_pool scope. In
garbage collected mode, this method does nothing. In automated reference
counting mode, you may neither implement this method nor call it
directly.

------------------------------------------------------------------------

### <span id="method$(NSObject)-class">class </span>

\- (Class) **class**;  

**Availability:** OpenStep

  

Returns the class of the receiver. If the receiver is a proxy, then this
may return the class of the proxy target. Use
[-isProxy](#method$(NSObject)-isProxy) to determine whether the receiver
is a proxy. If you wish to find the real class of the receiver, ignoring
proxies, then use object\_getClass() .

------------------------------------------------------------------------

### <span id="method$(NSObject)-conformsToProtocol$">conformsToProtocol: </span>

\- (BOOL) **conformsToProtocol:** (Protocol\*)aProtocol;  

**Availability:** OpenStep

  

Returns `YES` if the receiver conforms to the specified protocol.

------------------------------------------------------------------------

### <span id="method$(NSObject)-description">description </span>

\- ([NSString](NSString.html#class$NSString)\*) **description**;  

**Availability:** OpenStep

  

Returns the description of the object. This is used by the %@ format
specifier in strings.

------------------------------------------------------------------------

### <span id="method$(NSObject)-hash">hash </span>

\- ([NSUInteger](TypesAndConstants.html#type$NSUInteger)) **hash**;  

**Availability:** OpenStep

  

Returns a hash value for the object. All objects that are equal \*MUST\*
return the same hash value. For efficient storage in sets, or as keys in
dictionaries, different objects should return hashes spread evenly over
the range of an integer. An object may not return different values from
this method after being stored in a collection. This typically means
that ether the hash value must be constant after the object's creation,
or that the object may not be modified while stored in an unordered
collection.

------------------------------------------------------------------------

### <span id="method$(NSObject)-isEqual$">isEqual: </span>

\- (BOOL) **isEqual:** (id)anObject;  

**Availability:** OpenStep

  

Returns whether the receiver is equal to the argument. Defining equality
is complex, so be careful when implementing this method. Collections
such as NSSet depend on the behaviour of this method. In particular,
this method must be commutative, so for any objects a and b: \[a
isEqual: b\] == \[b isEqual: a\] This means that you must be very
careful when returning `YES` if the argument is of another class. For
example, if you define a number class that returns `YES` if the argument
is a string representation of the number, then this will break because
the string will not recognise your object as being equal to itself. If
two objects are equal, then they must have the same hash value, however
equal hash values do not imply equality.

------------------------------------------------------------------------

### <span id="method$(NSObject)-isKindOfClass$">isKindOfClass: </span>

\- (BOOL) **isKindOfClass:** (Class)aClass;  

**Availability:** OpenStep

  

Returns `YES` if the receiver is an instance of the class, an instance
of the subclass, or (in the case of proxies), an instance of something
that can be treated as an instance of the class.

------------------------------------------------------------------------

### <span id="method$(NSObject)-isMemberOfClass$">isMemberOfClass: </span>

\- (BOOL) **isMemberOfClass:** (Class)aClass;  

**Availability:** OpenStep

  

Returns `YES` if the receiver is an instance of the class or (in the
case of proxies), an instance of something that can be treated as an
instance of the class. Calling this method is rarely the correct thing
to do. In most cases, a subclass can be substituted for a superclass, so
you should never need to check that an object is really an instance of a
specific class and not a subclass.

------------------------------------------------------------------------

### <span id="method$(NSObject)-isProxy">isProxy </span>

\- (BOOL) **isProxy**;  

**Availability:** OpenStep

  

Returns `YES` if the receiver is a proxy, `NO` otherwise. The default
implementation of this method in NSObject returns `NO`, while the
implementation in NSProxy returns `YES`.

------------------------------------------------------------------------

### <span id="method$(NSObject)-performSelector$">performSelector: </span>

\- (id) **performSelector:** (SEL)aSelector;  

**Availability:** OpenStep

  

Performs the specified selector. The selector must correspond to a
method that takes no arguments.

------------------------------------------------------------------------

### <span id="method$(NSObject)-performSelector$withObject$">performSelector: withObject: </span>

\- (id) **performSelector:** (SEL)aSelector **withObject:**
(id)anObject;  

**Availability:** OpenStep

  

Performs the specified selector, with the object as the argument. This
method does not perform any automatic unboxing, so the selector must
correspond to a method that takes one object argument.

------------------------------------------------------------------------

### <span id="method$(NSObject)-performSelector$withObject$withObject$">performSelector: withObject: withObject: </span>

\- (id) **performSelector:** (SEL)aSelector **withObject:** (id)object1
**withObject:** (id)object2;  

**Availability:** OpenStep

  

Performs the specified selector, with the objects as the arguments. This
method does not perform any automatic unboxing, so the selector must
correspond to a method that takes two object arguments.

------------------------------------------------------------------------

### <span id="method$(NSObject)-release">release </span>

\- (oneway void) **release**;  

**Availability:** OpenStep

  

Decrements the reference count of the object and destroys if it there
are no remaining references. In garbage collected mode, this method does
nothing. In automated reference counting mode, you may neither implement
this method nor call it directly.

------------------------------------------------------------------------

### <span id="method$(NSObject)-respondsToSelector$">respondsToSelector: </span>

\- (BOOL) **respondsToSelector:** (SEL)aSelector;  

**Availability:** OpenStep

  

Returns `YES` if the object can respond to messages with the specified
selector. The default implementation in NSObject returns `YES` if the
receiver has a method corresponding to the method, but other classes may
return `YES` if they can respond to a selector using one of the various
forwarding mechanisms.

------------------------------------------------------------------------

### <span id="method$(NSObject)-retain">retain </span>

\- (id) **retain**;  

**Availability:** OpenStep

  

Increments the reference count of the object and returns the receiver.
In garbage collected mode, this method does nothing. In automated
reference counting mode, you may neither implement this method nor call
it directly.

------------------------------------------------------------------------

### <span id="method$(NSObject)-retainCount">retainCount </span>

\- ([NSUInteger](TypesAndConstants.html#type$NSUInteger))
**retainCount**;  

**Availability:** OpenStep

  

Returns the current retain count of an object. This does not include the
result of any pending autorelease operations. Code that relies on this
method returning a sane value is broken. For singletons, it may return
NSUIntegerMax. Even when it is tracking a retain count, it will not
include on-stack pointers in manual retain/release mode, pointers marked
as \_\_unsafe\_unretain or \_\_weak in ARC mode, or pending autorelease
operations. Its value is therefore largely meaningless. It can
occasionally be useful for debugging.

------------------------------------------------------------------------

### <span id="method$(NSObject)-self">self </span>

\- (id) **self**;  

**Availability:** OpenStep

  

Returns the receiver. In a proxy, this may (but is not required to)
return the proxied object.

------------------------------------------------------------------------

### <span id="method$(NSObject)-superclass">superclass </span>

\- (Class) **superclass**;  

**Availability:** OpenStep

  

Returns the superclass of receiver's class. If the receiver is a proxy,
then this may return the class of the proxy target. Use
[-isProxy](#method$(NSObject)-isProxy) to determine whether the receiver
is a proxy. If you wish to find the real superclass of the receiver's
class, ignoring proxies, then use
class\_getSuperclass(object\_getClass()).

------------------------------------------------------------------------

### <span id="method$(NSObject)-zone">zone </span>

\- ([NSZone](TypesAndConstants.html#type$NSZone)\*) **zone**;  

**Availability:** OpenStep

  

Returns the zone of the object.

------------------------------------------------------------------------

<span id="010000000000">Software documentation for the NSSecureCoding protocol</span>
=====================================================================================

<span id="protocol$(NSSecureCoding)">NSSecureCoding</span>
----------------------------------------------------------

> **Declared in:**  
> Foundation/NSObject.h

> **Conforms to:**  
> [NSCoding](#protocol$(NSCoding))

**Availability:** OpenStep

  

*Description forthcoming.*

**Method summary**

-   [+supportsSecureCoding](NSObject.html#method$(NSSecureCoding)+supportsSecureCoding)

------------------------------------------------------------------------

### <span id="method$(NSSecureCoding)+supportsSecureCoding">supportsSecureCoding </span>

\+ (BOOL) **supportsSecureCoding**;  

**Availability:** OpenStep

  

*Description forthcoming.*

------------------------------------------------------------------------

  
[Up](Base.html)
