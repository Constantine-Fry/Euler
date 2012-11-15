//
//  BigNumber.h
//  GTest
//
//  Created by Constantine Fry on 11/15/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "EUProblem.h"

@interface BigNumber : EUProblem
- (id)initWithNum:(int)num;


-(void)muplitplyTo:(int)num;
-(NSNumber*)getSum;
@end
