//
//  Problem47.m
//  GTest
//
//  Created by Constantine Fry on 1/6/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

#import "Problem47.h"

@implementation Problem47

-(NSUInteger)numberOfPrimefactors:(int)num{
    int current = num;
    int count = 0;
    int ap[4] = {0,0,0,0};
    while (current != 1){
        int dev = 2;
        while (current%dev!=0) {
            dev++;
        }
        BOOL dup = NO;
        for (int i = 0; i<=3; i++) {
            if (ap[i] == dev) {
                dup = YES;
            }
        }
        current = current/dev;
        ap[count] = dev;
        if (!dup) {
            count++;
        }
    
    }
    return count;
}

-(void)solve{
    int i = 1;
    int count = 0;
    while (1) {
        if ([self numberOfPrimefactors:i] == 4){
            count++;
        }else{
            count = 0;
        }
        if (count == 4) {
            break;
        }
        i++;
    }
    EULog(@"Answer: %d",i-3);
}

@end
