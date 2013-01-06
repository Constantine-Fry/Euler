//
//  Problem35.m
//  GTest
//
//  Created by Constantine Fry on 12/20/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem35.h"
#import "EUSieve.h"


@implementation Problem35{
    EUSieve *_sieve;
}

- (id)init
{
    self = [super init];
    if (self) {
        _sieve = [[EUSieve alloc]initWith:999999];
    }
    return self;
}



-(void)solve {
    int res = 4;
    for (int i = 11 ; i<=999999; i+=2) {
        if (![_sieve isPrimeNumer:i]) 
            continue;
        int zeros = 1;
        int n = i;
        int counter = 0;
         while (n > 10) {
            counter++;
            zeros *= 10;
            n /= 10;
         };
        
        int reminder = 1;
        int a = i;
        BOOL ok = YES;
        int sum = 0;
        while (counter) {
            reminder = a % 10;
            sum += reminder;
            a /= 10;
            a += reminder*zeros;
            
            if ((reminder != 1 && reminder != 3 && reminder != 7 && reminder != 9) || ![_sieve isPrimeNumer:a]) {
                ok = NO;
                break;
            }
            counter--;
        }
        if (ok ) {
            res++;
        }

    }
    EULog(@"Answer: %d",res);
}

@end
