//
//  NSArray+FDJUtility.h
//  FDJUtilityObjC
//
//  Created by mac on 2019/10/16.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (FDJUtility)

- (NSArray *)repetitiveElements:(NSArray *)array primaryKey:(NSString * _Nullable)primaryKey;

@end

NS_ASSUME_NONNULL_END
