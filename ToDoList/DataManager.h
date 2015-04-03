//
//  DataManager.h
//  ToDoList
//
//  Created by Nicolas Rizk on 4/3/15.
//  Copyright (c) 2015 JimNick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainTask.h"

@interface DataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSArray *mainTasks;

+ (instancetype)sharedDataManager;

- (void)saveContext;
- (void)generateTestData;
- (void)fetchData;
- (MainTask *)createMainTask;
@end
