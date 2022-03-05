# Headers missing from Swift CF or from CoreBase

Comparing [macOS 11.3 SDK](https://github.com/phracker/MacOSX-SDKs/tree/master/MacOSX11.3.sdk/System/Library/Frameworks/CoreFoundation.framework/Versions/A/Headers) with [macOS 12 FOSS subset](https://github.com/apple/swift-corelibs-foundation/tree/d8e8a8b92b3a8af8381a11155328c1bba1c6bd2c/CoreFoundation)

| Header                   | SDK | FOSS Subset | CoreBase |
| ------------------------ | --- | ----------- | -------- |
| **AppServices**          |     |             |          |
| `CFNotificationCenter.h` |     | X           |          |
| `CFUserNotification.h`   |     | X           |          |
| **Base**                 |     |             |          |
| `CFAsmMacros.h`          |     | X           |          |
| `CFAvailability.h`       |     | X           |          |
|                          |     |             |          |