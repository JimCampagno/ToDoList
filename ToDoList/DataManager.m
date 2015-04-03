//
//  DataManager.m
//  ToDoList
//
//  Created by Nicolas Rizk on 4/3/15.
//  Copyright (c) 2015 JimNick. All rights reserved.
//

#import "DataManager.h"
#import "MainTask+Methods.h"
#import "Subtask.h"

@implementation DataManager
@synthesize managedObjectContext = _managedObjectContext;

+ (instancetype)sharedDataManager {
    static DataManager *_sharedDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataManager = [[DataManager alloc] init];
    });
    
    return _sharedDataManager;
}

- (void)saveContext {
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != error) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@ %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ToDoList.sqlite"];
    
    NSError *error = nil;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ToDoList" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)generateTestData
{
    MainTask *mainTask1 = [NSEntityDescription insertNewObjectForEntityForName:@"MainTask" inManagedObjectContext:self.managedObjectContext];
    mainTask1.name = @"Brush teeth";
    
    MainTask *mainTask2 = [NSEntityDescription insertNewObjectForEntityForName:@"MainTask" inManagedObjectContext:self.managedObjectContext];
    mainTask2.name = @"Take out garbage";
    
    Subtask *subtaskforMainTask1 = [NSEntityDescription insertNewObjectForEntityForName:@"Subtask" inManagedObjectContext:self.managedObjectContext];
    subtaskforMainTask1.thingToBeDone = @"pick up toothpaste";

    [mainTask1.subtasks setByAddingObject:subtaskforMainTask1];

    [self saveContext];
    [self fetchData];
}

- (void)fetchData
{
    NSFetchRequest *mainTaskRequest = [NSFetchRequest fetchRequestWithEntityName:@"MainTask"];
    
    self.mainTasks = [self.managedObjectContext executeFetchRequest:mainTaskRequest error:nil];
    
    if ([self.mainTasks count]==0) {
        [self generateTestData];
    }
}

- (MainTask *)createMainTask
{
    return [MainTask messageWithContext:self.managedObjectContext];
}


@end
