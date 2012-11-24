//
//  Problem10.m
//  GTest
//
//  Created by Constantine Fry on 11/24/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem10.h"
#import "EUSieve.h"

@implementation Problem10{
    EUSieve *_sieve;
}

- (id)init
{
    self = [super init];
    if (self) {
        _sieve = [[EUSieve alloc] init];
    }
    return self;
}

-(void)solve{
    EULog(@"%@",[self solveForLong:10]);
    EULog(@"Answer:%@",[self solveForLong:2000000]);
}


-(NSNumber*)solveForLong:(long)num{
    long sum = 2;
    for (int i = 3; i < num; i++) {
        if ([_sieve isPrimeNumer:i]) {
            sum += i;
        }
    }
    return @(sum);
}



@end
