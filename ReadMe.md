#ZCSwizzle

This is a catergray 4 iOS2.0+, objC 2.0+.

It contains 2 main methods to exchange methods (expecially for system methods);

You can easily do some jobs like try to add a nil into an array or a nil as a key or value in dictionary with commpletely no crash.

But the main use is for system and screen fitting.

If the selector you give is not exist, it will print out an NSError log. So dont worry about the crash, most of the things is considered!

**However, DONT TRY TO USE THIS FRAMEWORK IN COCOA(OS X)**

IT IS LIGHTWEIGHT FRAMEWORK AND OSX IS NOT SUPPORTED!

I am an iOS developer and OS X is beyond me. Sry guys.

Simply use it:

    + (BOOL)zc_swizzleMethod:(SEL)origSelector withMethod:(SEL)altSelector error:(NSError**)error;
    + (BOOL)zc_swizzleClassMethod:(SEL)origSelector withClassMethod:(SEL)altSelector error:(NSError**)error


license: MIT 

