# IGSDoc Symbol Types

An `igsdoc` file is like the following:

```plist
{
```
## Category
### IGSDoc markup
#### Class &rarr; Category &rarr; File
```plist
    categories = {
        NSArchiver = {
            GNUstep = NSArchiver;
        };
        NSArray = {
            NSKeyValueObserverRegistration = NSKeyValueObserving;
        };
        NSBundle = {
            GNUstep = NSBundle;
        };
        NSCalendarDate = {
            GregorianDate = NSCalendarDate;
            OPENSTEP = NSCalendarDate;
        };
        NSCoder = {
            NSGeometryKeyedCoding = NSKeyedArchiver;
        };
        NSCountedSet = {
            "GNU_Uniquing" = NSSet;
        };
    };
```

#### Class(Category) &rarr; File
```
    category = {
        "NSArchiver(GNUstep)" = NSArchiver;
        "NSArray(NSKeyValueObserverRegistration)" = NSKeyValueObserving;
        "NSBundle(GNUstep)" = NSBundle;
        "NSCalendarDate(GregorianDate)" = NSCalendarDate;
        "NSCalendarDate(OPENSTEP)" = NSCalendarDate;
        "NSCoder(NSGeometryKeyedCoding)" = NSKeyedArchiver;
    };
```
### Sphinx directive

No directive yet.

### Objective-C Declaration

```objc
@interface NSArchiver(GNUstep)
```

## Class

### IGSDoc markup

#### Class &rarr; File

```
    class = {
        NSAffineTransform = NSAffineTransform;
        NSArchiver = NSArchiver;
        NSArray = NSArray;
        NSAssertionHandler = NSException;
        NSAttributedString = NSAttributedString;
        NSAutoreleasePool = NSAutoreleasePool;
        NSBundle = NSBundle;
        NSCachedURLResponse = NSURLCache;
        NSCalendarDate = NSCalendarDate;
        NSCharacterSet = NSCharacterSet;
        NSClassDescription = NSClassDescription;
        NSCoder = NSCoder;
        NSCondition = NSLock;
        NSConditionLock = NSLock;
        NSConnection = NSConnection;
        NSCountedSet = NSSet;
        NSData = NSData;
        NSDate = NSDate;
        NSDateFormatter = NSDateFormatter;
        NSDecimalNumber = NSDecimalNumber;
        NSDecimalNumberHandler = NSDecimalNumber;
        NSDeserializer = NSSerialization;
        NSDictionary = NSDictionary;
        NSDirectoryEnumerator = NSFileManager;
        NSDistantObject = NSDistantObject;
        NSDistributedLock = NSDistributedLock;
        NSDistributedNotificationCenter = NSDistributedNotificationCenter;
        NSEnumerator = NSEnumerator;
        NSError = NSError;
        NSException = NSException;
        NSFileHandle = NSFileHandle;
        NSFileManager = NSFileManager;
        NSFormatter = NSFormatter;
        NSHTTPCookie = NSHTTPCookie;
        NSHTTPCookieStorage = NSHTTPCookieStorage;
        NSHTTPURLResponse = NSURLResponse;
        NSHashTable = NSHashTable;
        NSHost = NSHost;
        NSIndexPath = NSIndexPath;
        NSIndexSet = NSIndexSet;
        NSInputStream = NSStream;
        NSInvocation = NSInvocation;
        NSKeyedArchiver = NSKeyedArchiver;
        NSKeyedUnarchiver = NSKeyedArchiver;
        NSLock = NSLock;
        NSMapTable = NSMapTable;
        NSMessagePort = NSPort;
        NSMessagePortNameServer = NSPortNameServer;
        NSMethodSignature = NSMethodSignature;
        NSMutableArray = NSArray;
        NSMutableAttributedString = NSAttributedString;
        NSMutableCharacterSet = NSCharacterSet;
        NSMutableData = NSData;
        NSMutableDictionary = NSDictionary;
        NSMutableIndexSet = NSIndexSet;
        NSMutableSet = NSSet;
        NSMutableString = NSString;
        NSMutableURLRequest = NSURLRequest;
        NSNetService = NSNetServices;
        NSNetServiceBrowser = NSNetServices;
        NSNotification = NSNotification;
        NSNotificationCenter = NSNotification;
        NSNotificationQueue = NSNotificationQueue;
        NSNull = NSNull;
        NSNumber = NSValue;
        NSNumberFormatter = NSNumberFormatter;
        NSObject = NSObject;
        NSOutputStream = NSStream;
        NSPipe = NSFileHandle;
        NSPointerArray = NSPointerArray;
        NSPointerFunctions = NSPointerFunctions;
        NSPort = NSPort;
        NSPortCoder = NSPortCoder;
        NSPortMessage = NSPortMessage;
        NSPortNameServer = NSPortNameServer;
        NSProcessInfo = NSProcessInfo;
        NSPropertyListSerialization = NSPropertyList;
        NSProtocolChecker = NSProtocolChecker;
        NSProxy = NSProxy;
        NSRecursiveLock = NSLock;
        NSRunLoop = NSRunLoop;
        NSScanner = NSScanner;
        NSSerializer = NSSerialization;
        NSSet = NSSet;
        NSSocketPort = NSPort;
        NSSocketPortNameServer = NSPortNameServer;
        NSStream = NSStream;
        NSString = NSString;
        NSTask = NSTask;
        NSThread = NSThread;
        NSTimeZone = NSTimeZone;
        NSTimeZoneDetail = NSTimeZone;
        NSTimer = NSTimer;
        NSURL = NSURL;
        NSURLAuthenticationChallenge = NSURLAuthenticationChallenge;
        NSURLCache = NSURLCache;
        NSURLComponents = NSURL;
        NSURLConnection = NSURLConnection;
        NSURLCredential = NSURLCredential;
        NSURLCredentialStorage = NSURLCredentialStorage;
        NSURLDownload = NSURLDownload;
        NSURLHandle = NSURLHandle;
        NSURLProtectionSpace = NSURLProtectionSpace;
        NSURLProtocol = NSURLProtocol;
        NSURLQueryItem = NSURL;
        NSURLRequest = NSURLRequest;
        NSURLResponse = NSURLResponse;
        NSUnarchiver = NSArchiver;
        NSUndoManager = NSUndoManager;
        NSUserDefaults = NSUserDefaults;
        NSValue = NSValue;
        NSValueTransformer = NSValueTransformer;
        NSXMLDTD = NSXMLDTD;
        NSXMLDTDNode = NSXMLDTDNode;
        NSXMLDocument = NSXMLDocument;
        NSXMLElement = NSXMLElement;
        NSXMLNode = NSXMLNode;
        NSXMLParser = NSXMLParser;
        NXConstantString = NSString;
    };
```

#### Class &rarr; Superclass

```
    super = {
		NSAffineTransform = NSObject;
		NSArchiver = NSCoder;
		NSArray = NSObject;
		NSAssertionHandler = NSObject;
		NSAttributedString = NSObject;
		NSAutoreleasePool = NSObject;
		NSBundle = NSObject;
		NSCachedURLResponse = NSObject;
		NSCalendarDate = NSDate;
		NSCharacterSet = NSObject;
		NSClassDescription = NSObject;
		NSCoder = NSObject;
		NSCondition = NSObject;
		NSConditionLock = NSObject;
		NSConnection = NSObject;
		NSCountedSet = NSMutableSet;
		NSData = NSObject;
		NSDate = NSObject;
    };
```

### Sphinx directive

No directive yet.

### Objective-C Declaration

```objc
@interface NSArray: NSObject
```

## Instance Variable

### IGSDoc Markup

#### Class &rarr; Variable &rarr; File

```plist
    classvars = {
        NSAutoreleasePool = {
            "_addImp" = NSAutoreleasePool;
            "_child" = NSAutoreleasePool;
            "_parent" = NSAutoreleasePool;
            "_released" = NSAutoreleasePool;
            "_released_count" = NSAutoreleasePool;
            "_released_head" = NSAutoreleasePool;
        };
        NSBundle = {
            "_bundleClasses" = NSBundle;
            "_bundleType" = NSBundle;
            "_codeLoaded" = NSBundle;
            "_frameworkVersion" = NSBundle;
            "_infoDict" = NSBundle;
            "_localizations" = NSBundle;
            "_path" = NSBundle;
            "_principalClass" = NSBundle;
            "_version" = NSBundle;
        };
        NSCachedURLResponse = {
            "_NSCachedURLResponseInternal" = NSURLCache;
        };
        NSCalendarDate = {
            "_calendar_format" = NSCalendarDate;
            "_seconds_since_ref" = NSCalendarDate;
            "_time_zone" = NSCalendarDate;
        };
        NSCondition = {
            "_condition" = NSLock;
            "_mutex" = NSLock;
            "_name" = NSLock;
        };
    };
```

#### Variable &rarr; Class &rarr; File

```plist
    ivariable = {
        "_NSCachedURLResponseInternal" = {
            NSCachedURLResponse = NSURLCache;
        };
        "_NSURLAuthenticationChallengeInternal" = {
            NSURLAuthenticationChallenge = NSURLAuthenticationChallenge;
        };
        "_NSURLCacheInternal" = {
            NSURLCache = NSURLCache;
        };
        "_NSURLConnectionInternal" = {
            NSURLConnection = NSURLConnection;
        };
        "_NSURLCredentialInternal" = {
            NSURLCredential = NSURLCredential;
        };
        "_NSURLCredentialStorageInternal" = {
            NSURLCredentialStorage = NSURLCredentialStorage;
        };
        "_NSURLDownloadInternal" = {
            NSURLDownload = NSURLDownload;
        };
        "_NSURLProtectionSpaceInternal" = {
            NSURLProtectionSpace = NSURLProtectionSpace;
        };
    };
```

### Sphinx directive

None yet.

### Objective-C Declaration

```objc
@interface NSAutoReleasePool : NSObject
{
	NSAutoreleasePool *_parent;
	// Other variables
}
```

## Function
```plist
    function = {
        GNUstepConfig = Functions;
        GNUstepUserConfig = Functions;
        GSAssignZeroingWeakPointer = Functions;
        GSDebugAllocationActive = Functions;
        GSDebugAllocationActiveRecordingObjects = Functions;
        GSDebugAllocationAdd = Functions;
        GSDebugAllocationBytes = Functions;
        GSDebugAllocationClassList = Functions;
        GSDebugAllocationCount = Functions;
        GSDebugAllocationList = Functions;
        GSDebugAllocationListAll = Functions;
        GSDebugAllocationListRecordedObjects = Functions;
        GSDebugAllocationPeak = Functions;
        GSDebugAllocationRecordObjects = Functions;
        GSDebugAllocationRemove = Functions;
        GSDebugAllocationTagRecordedObject = Functions;
    };
```


## Macro

```
    macro = {
        "FOUNDATION_EXPORT" = Functions;
        NSAssert = Functions;
        NSAssert1 = Functions;
        NSAssert2 = Functions;
        NSAssert3 = Functions;
        NSAssert4 = Functions;
        NSAssert5 = Functions;
        NSCAssert = Functions;
        NSCAssert1 = Functions;
        NSCAssert2 = Functions;
        NSCAssert3 = Functions;
        NSCAssert4 = Functions;
        NSCAssert5 = Functions;
        NSCParameterAssert = Functions;
        NSDecimalMaxSize = Functions;
        NSLocalizedString = Functions;
        NSLocalizedStringFromTable = Functions;
        NSLocalizedStringFromTableInBundle = Functions;
        NSParameterAssert = Functions;
        "NS_CLASS_AVAILABLE" = Functions;
        "NS_INVOCATION" = Functions;
        "NS_MESSAGE" = Functions;
    };
```

## Method
### IGSDoc Markup
#### Method &rarr; Class &rarr; File
```
    method = {
        "+DTDNodeWithXMLString:" = {
            NSXMLNode = NSXMLNode;
        };
        "+URLByResolvingAliasFileAtURL:options:error:" = {
            NSURL = NSURL;
        };
        "+URLForResource:withExtension:subdirectory:inBundleWithURL:" = {
            NSBundle = NSBundle;
        };
        "+URLFragmentAllowedCharacterSet" = {
            NSCharacterSet = NSCharacterSet;
        };
        "+URLHandleClassForURL:" = {
            NSURLHandle = NSURLHandle;
        };
        "+_newProxyForInvocation:" = {
            "NSInvocation(MacroSetup)" = NSInvocation;
        };
        "+_newProxyForMessage:" = {
            "NSInvocation(MacroSetup)" = NSInvocation;
        };
        "+_returnInvocationAndDestroyProxy:" = {
            "NSInvocation(MacroSetup)" = NSInvocation;
        };
        "+abbreviationDictionary" = {
            NSTimeZone = NSTimeZone;
        };
        "+abbreviationMap" = {
            NSTimeZone = NSTimeZone;
        };
        "+accessInstanceVariablesDirectly" = {
            "NSObject(NSKeyValueCoding)" = NSKeyValueCoding;
        };
        "+alloc" = {
            NSObject = NSObject;
            NSProxy = NSProxy;
        };
        "+allocWithZone:" = {
            NSAutoreleasePool = NSAutoreleasePool;
            NSObject = NSObject;
            NSProxy = NSProxy;
        };
    };
```
### Class &rarr; Method &rarr; File

```
    unitmethods = {
		"(GSLogDelegate)" = {
			"-getBytes:ofLength:byHandle:" = NSDebug;
			"-putBytes:ofLength:byHandle:" = NSDebug;
		};
		"(NSCoding)" = {
			"-encodeWithCoder:" = NSObject;
			"-initWithCoder:" = NSObject;
		};
		"(NSCopying)" = {
			"-copyWithZone:" = NSObject;
		};
		"(NSDecimalNumberBehaviors)" = {
			"-exceptionDuringOperation:error:leftOperand:rightOperand:" = NSDecimalNumber;
			"-roundingMode" = NSDecimalNumber;
			"-scale" = NSDecimalNumber;
		};
		NSAffineTransform = {
			"+transform" = NSAffineTransform;
			"-appendTransform:" = NSAffineTransform;
			"-initWithTransform:" = NSAffineTransform;
			"-invert" = NSAffineTransform;
			"-prependTransform:" = NSAffineTransform;
			"-rotateByDegrees:" = NSAffineTransform;
			"-rotateByRadians:" = NSAffineTransform;
			"-scaleBy:" = NSAffineTransform;
			"-scaleXBy:yBy:" = NSAffineTransform;
			"-setTransformStruct:" = NSAffineTransform;
			"-transformPoint:" = NSAffineTransform;
			"-transformSize:" = NSAffineTransform;
			"-transformStruct" = NSAffineTransform;
			"-translateXBy:yBy:" = NSAffineTransform;
		};
		NSArchiver = {
			"+archiveRootObject:toFile:" = NSArchiver;
			"+archivedDataWithRootObject:" = NSArchiver;
			"-archiverData" = NSArchiver;
			"-classNameEncodedForTrueClassName:" = NSArchiver;
			"-encodeClassName:intoClassName:" = NSArchiver;
			"-initForWritingWithMutableData:" = NSArchiver;
			"-replaceObject:withObject:" = NSArchiver;
		};
		"NSArchiver(GNUstep)" = {
			"-directDataAccess" = NSArchiver;
			"-resetArchiver" = NSArchiver;
			"-serializeHeaderAt:version:classes:objects:pointers:" = NSArchiver;
		};
    };
```

## Protocol

```
    protocol = {
        "(GSLogDelegate)" = NSDebug;
        "(NSCoding)" = NSObject;
        "(NSCopying)" = NSObject;
        "(NSDecimalNumberBehaviors)" = NSDecimalNumber;
        "(NSDiscardableContent)" = NSObject;
        "(NSFastEnumeration)" = NSEnumerator;
        "(NSFileManagerDelegate)" = NSFileManager;
        "(NSLocking)" = NSLock;
        "(NSMutableCopying)" = NSObject;
        "(NSNetServiceBrowserDelegate)" = NSNetServices;
        "(NSNetServiceDelegate)" = NSNetServices;
        "(NSObjCTypeSerializationCallBack)" = NSSerialization;
        "(NSObject)" = NSObject;
        "(NSSecureCoding)" = NSObject;
        "(NSStreamDelegate)" = NSStream;
        "(NSURLAuthenticationChallengeSender)" = NSURLAuthenticationChallenge;
        "(NSURLConnectionDelegate)" = NSURLConnection;
        "(NSURLDownloadDelegate)" = NSURLDownload;
        "(NSURLHandleClient)" = NSURLHandle;
        "(NSURLProtocolClient)" = NSURLProtocol;
        "(NSXMLParserDelegate)" = NSXMLParser;
        "(RunLoopEvents)" = NSRunLoop;
        "NSObject(GSTraceLocks)" = NSLock;
        "NSObject(NSConnectionDelegate)" = NSConnection;
        "NSObject(NSFileManagerDelegate)" = NSFileManager;
        "NSObject(NSFileManagerHandler)" = NSFileManager;
        "NSObject(NSKeyValueCoding)" = NSKeyValueCoding;
        "NSObject(NSNetServiceBrowserDelegateMethods)" = NSNetServices;
        "NSObject(NSNetServiceDelegateMethods)" = NSNetServices;
        "NSObject(NSStreamDelegate)" = NSStream;
        "NSObject(RunLoopEvents)" = NSRunLoop;
        "NSObject(TimedPerformers)" = NSObject;
    };
```

## Constant

```plist
    constant = {
        GSConfigDomain = TypesAndConstants;
        GSFileHandleConnectCompletionNotification = TypesAndConstants;
        GSFileHandleNotificationError = TypesAndConstants;
        GSFileHandleWriteCompletionNotification = TypesAndConstants;
        GSHTTPPropertyCertificateFileKey = TypesAndConstants;
        GSHTTPPropertyKeyFileKey = TypesAndConstants;
        GSHTTPPropertyLocalHostKey = TypesAndConstants;
    };
```

## Type (`struct`, `typedef`)

```
    type = {
		CGFloat = TypesAndConstants;
		NSActivityOptions = TypesAndConstants;
		NSAttributedStringKey = TypesAndConstants;
		NSBinarySearchingOptions = TypesAndConstants;
		NSCalculationError = TypesAndConstants;
		NSComparisonResult = TypesAndConstants;
		NSDataBase64DecodingOptions = TypesAndConstants;
		NSDataBase64EncodingOptions = TypesAndConstants;
		NSDataSearchOptions = TypesAndConstants;
		NSDateFormatterBehavior = TypesAndConstants;
		NSDateFormatterStyle = TypesAndConstants;
		NSDirectoryEnumerationOptions = TypesAndConstants;
		NSEnumerationOptions = TypesAndConstants;
		NSErrorDomain = TypesAndConstants;
		NSExceptionName = TypesAndConstants;
		NSFormattingContext = TypesAndConstants;
		NSFormattingUnitStyle = TypesAndConstants;
		NSHTTPCookieAcceptPolicy = TypesAndConstants;
		"struct NSEdgeInsets" = TypesAndConstants;
		"struct _NSHandler" = TypesAndConstants;
		"struct _NSHashTableCallBacks" = TypesAndConstants;
		"struct _NSMapTableKeyCallBacks" = TypesAndConstants;
		"struct autorelease_array_list" = TypesAndConstants;
		"struct autorelease_thread_vars" = TypesAndConstants;
		unichar = TypesAndConstants;
    };
```

## Variable

```plist

    variable = {
		NSCocoaErrorDomain = TypesAndConstants;
		NSDeallocateZombies = TypesAndConstants;
		NSDefaultRunLoopMode = TypesAndConstants;
		NSMACHErrorDomain = TypesAndConstants;
		NSOSStatusErrorDomain = TypesAndConstants;
		NSPOSIXErrorDomain = TypesAndConstants;
		NSRunLoopCommonModes = TypesAndConstants;
		NSZombieEnabled = TypesAndConstants;
		"_NSConstantStringClassReference" = TypesAndConstants;
		"_NSLock_error_handler" = TypesAndConstants;
		"_NSLogDescriptor" = TypesAndConstants;
		"_NSLog_printf_handler" = TypesAndConstants;
		"enum _NSDirectoryEnumerationOptions" = TypesAndConstants;
		"gnustep_global_lock" = TypesAndConstants;
		"struct NSZoneStats" = TypesAndConstants;
		"struct _NSMapTableValueCallBacks" = TypesAndConstants;
		"struct _NSNotificationQueueList" = TypesAndConstants;
		"struct _NSPoint" = TypesAndConstants;
		"struct _NSRange" = TypesAndConstants;
		"struct _NSRect" = TypesAndConstants;
		"struct _NSSize" = TypesAndConstants;
		"struct _NSZone" = TypesAndConstants;
    };
```

## Files

### IGSDoc markup

#### Header file &rarr; GSDoc file

```
    output = {
        "../Headers/Foundation/NSAffineTransform.h" = (
            "../Documentation/Base/NSAffineTransform.gsdoc"
        );
        "../Headers/Foundation/NSArchiver.h" = (
            "../Documentation/Base/NSArchiver.gsdoc",
            "../Documentation/Base/TypesAndConstants.gsdoc"
        );
        "../Headers/Foundation/NSArray.h" = (
            "../Documentation/Base/NSArray.gsdoc"
        );
        "../Headers/Foundation/NSAttributedString.h" = (
            "../Documentation/Base/NSAttributedString.gsdoc"
        );
        "../Headers/Foundation/NSAutoreleasePool.h" = (
            "../Documentation/Base/NSAutoreleasePool.gsdoc"
        );
        "../Headers/Foundation/NSBundle.h" = (
            "../Documentation/Base/NSBundle.gsdoc",
            "../Documentation/Base/Functions.gsdoc",
            "../Documentation/Base/TypesAndConstants.gsdoc"
        );
        "../Headers/Foundation/NSCalendarDate.h" = (
            "../Documentation/Base/NSCalendarDate.gsdoc"
        );
        "../Headers/Foundation/NSCharacterSet.h" = (
            "../Documentation/Base/NSCharacterSet.gsdoc"
        );
        "../Headers/Foundation/NSClassDescription.h" = (
            "../Documentation/Base/NSClassDescription.gsdoc",
            "../Documentation/Base/TypesAndConstants.gsdoc"
        );
        "../Headers/Foundation/NSCoder.h" = (
            "../Documentation/Base/NSCoder.gsdoc"
        );
    };
```

#### Header file &rarr; Source file

```
    source = {
        "../Headers/Foundation/NSAffineTransform.h" = (
            "NSAffineTransform.m"
        );
        "../Headers/Foundation/NSArchiver.h" = (
            "NSUnarchiver.m",
            "NSArchiver.m"
        );
        "../Headers/Foundation/NSArray.h" = (
            "NSArray.m"
        );
        "../Headers/Foundation/NSAttributedString.h" = (
            "NSAttributedString.m"
        );
        "../Headers/Foundation/NSAutoreleasePool.h" = (
            "NSAutoreleasePool.m"
        );
    };
```


#### GSDoc file &rarr; Title
```
    title = {
		Base = "GNUstep Base";
		Functions = Functions;
		NSAffineTransform = "NSAffineTransform.m";
		NSArchiver = "NSArchiver class reference";
		NSArray = "NSArray class reference";
		NSAttributedString = "NSAttributedString class reference";
		NSAutoreleasePool = "NSAutoreleasePool class reference";
		NSBundle = "NSBundle class reference";
		NSCalendarDate = "NSCalendarDate class reference";
		NSCharacterSet = "NSCharacterSet class reference";
		NSClassDescription = "NSClassDescription class reference";
		NSCoder = "NSCoder class reference";
		NSConnection = "NSConnection class reference";
		NSData = "NSData class reference";
		NSDate = "NSDate class reference";
		NSDateFormatter = "NSDateFormatter class reference";
		NSDebug = "NSDebug utilities reference";
		NSDecimalNumber = "NSDecimalNumber class reference";
		NSDictionary = "NSDictionary class reference";
		TypesAndConstants = "Types and Constants";
    };
```


## End of document
```plist
}
```