//
//  TaskItem.h
//  MultiVCDemo
//
//  Created by dev1 on 4/9/15.
//  Copyright (c) 2015 dev1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskItem : NSObject

@property            NSString *itemName;
@property            BOOL      completed;
@property (readonly) NSDate   *creationDate;

@end
