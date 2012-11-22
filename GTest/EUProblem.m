//
//  EUProblem.m
//  GTest
//
//  Created by Constantine Fry on 11/14/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "EUProblem.h"

@implementation EUProblem

-(void)check{
    if ([self isKindOfClass:[EUProblem class]]) {
        [NSException raise:@"Abstract Class" format:@"" ];
    }
}

-(void)solve{
    [self check];
}

-(int)solveFor:(int)num{
    [self check];
    return -1;
}

-(int)solveForLong:(long)num{
    [self check];
    return -1;
}

@end
