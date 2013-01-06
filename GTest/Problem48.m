//
//  Problem48.m
//  GTest
//
//  Created by Constantine Fry on 1/6/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

#import "Problem48.h"

@implementation Problem48


-(void)solve{
    unsigned long res;
    unsigned long cur;
    for (int i = 1 ; i<=1000; i++) {
        int a = i;
        cur = 1;
        while (a) {
            cur = (cur*i)%10000000000;
            a--;
        }
        res = (res + cur)%10000000000;
    }
    EULog(@"Answer: %ld",res);

}

@end
