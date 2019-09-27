//
//  UIColor+FDJUtility.m
//  FDJUtility
//
//  Created by mac on 2019/9/10.
//

#import "UIColor+FDJUtility.h"

@implementation UIColor (FDJUtility)

+ (instancetype)fdj_colorWithHex:(UInt32)hex {
    return [UIColor fdj_colorWithHex:hex alpha:1];
}

+ (instancetype)fdj_colorWithHex:(UInt32)hex alpha:(CGFloat)alpha {
    
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8)  & 0xFF;
    int b = (hex)       & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
}

- (UIImage *)fdj_getImage {
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, self.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

- (UIImage *)fdj_getImageWithSize:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, self.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
