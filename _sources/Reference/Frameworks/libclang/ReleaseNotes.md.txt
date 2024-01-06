# Release Notes

## 5.0.0

[External link](https://releases.llvm.org/5.0.0/tools/clang/docs/ReleaseNotes.html#libclang)

* Libclang now provides code-completion results for more C++ constructs and keywords. The following keywords/identifiers are now included in the code-completion results: static_assert, alignas, constexpr, final, noexcept, override and thread_local.

*   Libclang now provides code-completion results for members from dependent classes. For example:

```c++
    template<typename T>
    void appendValue(std::vector<T> &dest, const T &value) {
        dest. // Relevant completion results are now shown after '.'
    }
```
Note that code-completion results are still not provided when the member expression includes a dependent base expression. For example:
```c++
    template<typename T>
    void appendValue(std::vector<std::vector<T>> &dest, const T &value) {
        dest.at(0). // Libclang fails to provide completion results after '.'
    }
```

## 9.0.0

* When `CINDEXTEST_INCLUDE_ATTRIBUTED_TYPES` is not provided when making a CXType, the equivalent type of the AttributedType is returned instead of the modified type if the user does not want attribute sugar. The equivalent type represents the minimally-desugared type which the AttributedType is canonically equivalent to.

## 10.0.0

* Various changes to reduce discrepancies in destructor calls between the generated `CFG` and the actual `codegen`.

  In particular:

  * Respect C++17 copy elision; previously it would generate destructor calls for elided temporaries, including in initialization and return statements.
  * Don’t generate duplicate destructor calls for statement expressions.
  * Fix initialization lists.
  * Fix comma operator.
  * Change printing of implicit destructors to print the type instead of the class name directly, matching the code for temporary object destructors. The class name was blank for lambdas.

## 12.0.0

These release notes probably weren't written. They came as:

* ...

## 13.0.0



