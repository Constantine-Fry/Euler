//
//  Problem3.m
//  GTest
//
//  Created by Constantine Fry on 11/22/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem3.h"

@implementation Problem3

int step;
-(void)solve{
    EULog(@"%@",[self solveForLong:13195]);
    EULog(@"steps = %d",step);
    step = 0;
    EULog(@"%@",[self solveForLong:600851475143]);
    EULog(@"steps = %d",step);
}


//19
//44
-(NSNumber*)solveForLong:(long)num{
    long current = num;
    long max = -1;
    while (1) {
        for (long i = 2; i<=current; i++) {
            step++;
            if (current%i == 0) {
                if (i>max ) {
                    max = i;
                }
                current = current/i;
                break;
            }
        }
        if (current == 1) {
            break;
        }
    }

    return @(max);
}

@end
