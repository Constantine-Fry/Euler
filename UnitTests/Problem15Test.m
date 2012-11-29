//
//  Problem15Test.m
//  GTest
//
//  Created by Constantine Fry on 11/29/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem15Test.h"
#import "Problem15.h"

@implementation Problem15Test
-(void)testGrid{
    Problem15 *p = [[Problem15 alloc]init];
    STAssertEqualObjects(@(6), [p solveFor:2], @"");
}
@end
