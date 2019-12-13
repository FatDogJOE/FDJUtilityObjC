//
//  NSString+FDJUtility.m
//  FDJUtility
//
//  Created by mac on 2019/9/10.
//

#import "NSString+FDJUtility.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (FDJUtility)


#pragma mark - String
- (NSString * (^)(void))fdj_md5 {
    return ^NSString * {
        const char * plain = [self UTF8String];
        unsigned char * digest = malloc(CC_MD5_DIGEST_LENGTH);
        
        CC_MD5(plain, (CC_LONG)strlen(plain), digest);
        
        NSData * resultData = [NSData dataWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
        
        NSMutableString * hash = [NSMutableString string];
        
        for (int i = 0; i < resultData.length; i++) {
            
            uint8_t bytes;
            
            [resultData getBytes:&bytes range:NSMakeRange(i, 1)];
            
            [hash appendFormat:@"%02x",bytes];
            
        }
        
        return [hash mutableCopy];
    };
}

- (NSString * (^)(void))fdj_sha1 {
    return ^NSString * {
        const char * plain = [self UTF8String];
        unsigned char * digest = malloc(CC_SHA1_DIGEST_LENGTH);
        
        CC_SHA1(plain, (CC_LONG)strlen(plain), digest);
        
        NSData * resultData = [NSData dataWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
        
        NSMutableString * hash = [NSMutableString string];
        
        for (int i = 0; i < resultData.length; i++) {
            
            uint8_t bytes;
            
            [resultData getBytes:&bytes range:NSMakeRange(i, 1)];
            
            [hash appendFormat:@"%02x",bytes];
            
        }
        
        return [hash mutableCopy];
    };
}

- (NSString * (^)(void))fdj_sha256 {
    return ^NSString * {
        const char * plain = [self UTF8String];
        unsigned char * digest = malloc(CC_SHA256_DIGEST_LENGTH);
        
        CC_SHA256(plain, (CC_LONG)strlen(plain), digest);
        
        NSData * resultData = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
        
        NSMutableString * hash = [NSMutableString string];
        
        for (int i = 0; i < resultData.length; i++) {
            
            uint8_t bytes;
            
            [resultData getBytes:&bytes range:NSMakeRange(i, 1)];
            
            [hash appendFormat:@"%02x",bytes];
            
        }
        
        return [hash mutableCopy];
    };
}

- (NSString * (^)(void))fdj_sha512 {
    return ^NSString * {
        const char * plain = [self UTF8String];
        unsigned char * digest = malloc(CC_SHA512_DIGEST_LENGTH);
        
        CC_SHA512(plain, (CC_LONG)strlen(plain), digest);
        
        NSData * resultData = [NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH];
        
        NSMutableString * hash = [NSMutableString string];
        
        for (int i = 0; i < resultData.length; i++) {
            
            uint8_t bytes;
            
            [resultData getBytes:&bytes range:NSMakeRange(i, 1)];
            
            [hash appendFormat:@"%02x",bytes];
            
        }
        
        return [hash mutableCopy];
    };
}

- (NSString * (^)(void))fdj_base64 {
    return ^NSString * {
        NSData * data = [self dataUsingEncoding:NSUTF8StringEncoding];
        return [data base64EncodedStringWithOptions:0];
    };
}

#pragma mark - Data

- (NSData * (^)(void))fdj_md5Data {
    return ^NSData * {
        
        const char * plain = [self UTF8String];
        unsigned char * digest = malloc(CC_MD5_DIGEST_LENGTH);
        
        CC_MD5(plain, (CC_LONG)strlen(plain), digest);
        
        NSData * resultData = [NSData dataWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
        
        return resultData;
    };
}

- (NSData * (^)(void))fdj_sha1Data {
    return ^NSData * {
        const char * plain = [self UTF8String];
        unsigned char * digest = malloc(CC_SHA1_DIGEST_LENGTH);
        
        CC_SHA1(plain, (CC_LONG)strlen(plain), digest);
        
        NSData * resultData = [NSData dataWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
        
        return resultData;
    };
}

- (NSData * (^)(void))fdj_sha256Data {
    return ^NSData * {
        const char * plain = [self UTF8String];
        unsigned char * digest = malloc(CC_SHA256_DIGEST_LENGTH);
        
        CC_SHA256(plain, (CC_LONG)strlen(plain), digest);
        
        NSData * resultData = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
        
        return resultData;
    };
}

- (NSData * (^)(void))fdj_sha512Data {
    return ^NSData * {
        const char * plain = [self UTF8String];
        unsigned char * digest = malloc(CC_SHA512_DIGEST_LENGTH);
        
        CC_SHA512(plain, (CC_LONG)strlen(plain), digest);
        
        NSData * resultData = [NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH];
        
        return resultData;
    };
}

- (NSData * (^)(void))fdj_base64Data {
    return ^NSData * {
        NSData * data = [self dataUsingEncoding:NSUTF8StringEncoding];
        return data;
    };
}

@end


@implementation NSString (JOINT)

- (NSString * (^)(NSString * ))fdj_append {
    return ^ NSString * (NSString * append) {
        NSString * result = [self stringByAppendingString:append];
        return result;
    };
}

- (NSString * (^)(NSString *, ...))fdj_appendFormat {
    return ^ NSString * (NSString * format, ...) {
        va_list args;
        va_start(args, format);
        NSString * formatedString = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        return [self stringByAppendingString:formatedString];
    };
}

- (NSString * (^)(NSString *, NSString *))fdj_replace {
    return ^ NSString * (NSString * from, NSString * to) {
        NSString * result = [self stringByReplacingOccurrencesOfString:from withString:to];
        return result;
    };
}

@end
