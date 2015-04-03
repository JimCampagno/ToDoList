//
//  MainTask+Methods.m
//  ToDoList
//
//  Created by Nicolas Rizk on 4/3/15.
//  Copyright (c) 2015 JimNick. All rights reserved.
//

#import "MainTask+Methods.h"

@implementation MainTask (Methods)

+(instancetype)messageWithContext:(NSManagedObjectContext *)context
{
    MainTask *newMainTask = [NSEntityDescription insertNewObjectForEntityForName:@"MainTask" inManagedObjectContext:context];
    return newMainTask;
}

@end
