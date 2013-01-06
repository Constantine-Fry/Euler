//
//  EUSieve.h
//  GTest
//
//  Created by Constantine Fry on 11/22/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "EUProblem.h"

//http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes



@interface EUSieve : EUProblem

- (id)initWith:(int)num;
-(BOOL)isPrimeNumer:(unsigned int)num;

@end
