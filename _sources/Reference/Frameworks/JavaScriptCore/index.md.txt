# JavaScriptCore

JavaScriptCore is [WebKit](../WebKit/index.md)'s JavaScript engine. It has multiple APIs to let you use JavaScript from your code.

## APIs

There are APIs for multiple programming languages.

* C (Core Foundation-style)
    * [Sources](https://github.com/WebKit/WebKit/tree/main/Source/JavaScriptCore/API)
    * [API reference](https://developer.apple.com/documentation/javascriptcore/c_javascriptcore_api?language=objc)
    * [Tutorial](https://karhm.com/javascriptcore_c_api/)
    * Available on GTK and Cocoa ports (might also be available elsewhere)
    * Headers:
```
/usr/include/webkitgtk-4.0/JavaScriptCore/JSBase.h
/usr/include/webkitgtk-4.0/JavaScriptCore/JSContextRef.h
/usr/include/webkitgtk-4.0/JavaScriptCore/JSObjectRef.h
/usr/include/webkitgtk-4.0/JavaScriptCore/JSStringRef.h
/usr/include/webkitgtk-4.0/JavaScriptCore/JSTypedArray.h
/usr/include/webkitgtk-4.0/JavaScriptCore/JSValueRef.h
/usr/include/webkitgtk-4.0/JavaScriptCore/JavaScript.h
/usr/include/webkitgtk-4.0/JavaScriptCore/WebKitAvailability.h
```
* GObject
