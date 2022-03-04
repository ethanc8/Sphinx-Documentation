# Property List (plist)

On GNUstep, plists are stored in a format based on the format used by OpenStep.

On Apple platforms, it is not possible to write an OpenStep property list, or to read or write a GNUstep property list, without using an external library.

## String

A string is enclosed in double quotation marks:

```plist
"Hello World!"
```

A single word can be stored without any quotes:

```plist
GNUstep
```

### Escape sequences

| Sequence                 | Meaning                      |
| ------------------------ | ---------------------------- |
| `\\`                     | `\`                          |
| `\"`                     | `"`                          |
| `\b`                     | Backspace                    |
| `\n`                     | New line                     |
| `\r`                     | Carriage return              |
| `\`*three octal digits*  | An ASCII character (000-177) |
| `\U`*hexadecimal digits* | A Unicode character          |


## Array

An array is enclosed in parentheses, with the elements separated by commas:

```plist
(GNUstep, 3, "Hello World!", NeXT, spam, eggs, "spam and eggs")
```

## Dictionary

A dictionary is enclosed in curly braces:

```plist
{
    name = "John Doe"
    username = jdoe
    email = "jdoe@example.com"
    occupation = Secretary
    company = "Falcot Corp"
    gender = Male
    "health status" = good
}
```

## Binary data

Binary data is represented by a string of hexadecimal characters enclosed in curly braces. Spaces are ignored:

```plist
< 54637374 696D67 >
```

## Dates

```{note}
This is a GNUstep extension, and is not available in OpenStep plists.
```

Dates start with `<*D` and end with `>`, in the format YYYY-MM-DD HH:MM:SS +/-ZZZZ:

```plist
<*D2002-03-22 11:30:00 +0100>
```

meaning 2002 March 22 at 11:30 Central European Time.

## Numbers

```{note}
This is a GNUstep extension, and is not available in OpenStep plists.
```

### Booleans

`<*BY>` represents `YES`, while `<*BN>` represents `NO`.

### Integers

`<*I`*the number*`>`

### Real numbers

`<*R`*the number*`>`

## References
* [GNUstep API reference for `NSPropertyList`](http://www.gnustep.org/resources/documentation/Developer/Base/Reference/NSPropertyList.html)
* [GNUstep wiki page](http://wiki.gnustep.org/index.php/Property_Lists)
* [Apple - Property List Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/PropertyLists/OldStylePlists/OldStylePLists.html)