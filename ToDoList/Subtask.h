//
//  Subtask.h
//  ToDoList
//
//  Created by Jim Campagno on 4/2/15.
//  Copyright (c) 2015 JimNick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@class MainTask;

@interface Subtask : NSManagedObject

@property (nonatomic, retain) NSString * thingToBeDone;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) MainTask *mainTask;

@end
