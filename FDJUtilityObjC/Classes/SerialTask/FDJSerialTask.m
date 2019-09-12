//
//  FDJSerialTask.m
//  FDJUtilityObjC
//
//  Created by mac on 2019/9/12.
//

#import "FDJSerialTask.h"

@implementation FDJSerialTask

+ (instancetype)taskWithOperation:(FDJTaskOperationBlock)operation {
    FDJSerialTask * task = [[self alloc] init];
    task.operation = operation;
    return task;
}

- (void)execute:(NSDictionary *)info completion:(FDJTaskCompletionBlock)completion {
    self.operation(completion,info);
}

@end
