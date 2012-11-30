//
//  Problem17Test.m
//  GTest
//
//  Created by Constantine Fry on 11/30/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem17Test.h"
#import "Problem17.h"

@implementation Problem17Test

-(void)test{
    Problem17 *p = [[Problem17 alloc]init];
    STAssertEqualObjects(@(NAN), [p solveFor:5], @"");
}

@end
