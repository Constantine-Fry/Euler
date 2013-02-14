//
//  EUProblem.h
//  GTest
//
//  Created by Constantine Fry on 11/14/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EULogger.h"



@interface EUProblem : NSObject


@property (assign)long steps;
@property (assign)BOOL canBeTested;
@property (assign)int question;
@property (assign)int answer;



-(void)solve;
-(NSNumber*)solveFor:(int)num;
-(NSNumber*)solveForLong:(long)num;

-(NSString*)openFileWithName:(NSString*)string;
@end
