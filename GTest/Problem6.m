//
//  Problem6.m
//  GTest
//
//  Created by Constantine Fry on 11/22/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem6.h"

@implementation Problem6


-(int)sumOfSquares:(int)num{
    int res = 0;
    for (int i = 0; i <= num; i++) {
        res += (i*i);
    }
    return res;
}

-(int)squreOfSum:(int)num{
    int res = 0;
    for (int i = 0; i <= num; i++) {
        res += i;
    }
    return res*res;
}




-(int)solve1For:(int)num{
    return [self squreOfSum:num] - [self sumOfSquares:num];;
}



-(int)solveFor:(int)num{
    int res1 = 0;
    int res2 = 0;
    for (int i = 0; i <= num; i++) {
        res1 += i;
        res2 += i*i;
    }
    return res1*res1 - res2;
}

-(void)solve{
    NSLog(@"10: %d",[self solveFor:10]);
    NSLog(@"100: %d",[self solveFor:100]);
}


@end
