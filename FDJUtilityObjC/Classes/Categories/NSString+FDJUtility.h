//
//  NSString+FDJUtility.h
//  FDJUtility
//
//  Created by mac on 2019/9/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FDJUtility)

- (NSString * (^)(void))fdj_md5;
- (NSString * (^)(void))fdj_sha1;
- (NSString * (^)(void))fdj_sha256;
- (NSString * (^)(void))fdj_sha512;
- (NSString * (^)(void))fdj_base64;

- (NSData * (^)(void))fdj_md5Data;
- (NSData * (^)(void))fdj_sha1Data;
- (NSData * (^)(void))fdj_sha256Data;
- (NSData * (^)(void))fdj_sha512Data;
- (NSData * (^)(void))fdj_base64Data;

@end


@interface NSString (JOINT)

- (NSString * (^)(NSString * ))fdj_append;
- (NSString * (^)(NSString *, ...))fdj_appendFormat;
- (NSString * (^)(NSString *, NSString *))fdj_replace;

@end

NS_ASSUME_NONNULL_END
