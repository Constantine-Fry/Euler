//
//  LinkedList.m
//  GTest
//
//  Created by Constantine Fry on 11/11/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "LinkedList.h"
#import "EULogger.h"

@implementation Item
//
//-(void)dealloc{
//    EULog(@"dealloc: %@",self.value);
//}

@end

@implementation LinkedList

-(void)mergeWith:(LinkedList*)list{
    EULog(@"%@ + %@",self,list);
    if (list.tail == nil) {
        return;
    }
    self.tail.next = list.head;
    self.tail = list.tail;
    EULog(@" = %@",self);
}

-(void)addItem:(Item*)item{
    if (!self.head) {
        self.head = item;
        self.tail = item;
        return;
    }
    
    
    self.tail.next = item;
    self.tail = item;
}

-(NSString*)description{
    NSMutableString* result=  [NSMutableString string];
    Item *item = self.head;
    while (item) {
        [result appendFormat:@"%@,",item.value];
        item = item.next;
    }
    return result;
}
@end
