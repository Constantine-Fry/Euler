//
//  EUProblem.m
//  GTest
//
//  Created by Constantine Fry on 11/14/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "EUProblem.h"

@implementation EUProblem
- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)check{
    if ([self isKindOfClass:[EUProblem class]]) {
        [NSException raise:@"Abstract Class" format:@"" ];
    }
}

-(void)solve{
    [self check];
}

-(NSNumber*)solveFor:(int)num{
    [self check];
    return @(-1);
}

-(NSNumber*)solveForLong:(long)num{
    [self check];
    return @(-1);
}



@end
