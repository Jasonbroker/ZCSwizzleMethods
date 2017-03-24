//
//  UIFont+Swizzle.m
//  BedTime
//
//  Created by Jason on 2/6/15.
//  Copyright (c) 2015 Jason. All rights reserved.
//

#import "UIFont+Swizzle.h"
#import "NSObject+ZCSwizzle.h"

@implementation UIFont (Swizzle)

+ (void)load{
    
    [UIFont zc_swizzleClassMethod:@selector(systemFontOfSize:) newMethod:@selector(myFontOfSize:) error:nil];
     [UIFont zc_swizzleClassMethod:@selector(boldSystemFontOfSize:) newMethod:@selector(myboldFontOfSize:) error:nil];
    
}


+ (UIFont *)myFontOfSize:(CGFloat)fontSize{
    NSArray *arr        = [UIFont familyNames];
    NSInteger count     = arc4random_uniform((int)arr.count-1);
    NSString *fontName  = arr[count];
    
//return [UIFont fontWithName: @"Avenir-Light" size:fontSize];
    return [UIFont fontWithName:fontName size:fontSize];
    
}
+ (UIFont *)myboldFontOfSize:(CGFloat)fontSize{
    
    NSArray *fonts = [UIFont familyNames];
    NSInteger index = arc4random()%fonts.count;
    
    return [UIFont fontWithName:fonts[index] size:18];
}


@end
