//
//  MainTask.h
//  ToDoList
//
//  Created by Jim Campagno on 4/2/15.
//  Copyright (c) 2015 JimNick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MainTask : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSNumber * progress;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSSet *subtasks;
@end

@interface MainTask (CoreDataGeneratedAccessors)

- (void)addSubtasksObject:(NSManagedObject *)value;
- (void)removeSubtasksObject:(NSManagedObject *)value;
- (void)addSubtasks:(NSSet *)values;
- (void)removeSubtasks:(NSSet *)values;

@end
