# Classes

Classes allow the programmer to define types which can be messaged, can create objects, and are polymorphic.

> **Note**: This document quotes from https://en.cppreference.com/w/c/language/struct, dual-licensed under the CC-BY-SA 3.0 and unversioned GFDL with no invariant sections, front-cover texts, or back-cover texts.

## Forward declaration

`@class` *name* `;`

This declares that a class with the name *name* exists. After this, the type *name* is now defined.

This works similary to forward-declaring a struct, but you cannot use the keyword `@class` outside of a forward-declaration.

> The following are **invalid**:
> ```objc
> id greet(@class NSGreeter aGreeter)
> ```
> ```objc
> @class NSGreeter myGreeter = [[NSGreeter alloc] init]
> ```

## Class interface

[ *attr-spec-seq* ]  
`@interface` *name* [ `<` *generic-param* `>` ] [ `:` *superclass-name* ] [ `<` *protocol-list* `>` ]   
[ `{` *ivar-declaration-list* `}` ]  
[ *method-declaration-list* ]  
`@end`

> ***attr-spec-seq*** (optional)  
> Attributes to add to the class

> ***name***  
> The name of the class being defined

> ***generic-param*** (optional)  
> A typename parameter.
> See [Lightweight Generics](Lightweight%20Generics.md)

> ***superclass-name*** (optional)  
> The superclass of the class being defined

> ***ivar-declaration-list***  
> A list of variables that each instance of the class will have in their storage.

> ***method-declaration-list***  
> A list of method declarations. See [&sect; Methods](#More) for more information.

## Class implementation

## Methods
