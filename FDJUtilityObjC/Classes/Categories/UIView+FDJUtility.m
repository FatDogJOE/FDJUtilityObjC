//
//  UIView+FDJUtility.m
//  FDJUtilityObjC
//
//  Created by mac on 2019/10/16.
//

#import "UIView+FDJUtility.h"

@implementation UIView (FDJUtility)

- (UIView *)findView:(BOOL(^)(UIView * subView))filter {
    
    for (UIView * subView in self.subviews) {
        BOOL find = filter(subView);
        
        if (find) {
            return subView;
        }else {
            UIView * result = [subView findView:filter];
            if (result) {
                return result;
            }
        }
    }
    
    return nil;
}

@end
