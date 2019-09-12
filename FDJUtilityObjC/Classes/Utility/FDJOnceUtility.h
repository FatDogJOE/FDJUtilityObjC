//
//  FDJOnceUtility.h
//  FDJUtilityObjC
//
//  Created by mac on 2019/9/12.
//

#import <Foundation/Foundation.h>

typedef BOOL(^SyncOnceBlock)(void);
typedef void(^AsyncOnceCompletion)(BOOL finished);
typedef void(^AsyncOnceBlock)(AsyncOnceCompletion completion);

NS_ASSUME_NONNULL_BEGIN

@interface FDJOnceUtility : NSObject



@end

NS_ASSUME_NONNULL_END
