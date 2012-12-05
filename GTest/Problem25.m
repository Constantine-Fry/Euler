//
//  Problem25.m
//  GTest
//
//  Created by Constantine Fry on 12/5/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem25.h"
#import "BigNumber.h"
@implementation Problem25

-(void)solve{
    BigNumber* prev = [[BigNumber alloc]initWithNum:1];
    BigNumber* cur = [[BigNumber alloc]initWithNum:1];
    int counter = 2;
    while (cur.count != 1000) {
        BigNumber *temp = [cur copy];
        [cur plus:prev];
        prev = temp;
        
        counter++;
    }
    EULog(@"Answer: %d",counter);
}

@end
