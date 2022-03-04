> This is a transcription of the WWDC15 talk *Swift and Objective-C Interoperability*.

> ### 401. *Swift and Objective-C Interoperability* 
> [Video](https://developer.apple.com/videos/play/wwdc2015/401/) | [SD Video (MP4)](https://devstreaming-cdn.apple.com/videos/wwdc/2015/401gee20yy5v2men/401/401_sd_swift_and_objectivec_interoperability.mp4) | [HD Video (MP4)](https://devstreaming-cdn.apple.com/videos/wwdc/2015/401gee20yy5v2men/401/401_hd_swift_and_objectivec_interoperability.mp4) | [Slideshow (PDF)](https://devstreaming-cdn.apple.com/videos/wwdc/2015/401gee20yy5v2men/401/401_swift_and_objectivec_interoperability.pdf?dl=1) | [Transcript](https://asciiwwdc.com/2015/sessions/401)

> This part of the talk was presented by Doug Gregor.

> I have reformatted the code a bit to make it more readable, but this way doesn't follow Apple's style.

So today I would like to talk about three new Objective-C features we've added this year.

These features can be used to make your Objective-C code better, your Objective-C APIs better, make them reflect better into Swift, and improve static type safety in your Objective-C. The first thing we are going to talk about is nullability for Objective-C.

# Nullability for Objective-C

> **Time**: 14:34

So take a look at this bit of Objective-C code.

> ## Which Pointers can be `nil`?
> ### Objective-C
> ```objc
> @interface UIView
> @property(nonatomic,readonly) UIView* superview;
> @property(nonatomic,readonly,copy) NSArray* subviews;
> - (UIView*) hitTest: (CGPoint) point withEvent: (UIEvent*) event;
> @end
> ```

Which one of these can be `nil`? The code doesn't tell you.

If you go read the documentation, maybe it will tell you if you are feeling lucky today.

You could go write some tests and see what you think it behaves like or maybe guess, but that's not really good. There's really missing information here.

When we introduced Swift last year, this lack of information became much more apparent in these implicitly unwrapped optionals, which essentially means we don't know if it can be nil on the Swift side.

> ## Which Pointers can be `nil`?
> ### Objective-C
> ```objc
> @interface UIView
> @property(nonatomic,readonly) UIView* superview;
> @property(nonatomic,readonly,copy) NSArray* subviews;
> - (UIView*) hitTest: (CGPoint) point withEvent: (UIEvent*) event;
> @end
> ```
> ### Swift 1.0
> ```swift
> class UIView {
>   var superview: UIView!
>   var subviews: [AnyObject]!
>   func hitTest(point: CGPoint, withEvent: UIEvent!) -> UIView!
> }
> ```

So we weren't too thrilled with this, and so after releasing Swift 1.0, we went and audited a couple thousand pointers within our own core frameworks to tell the compiler which of these pointers can be nil. And the interfaces after this audit got much, much cleaner.

> ## Nullability Audit
> ### Objective-C
> ```objc
> @interface UIView
> @property(nonatomic,readonly) UIView* superview;
> @property(nonatomic,readonly,copy) NSArray* subviews;
> - (UIView*) hitTest: (CGPoint) point withEvent: (UIEvent*) event;
> @end
> ```
> ### Swift 1.1
> ```swift
> class UIView {
>   var superview: UIView?
>   var subviews: [AnyObject]
>   func hitTest(point: CGPoint, withEvent: UIEvent?) -> UIView?
> }
> ```

Now, we are only using optional types where nil is actually something you have to deal with, and everything else is non-optional.

This is still not that wonderful, because this knowledge is baked into the compiler. It's not something you can do.

So with Xcode 6.3, we introduced nullability qualifiers for Objective-C.

> ## Nullability Qualifiers for Objective-C
> 
> Indicate whether Objective-C/C pointers can be `nil`
> * Better communicates the intent of APIs
> * Allows improved static checking
> * Improves usability of APIs into Swift

So a nullability qualifier is something you can add to a C/Objective-C pointer to state whether it accepts `nil` or not. Of course, this better communicates what your API actually does. Does it accept `nil`? Does that make sense for it? It helps our tools do better static checking to catch bugs before they manifest at run time, and it makes the Swift experience so much better with your Objective-C APIs! Now, there are three nullability qualifiers.

> ## Nullability Qualifiers
> ##

# Lightweight Generics for Objective-C

> **Time**: 21:40

Alright, let's come on to the next feature. This is a big one. Lightweight generics for Objective-C. Now, the origin of this feature, it's actually fairly easy to motivate. Collections.

> ## Collections
> ### Objective-C
> ```objc
> @interface UIView
> @property(nonatomic,readonly,copy) NSArray* subviews;
> @end
> ```

Here we have this `NSArray` of subviews. What's in the array? We don't say what's in the array. We bring this into Swift and you say, ah, it's an array of `AnyObject`, of course. That still tells me absolutely nothing.

I have to cast a lot. That's what it tells me.

> ## Typed Collections
> 
> Allow collections to be parameterized by element type
> * "An array of views"
> * "A dictionary mapping strings to images"

So we have had, of course, this common request for typed collections.

Because people really want to say I have an array of views. I have a dictionary that maps from string keys over to the images associated with those keys.

This has been probably been the most highly requested feature for the last decade of Objective-C.

> ## Typed Collections
> 
> Allow collections to be parameterized by element type
> * "An array of views"
> * "A dictionary mapping strings to images"
>
> Lightweight generics for Objective-C
> * Improve expressibity of APIs
> * Make collections easier to use
> * Enable better static type checking

So, now we are finally rolling it out with lightweight generics for Objective-C. So this is a general language feature that can be used to improve the expressivity of your APIs; it makes collections way easier to use now that we have all the static type safety of typed collections. Let's take a look.

> ## Typed Collections
> ### Objective-C
> ```objc
> @interface UIView
> @property(nonatomic,readonly,copy) NSArray* subviews;
> @end
> ```

So here's our subviews property again.

> ## Typed Collections
> ### Objective-C
> ```objc
> @interface UIView
> @property(nonatomic,readonly,copy) NSArray* subviews;
> @end
> ```

To make this an array of `UIView`s, we just place `UIView*`, so `UIView` pointer, in angle brackets. Same syntax you have seen. Whoops, sorry.

The same syntax you have seen from Swift and C++ and C-Sharp, et cetera, et cetera. Yes, we are completely aware that angle brackets are "protocol qualifiers". Don't worry, we've got it. So this introduces more type information into Objective-C. Of course, this reflects into Swift as much more beautiful type information. But really I want to talk about the Objective-C effect because this is a really useful feature for Objective-C. 

> ## Type Safety for Typed Collections
> ```objc
> NSURL* url = …;
> NSArray<NSURL*>* components = url.pathComponents; 
> ```

Because let's talk about type safety. Here's an example. So I'm taking the path components of any URL, `NSURL`. And I'm putting it into an array of URLs. That almost seems reasonable if I didn't know this API and it would be a while before I got the run time error, the unrecognized selector that points out that no, I'm completely wrong in my usage of path components.

> ## Type Safety for Typed Collections
> ```objc
> NSURL *url = …;
> NSArray<NSURL*>* components = url.pathComponents; 
> ```
> > **warning**: incompatible pointer types intializing `NSArray<`**`NSURL`**` *>*` with `NSArray<`**`NSString`**` *>*`

With typed collections and, of course, us rolling out typed collections throughout our SDKs, now you get a warning to tell you just what you did wrong at the point where it happens. 

> ## Type Safety for Typed Collections
> ```objc
> NSURL *url = …;
> NSArray<NSURL*>* components = url.pathComponents; 
> ```
> > **warning**: incompatible pointer types intializing `NSArray<`**`NSURL`**` *>*` with `NSArray<`**`NSString`**` *>*`
> ```objc
> NSMutableArray<NSString*>* results = …;
> [results addObject: @17];
> ```
> > **warning**: incompatible pointer types sending **`NSNumber`**` *` to parameter of type **`NSString`**` *`

Many other cases here -- say I'm building up a mutable array of `NSStrings` and I foolishly go and add something to that array without turning it into a string first, okay, the compiler is going to tell me, no, you can't put an `NSNumber` into this `NSMutableArray` of strings. It doesn't make sense. Now, the compiler actually has fairly deep knowledge of the semantics here of the Cocoa collections.

> ## Type Safety for Typed Collections
> ```objc
> NSArray<UIView*>* views;
> NSArray<UIResponder*>* responders = views; 
> ```

So let's take this example here, we have an array of views, we have an array of responders. We assign from the array of views to the array of responders, okay every view is a responder. This seems fine. It is okay.

Let's do the same thing with the mutable variant.

> ## Type Safety for Typed Collections
> ```objc
> NSMutableArray<UIView*>* storedViews;
> NSMutableArray<UIResponder*>* storedResponders = storedViews;
> ```

So we take the stored mutable array of views and assign it over to the stored mutable array of responders. There's a trap here.

The trap, of course, is I can go ahead and mutate my stored responders, put something in there that's a responder but not a view.

Now, something later on is getting very, very confused that the array of views it's looking at has a view controller in it, not a view.

> ## Type Safety for Typed Collections
> ```objc
> NSMutableArray<UIView*>* storedViews;
> NSMutableArray<UIResponder*>* storedResponders = storedViews;
> ```
>
> > **warning**: incompatible pointer types intializing `NSArray<`**`UIResponder`**` *>*` with `NSArray<`**`UIView`**` *>*`


Compiler understands this is as well.

It will complain at the point of initialization, here, that while it's perfectly safe to do this kind of assignment with immutable arrays because they don't change from underneath you, it is not safe to do with the mutable variants.

Alright. You have actually seen all you need to use lightweight generics and typed collections throughout your applications. But let's take a look at how we use this within Foundation itself, to actually create typed collections. 

Because the feature here is generics. Typed collections is one of the outcomes of it.

So here we have `NSArray` as you are used to seeing it.

> ## Type Safety for Typed Collections
> ```objc
> @interface NSArray : NSObject
>
>
> 
> @end
> ```

Now we are going to parameterize it, based on the object type that's stored in the `NSArray`, again, using angle brackets.

We are just introducing a name here.

> ## Type Safety for Typed Collections
> ```objc
> @interface NSArray<ObjectType> : NSObject
> - (ObjectType) objectAtIndex: (NSUInteger) index;
> - (instancetype) initWithObjects: (const ObjectType[]) objects
>                           count: (NSUInteger) cnt;
> - (NSArray<ObjectType>*) arrayByAddingObject: (ObjectType) anObject;
> @end
> ```
> * Type paramaters specified in `<`...`>`
> * Type peramaters can be used throughout that interface

We can use that name throughout the interface, so, of course, object at index, returns something of the object type.

If we go ahead and add other methods here.

When you initialize with objects the array you get in, the C-array, contains objects.

Use array by adding object.

You put in a new object, you get an NSArray of objects.

So it composes very, very, very nicely.

Of course this also works for categories and extensions.

> ## Categories and Extensions
> ```objc
> @interface NSDictionary<KeyType, ObjectType> (Lookup)
> - (nullable ObjectType) objectForKey: (KeyType) aKey;
> @end
>
> @interface NSDictionary (Counting)
> @property(readonly) NSUInteger count;
> @end
> ```

Here we have an `NSDictionary` category, parameterized on the key type and the object type, and we have gone ahead and added `objectForKey:` here, takes in a `KeyType`, returns a nullable object type because, of course, `nil` matters here and we want to have that information in our APIs.

Now, of course, there are existing categories defined on `NSDictionary`, `NSArray`, and so on, you may have some yourself.

Those will continue to work as they always have.

They cannot access the type parameters in any way, but they also won't change behavior at all, they will continue working as they always have.

> ## Backward Compatibility
> Type erasure model provides binary compatibility
> * No changes to the Objective-C runtime
> * Zero impact on code generation

That brings me to backward compatibility.

So the entire lightweight generics feature is based on a type erasure model.

Which means that the compiler has all of this rich static type information but it erases that information when generating code.

There's huge benefits here for Objective-C, that we did not have to make any changes to the Objective-C run time to make this feature work.

That means we are able to roll out generics and typed collections, you can adopt them in all of your applications and it does not affect your ability to deploy back to existing operating systems.

*[Applause]*

And if it wasn't obvious from that description, of course, we are also not going to change code generation in any way.

We're not adding runtime checking to Objective-C that doesn't make sense in Objective-C.

We just maintain full binary compatibility.

So adopt this feature, enjoy the warnings preventing you from making horrible mistakes.

And you can adopt it very, very, very ... gradually, I guess is the best term here.

> ## Backward Compatibility
> Type erasure model provides binary compatibility
> * No changes to the Objective-C runtime
> * Zero impact on code generation
> Implicit conversions provide source compatibility:
> ```objc
> NSArray<NSString *>* strings = …;
> NSArray* array = …;
> array = strings; // okay, drops type arguments
> strings = array; // okay, adds type arguments
> ```

So in addition to binary compatibility, we want to provide source compatibility, because we have rolled this feature out through our SDKs.

We don't want you to have to update all of your source code to use these things everywhere.

We want you to gradually adopt it.

Use it where it makes sense for you.

And so we provided these implicit conversions in the language that allow you to add type arguments or take them away.

Okay? Again, there's no run time cost to doing this.

But it lets you get in and get out of the generic system as you need.

So all of your new code can be written with generics and if you don't want to touch your old code, that's perfectly line.

It's not going to change.

All right.

# "Kindof" types

We have one last feature to talk about, this one's kind of cool.

So kindof types.

Actually, came out of our work on lightweight generics.

And so we started with, of course, using the untyped collection here for subviews, and there's code that may go grab a view and send some message to it.

This code is fine.

It works today.

We went ahead and did these annotations to say, okay, subviews contains UI views and now we get some warnings.

The compiler is completely justified in giving this warning.

It knows now that the first subview is a UI view.

It can't know that you know it's a UI button that would actually respond to this selector.

And so while the compiler is right, it's not necessarily useful to be producing warnings on all of this code.

You get a raft of warnings most of which would be benign and you would be adding casts everywhere.

This really forced us to consider ID and how it's used as an API contract.

And so let's make this a little simpler example.

Let's talk about NSApp, which is this global in Cocoa that gives you access to your NSApplication instance.

Now, what this really means is NSApp is a subclass of NSApplication.

But we couldn't describe that to the type system.

With kindof types, we can say this exactly in Objective-C.

What does this mean?

This means NSApp is some kind of application.

So we are going to give it some limited behavior, like ID.

So I have my NSApp, of course I can convert it to an NSObject because every NSApplication is an NSObject.

The important part here, the ID-like behavior, is the implicit downcast from NSApplication to your MyApplication subclass.

That's good.

We want that behavior because that's how NSApp has always worked.

Now, what we won't allow is some silly cross-cast.

You tried to use NSApp in a string?

Well, that's not an NSApplication and never can be.

So you can produce a warning there.

Of course, coming with this is the notion that you can message NSApp and get all of the methods that are in NSApplication, its superclasses, and its subclasses.

Now, with kindof types we actually found that this is much more useful than ID.

Because it gives you more type information in the API contract which is great for both Swift and Objective-C.

So here we have this NS tableview method, you have column, row, makeIfNecessary.

It's always returned to ID, because that implicit downcasting behavior is important.

Well, now we can rewrite it as a kindof NSview.

So returning some kind of NSView, and on the Swift side, ah, now we are returning an optional NSView.

That's the right API for Swift and it works beautifully in Objective-C.

Let's bring it back to our original example with lightweight generics.

Here we were with our subviews stated as an NSArray of UIViews.

Well, now we can state that it's an NSArray of kinds of UI views.

So we get the stronger API contract in Objective-C and Swift.

It's far easier to tell what this property is, but you don't cause any spurious warnings because you still have that nice, implicit downcasting behavior from ID.

Hopefully this leads you to a question.

Should I even use ID in an API?

Over the years we have actually been rolling out a lot of features that give more specific type information than ID for various important scenarios.

And the same year we introduced Arc, we introduced instance type, which says that the method you are calling returns something of the same dynamic type as self.

This year we are introducing type collections that eliminate tons of uses of ID.

From our own APIs we have been rolling out these features and, of course, from your APIs when you adopt this feature.

We now have kindof X to talk about any subclass of X with implicit downcasting.

So you can keep your code working, at least all the actually working code that's not doing weird things, but have a better API contract, and, of course, protocols have been in Objective-C for a very, very long time and using ID of some protocol is a great way to say I don't care what the class type is.

It just has to conform to this protocol.

So there's one major class of uses for ID.

And that's when you really, really do mean an object of any type.

And there's no static type information that could make that statement better.

So, a canonical example here is the user info dictionary.

You have string keys and you have ID for the values.

It's completely reasonable because the different keys will have different types in those values and it's something you can only determine dynamically.

