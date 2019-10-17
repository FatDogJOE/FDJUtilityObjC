//
//  NSArray+FDJUtility.m
//  FDJUtilityObjC
//
//  Created by mac on 2019/10/16.
//

#import "NSArray+FDJUtility.h"

@implementation NSArray (FDJUtility)

- (NSArray *)repetitiveElements:(NSArray *)array primaryKey:(NSString * _Nullable)primaryKey {
    
    NSMutableArray * result = [NSMutableArray array];
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!primaryKey) {
            dic[obj] = obj;
        }else {
            dic[[obj valueForKey:primaryKey]] = obj;
        }
        
    }];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (!primaryKey) {
            id key = obj;
            if (dic[key] != nil) {
                [result addObject:obj];
            }
        }else {
            id key = [obj valueForKey:primaryKey];
            if (dic[key] != nil) {
                [result addObject:obj];
            }
        }
        
    }];
    
    return result;
}

@end
