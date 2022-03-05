# SourceKit

> SourceKit is a framework for supporting IDE features like indexing, syntax-coloring, code-completion, etc. In general it provides the infrastructure that an IDE needs for excellent language support.

SourceKit only supports parsing Swift.

* [C API - Header file](https://github.com/apple/swift/blob/main/tools/SourceKit/tools/sourcekitd/include/sourcekitd/sourcekitd.h)
    * API documentation coming soon -- use Doxygen
    * This API does not provide any facilities for using SourceKit -- it just allows you to send messages to and from the SourceKit daemon.
* [Swift bindings](https://github.com/rockbruno/SourceKitSampleProject/blob/master/Sources/MyProject/SourceKit/SourceKit.swift)
* [Protocol](https://github.com/apple/swift/blob/main/tools/SourceKit/docs/Protocol.md)
    * This will probably be useful if you're using the C API.

## References

* https://academy.realm.io/posts/appbuilders-jp-simard-sourcekit/
* https://github.com/jpsim/SourceKitten
* https://www.jpsim.com/uncovering-sourcekit/
* https://swiftrocks.com/code-generation-with-sourcekit
* https://ericasadun.com/2015/05/24/swift-so-that-whole-sourcekit-thing/#content-primary

### SourceKit-LSP

* https://nshipster.com/vscode/

### Linux installation

* https://www.raywenderlich.com/8325890-a-complete-guide-to-swift-development-on-linux
* https://pvzig.medium.com/swift-development-with-visual-studio-code-on-linux-99cac3918582
* 