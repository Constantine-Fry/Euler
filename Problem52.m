//
//  Problem52.m
//  GTest
//
//  Created by Constantine Fry on 1/8/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

#import "Problem52.h"

@implementation Problem52

-(void)solve{
    long i = 100000;
    long res = 0;
    while (1) {        
        
        int map[9] = {0,0,0,0,0,0,0,0,0};
        long rem = i;
        while (rem) {
            map[rem%10]=1;
            rem/=10;
        }

        
        BOOL ok = YES;
        for (int k = 2; k<=6;k++) {
            rem = i*k;
            int map1[9] = {0,0,0,0,0,0,0,0,0};
            while (rem) {
                map1[rem%10] =1;
                rem /=10;
            }
            for (int j = 0; j<=8; j++) {
                if (map[j]!=map1[j]) {
                    ok = NO;
                    k=6;
                    break;
                }
            }
        }
        
        if (ok) {
            res = i;
            break;
        }
        i++;
    }
    
    EULog(@"Answer: %d",res);
}

@end
