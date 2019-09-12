//
//  FDJOnceUtility.m
//  FDJUtilityObjC
//
//  Created by mac on 2019/9/12.
//

#import "FDJOnceUtility.h"
#import "NSDictionary+FDJUtility.h"

static NSMutableDictionary * excutingDic;

@implementation FDJOnceUtility

+ (void)load {
    excutingDic = [NSMutableDictionary dictionary];
}

+ (BOOL)syncOnceWithKey:(NSString *)key queue:(dispatch_queue_t)queue execute:(SyncOnceBlock)execute {
    
    BOOL executing  = excutingDic.boolValue(key);
    BOOL executed   = [[NSUserDefaults standardUserDefaults] boolForKey:key];
    
    if (!executing && ! executed) {
        
        dispatch_queue_t executeQueue = queue ? : dispatch_get_main_queue();
        
        @synchronized (excutingDic) {
            
            excutingDic[key] = @YES;
            
            dispatch_async(executeQueue, ^{
               
                BOOL finished = execute();
                excutingDic[key] = @NO;
                [[NSUserDefaults standardUserDefaults] setBool:finished forKey:key];
                
            });

        }
        return YES;
    }else {
        return NO;
    }
    
}

+ (BOOL)asyncOnceWithKey:(NSString *)key queue:(dispatch_queue_t)queue execute:(AsyncOnceBlock)execute {
    
    BOOL executing  = excutingDic.boolValue(key);
    BOOL executed   = [[NSUserDefaults standardUserDefaults] boolForKey:key];
    
    if (!executing && !executed) {
        
        dispatch_queue_t executeQueue = queue ? : dispatch_get_main_queue();
        
        AsyncOnceCompletion completion = ^(BOOL finished){
            @synchronized (excutingDic) {
                excutingDic[key] = @NO;
            }
            [[NSUserDefaults standardUserDefaults] setBool:finished forKey:key];
        };
        
        dispatch_async(executeQueue, ^{
            
            @synchronized (excutingDic) {
                excutingDic[key] = @YES;
            }
            
            execute(completion);
            
        });
        
        return YES;
    }else {
        return NO;
    }
}

@end
