//
//  Problem2.m
//  GTest
//
//  Created by Constantine Fry on 11/16/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem2.h"

@implementation Problem2

-(void)solve{
    NSLog(@"Answer: %d",[self solveForLong:90]);
    NSLog(@"Answer: %d",[self solveForLong:4000000]);
}

-(int)solveForLong:(long)num{
    int sum = 0;
    long prev = 1;
    long current = 1;
    

    while (1) {
        long temp = current;
        current += prev;
        prev = temp;
        
        if (current >= num) {
            break;
        }
        
        if ((current%2) == 0) {
            sum += current;
        }

    }
    return sum;
}

@end
