//
//  Problem12Test.m
//  GTest
//
//  Created by Constantine Fry on 11/26/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem12Test.h"
#import "Problem12.h"

@implementation Problem12Test


-(void)testTriangleNumber{
    Problem12 *p = [[Problem12 alloc]init];
    NSArray *answers = @[@0,@1,@3,@6,@10,@15,@21,@28];
    for (int i = 1; i < 8 ; i++) {
        STAssertEquals([answers[i] intValue], [p getTriangleNumber:i], @"a");
    }
}


-(void)testFactorsNumber{
    Problem12 *p = [[Problem12 alloc]init];
    NSArray *questions = @[@0,@1,@3,@6,@10,@15,@21,@28];
    NSArray *answers =   @[@0,@1,@2,@4,@4,@4,@4,@6];
    for (int i = 1; i < 8 ; i++) {
        STAssertEquals([answers[i] intValue],
                       [p getDevidersCount:[questions[i] intValue]],
                       @"a");
    }
}

-(void)testSolve{
    Problem12 *p = [[Problem12 alloc]init];
    NSArray *questions = @[@0,@1,@3,@6,@10,@15,@21,@28];
    NSArray *answers =   @[@0,@1,@2,@4,@4,@4,@4,@6];
    for (int i = 1; i < 8 ; i++) {
        STAssertEquals([answers[i] intValue],
                       [p getDevidersCount:[questions[i] intValue]],
                       @"a");
    }
}


@end
