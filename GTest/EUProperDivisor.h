//
//  EUProperDivisor.h
//  GTest
//
//  Created by Constantine Fry on 12/4/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EUProperDivisor : NSObject

//Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
//If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called
//amicable numbers.
-(long)getD:(long)num;

-(BOOL)isAmicableNumbers:(long)a b:(long)b;

-(BOOL)isPerfectnNumber:(long)num;
-(BOOL)isAbundantNumber:(long)num;
-(BOOL)isDeficientNumber:(long)num;
@end
