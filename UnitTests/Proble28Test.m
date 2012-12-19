//
//  Proble28Test.m
//  GTest
//
//  Created by Constantine Fry on 12/13/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Proble28Test.h"
#import "Problem28.h"

@implementation Proble28Test
-(void)test1{
    Problem28 *p = [[Problem28 alloc]init];
    STAssertEqualObjects(@(101), [p solveFor:5], @"");
}
@end
