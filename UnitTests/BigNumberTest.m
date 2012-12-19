//
//  BigNumberTest.m
//  GTest
//
//  Created by Constantine Fry on 11/27/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "BigNumberTest.h"
#import "BigNumber.h"



@implementation BigNumberTest


-(void)testMDevideOperatione{
    BigNumber *n1 = [[BigNumber alloc]initWithNum:3];
    [n1 divide:2];
    STAssertEqualObjects(@(-1), @([n1 intValue]), @"");
//    
//    n1 = [[BigNumber alloc]initWithNum:100];
//    n2 = [[BigNumber alloc]initWithNum:1];
//    [n1 minus:n2];
//    STAssertEqualObjects(@(99), @([n1 intValue]), @"");
//    
//    
//    n1 = [[BigNumber alloc]initWithNum:99];
//    n2 = [[BigNumber alloc]initWithNum:11];
//    [n1 minus:n2];
//    STAssertEqualObjects(@(88), @([n1 intValue]), @"");
//    
//    n1 = [[BigNumber alloc]initWithNum:1];
//    n2 = [[BigNumber alloc]initWithNum:2];
//    [n1 minus:n2];
//    STAssertEqualObjects(@(-1), @([n1 intValue]), @"");
}

-(void)testMinusOperatione{
    BigNumber *n1 = [[BigNumber alloc]initWithNum:99];
    BigNumber *n2 = [[BigNumber alloc]initWithNum:1];
    [n1 minus:n2];
    STAssertEqualObjects(@(98), @([n1 intValue]), @"");
    
    n1 = [[BigNumber alloc]initWithNum:100];
    n2 = [[BigNumber alloc]initWithNum:1];
    [n1 minus:n2];
    STAssertEqualObjects(@(99), @([n1 intValue]), @"");
    
    
    n1 = [[BigNumber alloc]initWithNum:99];
    n2 = [[BigNumber alloc]initWithNum:11];
    [n1 minus:n2];
    STAssertEqualObjects(@(88), @([n1 intValue]), @"");
    
    n1 = [[BigNumber alloc]initWithNum:1];
    n2 = [[BigNumber alloc]initWithNum:2];
    [n1 minus:n2];
    STAssertEqualObjects(@(-1), @([n1 intValue]), @"");
}

-(void)testPlusOperatione{
    BigNumber *n1 = [[BigNumber alloc]initWithNum:99];
    BigNumber *n2 = [[BigNumber alloc]initWithNum:1];
    [n1 plus:n2];
    STAssertEqualObjects(@(100), @([n1 intValue]), @"");

    n1 = [[BigNumber alloc]initWithNum:0];
    n2 = [[BigNumber alloc]initWithNum:99];
    [n1 plus:n2];
    STAssertEqualObjects(@(99), @([n1 intValue]), @"");
    
    
    n1 = [[BigNumber alloc]initWithNum:99];
    n2 = [[BigNumber alloc]initWithNum:99];
    [n1 plus:n2];
    STAssertEqualObjects(@(198), @([n1 intValue]), @"");
}

@end
