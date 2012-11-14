//
//  Problem20.h
//  GTest
//
//  Created by Constantine Fry on 11/14/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EUProblem.h"

@interface Problem20 : EUProblem
/*
 
 http://projecteuler.net/problem=20
 
 n! means n  (n  1)  ...  3  2  1
 
 For example, 10! = 10  9  ...  3  2  1 = 3628800,
 and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
 
 Find the sum of the digits in the number 100!
*/

@end


@interface Problem20_NumArray : EUProblem


@end


@interface Problem20_Recursive : EUProblem

- (double)factorial:(double)operand;

@end


@interface Problem20_Iterative : Problem20_Recursive


@end

@interface Problem20_Gamma : Problem20_Recursive
//http://blog.andrewwei.mu/?p=92

@end
