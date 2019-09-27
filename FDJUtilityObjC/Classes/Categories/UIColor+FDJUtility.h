//
//  UIColor+FDJUtility.h
//  FDJUtility
//
//  Created by mac on 2019/9/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (FDJUtility)

+ (instancetype)fdj_colorWithHex:(UInt32)hex;
+ (instancetype)fdj_colorWithHex:(UInt32)hex alpha:(CGFloat)alpha;

- (UIImage *)fdj_getImage;
- (UIImage *)fdj_getImageWithSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
