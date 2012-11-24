//
//  Problem1.m
//  GTest
//
//  Created by Constantine Fry on 11/16/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem1.h"
#import "NSArray_ext.h"


@implementation Problem1

-(void)solve{
    EULog(@"10: %@",[self solveFor:10]);
    EULog(@"1000: %@",[self solveFor:1000]);
}


-(NSNumber*)solveFor:(int)num{
    NSMutableArray *result = [@[] mutableCopy];
    for (int i = num-1; i > 0; i--) {
        if ((i%3) == 0 || (i%5) == 0) {
            [result addObject:@(i)];
        }
    }
    return result.sum;
}

@end
