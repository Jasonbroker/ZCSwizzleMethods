//
//  NSObject_ZCSwizzle.m
//  
//
//  Created by Jason Zhou on 8/14/13.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

#define GetClass(obj)	object_getClass(obj)

#define SetNSErrorFor(FUNC, ERROR_VAR, FORMAT,...)	\
if (ERROR_VAR) {	\
NSString *errStr = [NSString stringWithFormat:@"%s: " FORMAT,FUNC,##__VA_ARGS__]; \
*ERROR_VAR = [NSError errorWithDomain:@"NSCocoaErrorDomain" \
code:-1	\
userInfo:[NSDictionary dictionaryWithObject:errStr forKey:NSLocalizedDescriptionKey]]; \
}
#define SetNSError(ERROR_VAR, FORMAT,...) SetNSErrorFor(__func__, ERROR_VAR, FORMAT, ##__VA_ARGS__)


@implementation NSObject (ZCSwizzle)

+ (BOOL)zc_swizzleMethod:(SEL)origSelector newMethod:(SEL)altSelector error:(NSError**)error
{
    Method origMethod = class_getInstanceMethod(self, origSelector);
    if (nil == origMethod) {
    
        SetNSError(error, @"original method %@ not found in class %@", NSStringFromSelector(origSelector), [self class]);
        
        return NO;
        
    }
    
    	Method altMethod = class_getInstanceMethod(self, altSelector);
    if (nil == altMethod) {

    SetNSError(error, @"alternate method %@ not found in class %@", NSStringFromSelector(altSelector), [self class]);
     
        return NO;
    }
    
//    swizzle 
    class_addMethod(self,
                    origSelector,
                    class_getMethodImplementation(self, origSelector),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSelector,
                    class_getMethodImplementation(self, altSelector),
                    method_getTypeEncoding(altMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, altSelector), class_getInstanceMethod(self, altSelector));
    
    return YES;
}

+ (BOOL)zc_swizzleClassMethod:(SEL)origSelector newMethod:(SEL)altSelector error:(NSError**)error {
        
        Method origMethod = class_getClassMethod([self class], origSelector);
        if (nil == origMethod) {
            return NO;
        }
        
        Method altMethod = class_getClassMethod([self class], altSelector);
        if (nil == altMethod) {
            return NO;
        }
    
            method_exchangeImplementations(origMethod, altMethod);
    
        return YES;
}
    
@end
