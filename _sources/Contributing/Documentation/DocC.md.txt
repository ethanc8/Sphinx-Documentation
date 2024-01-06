# DocC

developer.apple.com uses DocC, and so does the documentation for Swift-DocC.

The DocC files are stored as JSON (see [example from Swift-DocC](https://www.swift.org/data/documentation/docc.json) and [example from `NSInteger`](https://developer.apple.com/tutorials/data/documentation/foundation/nsnumber.json?language=objc)).

Every single page is prefixed with the following:

```html
<!--
  This source file is part of the Swift.org open source project

  Copyright (c) 2021 Apple Inc. and the Swift project authors
  Licensed under Apache License v2.0 with Runtime Library Exception

  See https://swift.org/LICENSE.txt for license information
  See https://swift.org/CONTRIBUTORS.txt for Swift project authors
-->
```

This may have licensing implications.

* [Always Right Institute article](https://www.alwaysrightinstitute.com/docz/)