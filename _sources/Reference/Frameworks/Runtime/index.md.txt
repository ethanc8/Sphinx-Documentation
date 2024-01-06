# Objective-C Runtime

## Apple modern runtime (objc4)

[Source code](https://github.com/apple-oss-distributions/objc4)

[Reference](https://developer.apple.com/documentation/objectivec/objective-c_runtime?language=objc)

[Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Introduction/Introduction.html?language=objc#//apple_ref/doc/uid/TP40008048)

### Detect this runtime

After importing `<objc/objc.h>`, check for the following macros being defined:

| Macro | Meaning | Values |
| --- | --- | --- |
| `_OBJC_OBJC_H_` | Include guard |
| `OBJC_API_VERSION` | Objective-C runtime API version | `0` / undefined: Old API |
| | | `2`: Modern API |

```
#ifdef _OBJC_OBJC_H_
#   ifdef OBJC_API_VERSION
#       if OBJC_API_VERSION >= 2
#           define EC_ObjectiveC_Runtime_Apple_Modern
#       else
#           define EC_ObjectiveC_Runtime_NeXT_Apple
#       endif
#   else
#       define EC_Objective_C_Runtime_NeXT_Apple
#   endif
#endif /* _OBJC_OBJC_H_ */
```

## GCC new runtime (>= 4.6.0)

The headers define `__GNU_LIBOBJC__` to the current version of the GCC runtime.

[Source code](https://github.com/gcc-mirror/gcc/tree/master/libobjc)

## GNUstep runtime (libobjc2)

The headers define `__GNUSTEP_RUNTIME__`.

[Source code](https://github.com/gnustep/libobjc2)