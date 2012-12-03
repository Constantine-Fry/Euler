//
//  Problem21.m
//  GTest
//
//  Created by Constantine Fry on 12/3/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem21.h"

@implementation Problem21


-(long)getD:(long)num{
    long sum = 0;
    for (int i = num/2; i > 0; i--) {
        if (num%i == 0) {
            sum+=i;
        }
    }
    return sum;
}

-(void)solve{
    int conter = 0;
    for (long a = 10000; a > 0; a--) {
        long b = [self getD:a];
        if (a != b) {
            long c = [self getD:b];
            if (c == a) {
                EULog(@"%d,%d",b,a);
                conter += b + a;
            }
        }

    }
    EULog(@"Answer:%d",conter/2);
}

@end
