//
//  Problem46.m
//  GTest
//
//  Created by Constantine Fry on 1/6/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

#import "Problem46.h"
#import "EUSieve.h"

@implementation Problem46{
    EUSieve *_sieve;
}

- (id)init
{
    self = [super init];
    if (self) {
        _sieve = [[EUSieve alloc]init];
    }
    return self;
}

-(BOOL)isComposite:(unsigned int)num{
    int count = num/2;
    BOOL composite = NO;
    while (count !=1) {
        if (num%count ==0) {
            composite = YES;
            break;
        }
        count--;
    }
    return composite;
}

-(void)solve{
    unsigned int res = 0;
    unsigned int i = 1;
    while (!res) {
        i+=2;
        if ([self isComposite:i]) {
            int square = 1;
            int j = sqrt(i/2);
            BOOL ok = NO;
            while (j != 0) {
                square = 2 * j*j;
                if ([_sieve isPrimeNumer:i-square]) {
                    ok = YES;
                    break;
                }
                j--;
            }
            if (!ok) {
                res = i;
            }
        }
    }
    EULog(@"Answer: %d",res);
}

@end
