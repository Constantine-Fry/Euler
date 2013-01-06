//
//  Problem37.m
//  GTest
//
//  Created by Constantine Fry on 12/20/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem37.h"
#import "EUSieve.h"
@implementation Problem37{
    EUSieve *_sieve;
    NSMutableSet *set;
}

- (id)init
{
    self = [super init];
    if (self) {
        _sieve = [[EUSieve alloc]initWith:9000000];
    }
    return self;
}




-(BOOL)checkNum:(int)num{
    if (num<10) {
        return [_sieve isPrimeNumer:num];
    }
    int a = num;
    int zeros = 1;
    while (a) {
        a/=10;
        zeros *= 10;
    }
    zeros/=10;
    int newn = num - num/zeros*zeros;
    if ([_sieve isPrimeNumer:newn]) {
        return [self checkNum:newn];
    }
    return NO;
}

-(int)recWith:(int)num{
    if (num > 8000000) {
        return 0;
    }

    if (![_sieve isPrimeNumer:num]) {
        int z = num/10;
        if ([self checkNum:z]) {
            return z;
        } else{
            return 0;
        }
    }
    
    int newA = num*10;
    for (int i = 1; i <= 9; i++) {
        int a = newA+i;
        int ret = [self recWith:a];
        if (ret>10) {
            [set addObject:@(ret)];
        }
    }

    return 0;
}

-(void)solve{
    set = [NSMutableSet setWithCapacity:12];
    [self recWith:2];
    [self recWith:3];
    [self recWith:5];
    [self recWith:7];
    int res =0;
    for (NSNumber *n in set) {
        res += n.intValue;
    }
    EULog(@"%d",set.count);
//    EULog(@"%@",set);
    EULog(@"%d",res);
}

@end
