//
//  Problem14Test.m
//  GTest
//
//  Created by Constantine Fry on 11/29/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem14Test.h"
#import "Problem14.h"

@implementation Problem14Test

-(void)testSequenceCounter{
    Problem14 *p = [[Problem14 alloc]init];
    STAssertEquals(10, [p getSequenceLength:13], @"");
}

@end
