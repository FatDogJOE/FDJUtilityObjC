//
//  APPUtility.m
//  FDJUtilityObjC
//
//  Created by mac on 2019/9/12.
//

#import "APPUtility.h"
#import "NSDictionary+FDJUtility.h"

@implementation APPUtility

+ (NSDictionary *)bundleInfoDic {
    return [[NSBundle mainBundle] infoDictionary];
}

+ (NSString *)appVersion {
    return [self bundleInfoDic].stringValue(@"CFBundleShortVersionString");
}
+ (NSString *)appDisplayName {
    if ([self bundleInfoDic].stringValue(@"CFBundleDisplayName").length > 0) {
        return [self bundleInfoDic].stringValue(@"CFBundleDisplayName");
    }else {
        return [self bundleInfoDic].stringValue(@"CFBundleName");
    }
}


@end
