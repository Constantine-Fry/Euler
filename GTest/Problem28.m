//
//  Problem28.m
//  GTest
//
//  Created by Constantine Fry on 12/13/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem28.h"

@implementation Problem28

-(void)solve{
    EULog(@"Answer: %@",[self solveFor:1001]);
}

-(id)solveFor:(int)num{
    int i = 1;
    int step = 2;
    long result = 1;
    while (1) {
        int a = 4*i + 10*step;
        result+=a;
        i = i + step*4;
        step += 2;
        if (step > num) {
            break;
        }
    }
    return @(result);
}
@end
