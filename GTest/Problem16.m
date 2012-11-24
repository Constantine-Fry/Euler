//
//  Problem16.m
//  GTest
//
//  Created by Constantine Fry on 11/15/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem16.h"
#import "BigNumber.h"

@implementation Problem16

-(void)solve{
    BigNumber *big = [[BigNumber alloc]initWithNum:2];
    [big powerOf:15];
    EULog(@"%d",[big intValue]);
    EULog(@"Sum(2^15) = %@",[big getSum]);
    
    
    big = [[BigNumber alloc]initWithNum:2];
    [big powerOf:1000];
    EULog(@"Sum(2^1000) = %@",[big getSum]);
}

@end
