//
//  EUProblem.h
//  GTest
//
//  Created by Constantine Fry on 11/14/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EUProblem : NSObject


@property (assign)int test;
@property (assign)int testResult;

-(void)solve;
-(int)solveFor:(int)num;
-(int)solveForLong:(long)num;
@end
