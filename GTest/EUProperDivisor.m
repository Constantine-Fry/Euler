//
//  EUProperDivisor.m
//  GTest
//
//  Created by Constantine Fry on 12/4/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "EUProperDivisor.h"

@implementation EUProperDivisor


-(long)getD:(long)num{
    long sum = 0;
    for (int i = num/2; i > 0; i--) {
        if (num%i == 0) {
            sum+=i;
        }
    }
    return sum;
}


-(BOOL)isAmicableNumbers:(long)a b:(long)b{
    if (a != b) {
        long c = [self getD:b];
        if (c == a) {
            return YES;
        }
    }
    return NO;
}

-(BOOL)isPerfectnNumber:(long)num{
    if ([self getD:num] == num) {
        return YES;
    }
    return NO;
}

-(BOOL)isAbundantNumber:(long)num{
    if ([self getD:num] > num) {
        return YES;
    }
    return NO;
}


-(BOOL)isDeficientNumber:(long)num{
    if ([self getD:num] < num) {
        return YES;
    }
    return NO;
}

@end
