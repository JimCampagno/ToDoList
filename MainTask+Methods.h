//
//  MainTask+Methods.h
//  ToDoList
//
//  Created by Nicolas Rizk on 4/3/15.
//  Copyright (c) 2015 JimNick. All rights reserved.
//

#import "MainTask.h"

@interface MainTask (Methods)

+ (instancetype)messageWithContext:(NSManagedObjectContext *)context;

@end
