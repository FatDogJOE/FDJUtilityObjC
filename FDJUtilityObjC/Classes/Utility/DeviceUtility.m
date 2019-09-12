//
//  DeviceUtility.m
//  FDJUtilityObjC
//
//  Created by mac on 2019/9/12.
//

#import "DeviceUtility.h"
#import <SAMKeychain/SAMKeychain.h>

@implementation DeviceUtility

+ (NSString *)systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}
+ (NSString *)deviceUUID {
    
    NSString * uuid = [SAMKeychain passwordForService:@"DeviceUtility" account:@"GetUUID"];
    
    if (uuid.length == 0) {
        uuid = [UIDevice currentDevice].identifierForVendor.UUIDString;
        [SAMKeychain setPassword:uuid forService:@"DeviceUtility" account:@"GetUUID"];
    }
    
    return uuid;
}

+ (BOOL)bangDevice {

    if (@available(iOS 11.0, *)) {
        UIWindow * window = [UIApplication sharedApplication].delegate.window;
        if (window.safeAreaInsets.bottom > 0.0) {
            return YES;
        }else {
            return NO;
        }
    }else {
        return NO;
    }

}

@end
