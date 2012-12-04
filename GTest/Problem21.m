//
//  Problem21.m
//  GTest
//
//  Created by Constantine Fry on 12/3/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem21.h"
#import "EUProperDivisor.h"

@implementation Problem21{
    EUProperDivisor *_pd;
}

- (id)init
{
    self = [super init];
    if (self) {
        _pd = [[EUProperDivisor alloc]init];
    }
    return self;
}



-(void)solve{
    int conter = 0;
    for (long a = 10000; a > 0; a--) {
        long b = [_pd getD:a];
        if ([_pd isAmicableNumbers:a b:b]) {
            EULog(@"%d,%d",b,a);
            conter += b + a;
        }
    }
    EULog(@"Answer:%d",conter/2);
}

@end
