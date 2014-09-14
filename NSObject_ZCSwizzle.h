//
//  NSObject_ZCSwizzle.h
//  
//
//  Created by Jason Zhou on 8/14/13.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (ZCSwizzle)

+ (BOOL)zc_swizzleMethod:(SEL)origSelector withMethod:(SEL)altSelector error:(NSError**)error;

+ (BOOL)zc_swizzleClassMethod:(SEL)origSelector withClassMethod:(SEL)altSelector error:(NSError**)error


@end
