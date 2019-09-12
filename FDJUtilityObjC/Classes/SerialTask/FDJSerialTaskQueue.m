//
//  FDJSerialTaskQueue.m
//  FDJUtilityObjC
//
//  Created by mac on 2019/9/12.
//

#import "FDJSerialTaskQueue.h"

static NSMutableDictionary * tasksDic;

@interface FDJSerialTaskQueue()

@property (nonatomic, strong) NSMutableArray * waitingTasks;
@property (nonatomic, strong) FDJSerialTask * currentTask;

@end

@implementation FDJSerialTaskQueue

+ (instancetype)shared {
    static FDJSerialTaskQueue * queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[self alloc] init];
    });
    return queue;
}

+ (instancetype)taskQueueWithIdentifier:(NSString *)identifier {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tasksDic = [NSMutableDictionary dictionary];
    });
    
    if (!tasksDic[identifier]) {
        FDJSerialTaskQueue * queue = [[self alloc] init];
        @synchronized (tasksDic) {
            tasksDic[identifier] = queue;
        }
        return queue;
    }else {
        return tasksDic[identifier];
    }
    
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _waitingTasks = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Public Methods
- (void)addTask:(FDJSerialTask *)task {
    
    BOOL shouldPerformNext = (self.waitingTasks.count == 0 && self.currentTask == nil);
    
    @synchronized (self.waitingTasks) {
        [self.waitingTasks addObject:task];
    }
    
    if (shouldPerformNext) {
        [self next:@{}];
    }
    
}
- (void)addTasks:(NSArray<FDJSerialTask *> *)tasks {
    
    BOOL shouldPerformNext = (self.waitingTasks.count == 0 && self.currentTask == nil);
    
    @synchronized (self.waitingTasks) {
        [self.waitingTasks addObjectsFromArray:tasks];
    }
    
    if (shouldPerformNext) {
        [self next:@{}];
    }
    
}

- (void)insertTask:(FDJSerialTask *)task {
    
    BOOL shouldPerformNext = (self.waitingTasks.count == 0 && self.currentTask == nil);
    
    @synchronized (self.waitingTasks) {
        [self.waitingTasks insertObject:task atIndex:0];
    }
    
    if (shouldPerformNext) {
        [self next:@{}];
    }
    
}

- (void)insertTasks:(NSArray<FDJSerialTask *> *)tasks {
    
    BOOL shouldPerformNext = (self.waitingTasks.count == 0 && self.currentTask == nil);
    
    @synchronized (self.waitingTasks) {
        
        NSRange range = NSMakeRange(0, tasks.count);
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        
        [self.waitingTasks insertObjects:tasks atIndexes:indexSet];
    }
    
    if (shouldPerformNext) {
        [self next:@{}];
    }
    
}

- (void)clean {
    
    @synchronized (self.waitingTasks) {
        [self.waitingTasks removeAllObjects];
    }
    
}

#pragma mark - Private Methods

- (void)next:(NSDictionary *)preInfo {
    
    @synchronized (self.waitingTasks) {
        
        if (self.waitingTasks.count > 0) {
            
            FDJSerialTask * task = self.waitingTasks.firstObject;
            
            self.currentTask = task;
            
            [self.waitingTasks removeObjectAtIndex:0];
            
            FDJTaskCompletionBlock completion = ^(NSDictionary * preInfo, BOOL shouldCancelOddTasks) {
                
                if (shouldCancelOddTasks) {
                    [self clean];
                }
                
                [self next:preInfo];
                
            };
            
            [task execute:preInfo completion:completion];
            
        }else {
            self.currentTask = nil;
        }
        
    }
    
}

@end
