//
//  FDJSerialTask.h
//  FDJUtilityObjC
//
//  Created by mac on 2019/9/12.
//

#import <Foundation/Foundation.h>

typedef void(^FDJTaskCompletionBlock)(NSDictionary * _Nullable info, BOOL shouldCancelOddTasks);
typedef void(^FDJTaskOperationBlock)(FDJTaskCompletionBlock _Nonnull completion, NSDictionary * _Nullable preInfo);

NS_ASSUME_NONNULL_BEGIN

@interface FDJSerialTask : NSObject

@property (nonatomic, copy) FDJTaskOperationBlock operation;

+ (instancetype)taskWithOperation:(FDJTaskOperationBlock)operation;

- (void)execute:(NSDictionary *)info completion:(FDJTaskCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
