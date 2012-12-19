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
    EULog(@"Answer: %@",[self solveFor:1000]);
}

-(NSNumber*)solveFor:(int)num{
    BigNumber* prev = [[BigNumber alloc]initWithNum:1];
    BigNumber* cur = [[BigNumber alloc]initWithNum:1];
    int counter = 2;
    while (cur.count != num) {
        BigNumber *temp = [cur copy];
        [cur plus:prev];
        prev = temp;
        counter++;
    }
    return @(counter);
}

@end
