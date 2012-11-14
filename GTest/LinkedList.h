//
//  LinkedList.h
//  GTest
//
//  Created by Constantine Fry on 11/11/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property(strong)id value;
@property(strong)Item *next;
@end

@interface LinkedList : NSObject
@property(strong)Item* head;
@property(strong)Item* tail;



-(void)addItem:(Item*)item;
-(void)mergeWith:(LinkedList*)list;
@end
