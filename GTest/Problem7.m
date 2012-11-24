//
//  Problem7.m
//  GTest
//
//  Created by Constantine Fry on 11/22/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem7.h"
#import "EUSieve.h"


@implementation Problem7
{
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


extern int step;
-(void)solve{
    EULog(@"%@, steps = %d",[self solveFor:6],step);
    step = 0;
    EULog(@"%@, steps = %d",[self solveFor:10001],step);
}



-(NSNumber*)solveFor:(int)num{
    int counter = 1;
    int cc = 3;
    while (counter != num) {
        step++;
        if ([_sieve isPrimeNumer:cc]) {
            counter++;
        }
        cc+=2;
    }
    return @(cc-2);
}

@end
