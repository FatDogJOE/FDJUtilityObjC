//
//  FDJSerialTaskQueue.h
//  FDJUtilityObjC
//
//  Created by mac on 2019/9/12.
//

#import <Foundation/Foundation.h>
#import "FDJSerialTask.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDJSerialTaskQueue : NSObject

+ (instancetype)shared;
+ (instancetype)taskQueueWithIdentifier:(NSString *)identifier;

- (void)addTask:(FDJSerialTask *)task;
- (void)addTasks:(NSArray<FDJSerialTask *> *)tasks;

- (void)insertTask:(FDJSerialTask *)task;
- (void)insertTasks:(NSArray<FDJSerialTask *> *)tasks;

- (void)clean;

@end

NS_ASSUME_NONNULL_END
