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

-(NSNumber*)getSum;
-(int)intValue;



#pragma mark Math Operation
-(void)muplitplyTo:(int)num;

-(void)powerOf:(int)num;


#pragma mark -
@end
