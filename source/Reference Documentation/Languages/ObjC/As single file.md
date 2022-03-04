# Objective-C Reference
## Table of Contents
<!-- TOC -->

* [Objective-C Reference](#objective-c-reference)
    * [Table of Contents](#table-of-contents)
    * [Documents](#documents)
* [Attributes](#attributes)
* [Storage class specifiers](#storage-class-specifiers)
    * [At block scope](#at-block-scope)
    * [At file scope](#at-file-scope)
    * [References](#references)
* [Availability attributes and checks](#availability-attributes-and-checks)
    * [Compilers](#compilers)
    * [References](#references)
    * [Notes](#notes)
* [Direct Methods](#direct-methods)
    * [Compilers](#compilers)
    * [Supported targets](#supported-targets)
    * [References](#references)
* [Memory management overview](#memory-management-overview)

<!-- /TOC -->
## Documents

[Objective-C Feature Availability Index](https://developer.apple.com/library/archive/releasenotes/ObjectiveC/ObjCAvailabilityIndex/index.html)

[Objective-C Release Notes (Mac OS X Leopard)](https://developer.apple.com/library/archive/releasenotes/Cocoa/RN-ObjectiveC/index.html)

[GCC 4.6](https://gcc.gnu.org/gcc-4.6/changes.html#objective-c)

[Clang 3.0](https://releases.llvm.org/3.0/docs/ClangReleaseNotes.html#objchanges) (XCode 3.1)

[Clang 3.1](https://releases.llvm.org/3.1/docs/ClangReleaseNotes.html)

[Clang 3.7](https://releases.llvm.org/3.7.0/tools/clang/docs/ReleaseNotes.html#objective-c-language-changes-in-clang)

[Clang Language Compatibility](https://clang.llvm.org/compatibility.html)

[Clang Objective-C Language Extensions](https://clang.llvm.org/docs/LanguageExtensions.html#objective-c-features)

# Attributes

[C23 attribute syntax](https://en.cppreference.com/w/c/language/attributes)

[GCC `__attribute__` syntax](https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html#Attribute-Syntax)

[Lists of GCC attributes](https://gcc.gnu.org/onlinedocs/gcc/index.html#toc-Declaring-Attributes-of-Functions)

[List of Clang attributes](https://clang.llvm.org/docs/AttributeReference.html)

# Storage class specifiers

## At block scope

| Name of specifier | Duration | Linkage | Notes |
| ----------------- | -------- | ------- | ----- |
| `auto` | current block | none | Default |
| `register` | current block | none | Cannot take address of |
| `__block` | current block | none | Clang-only. Can be used within block lambdas. Is actually an attribute. |
| `static` | entire program | none | Only initialized once |
| `extern` | entire program | external | Only initialized once |
| `static _Thread_local` | entire thread | internal | Only initialized once per thread |
| `extern _Thread_local` | entire thread | external | Only initialized once per thread |

## At file scope

| Name of specifier | Duration | Linkage | Notes |
| ----------------- | -------- | ------- | ----- |
| `static` | entire program | internal | Only initialized once |
| `extern` | entire program | external | Default. Only initialized once. |
| `_Thread_local` | entire thread | none | Only initialized once per thread |
| `static _Thread_local` | entire thread | internal | Only initialized once per thread |
| `extern _Thread_local` | entire thread | external | Only initialized once per thread |

## References

[Cppreference.com](https://en.cppreference.com/w/c/language/storage_duration)  
[Clang documentation on \_\_block](https://clang.llvm.org/docs/BlockLanguageSpec.html#the-block-storage-qualifier)

[C17 Standard draft sections 6.2.2 and 6.2.4](https://web.archive.org/web/20181230041359if_/http://www.open-std.org/jtc1/sc22/wg14/www/abq/c17_updated_proposed_fdis.pdf#page=48)  
[C17 Standard draft section 6.7.1](https://web.archive.org/web/20181230041359if_/http://www.open-std.org/jtc1/sc22/wg14/www/abq/c17_updated_proposed_fdis.pdf#page=98)

[NSHipster article](https://nshipster.com/c-storage-classes/)

# Availability attributes and checks

## Compilers

* Clang >= FIXME

## References

[Clang documentation on `__attribute__((availability))`](https://clang.llvm.org/docs/AttributeReference.html#availability)  
[Clang documentation on `@available` and `__builtin_available`](https://clang.llvm.org/docs/LanguageExtensions.html#objective-c-available)

[NSHipster article](https://nshipster.com/available/)

## Notes

Usable platform names:

* `android`
* `ios` or `iOS`
* `macos` or `macOS`
* `tvos` or `tvOS`
* `watchos` or `watchOS`
* `ios_app_extension` or `iOSApplicationExtension`
* `macos_app_extension` or `macOSApplicationExtension`
* `tvos_app_extension` or `tvOSApplicationExtension`
* `watchos_app_extension` or `watchOSApplicationExtension`
* `zos` (IBM z/OS)
* `swift` (Swift language version -- only applies when using Objective-C or C APIs from swift)

It appears you must use the lowercase name in `__attribute__((availability))`.

# Direct Methods

## Compilers

* Clang >= 10

## Supported targets

* macOS non-fragile runtime
* iOS
* watchOS
* tvOS (presumably)

## References

[Clang documentation on method attribute `__attribute__((objc_direct))`](https://clang.llvm.org/docs/AttributeReference.html#objc-direct)  
[Clang documentation on class/category/extension attribute `__attribute__((objc_direct_members))`](https://clang.llvm.org/docs/AttributeReference.html#objc-direct)

[NSHipster article](https://nshipster.com/direct/)  
Information from engineer on reasoning behind it:  
[Twitter](https://twitter.com/pedantcoder/status/1197269246289444864) \| [Thread Reader App](https://threadreaderapp.com/thread/1197269246289444864.html) \| [Nitter (.domain.glass)](https://nitter.domain.glass/pedantcoder/status/1197269246289444864)

# Memory management overview

There are five models:

* Manual allocation and deallocation
* Manual reference counting
* Apple deprecated garbage collector
* Boehm-Demers-Weiser garbage collector
* Automatic Reference Counting