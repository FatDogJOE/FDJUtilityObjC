//
//  DeviceUtility.h
//  FDJUtilityObjC
//
//  Created by mac on 2019/9/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceUtility : NSObject

+ (NSString *)systemVersion;
+ (NSString *)deviceUUID;

+ (BOOL)bangDevice;


@end

NS_ASSUME_NONNULL_END
