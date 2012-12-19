//
//  BigNumber.h
//  GTest
//
//  Created by Constantine Fry on 11/15/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "EUProblem.h"

@interface BigNumber : NSObject

- (id)initWithArray:(NSMutableArray*)num;
- (id)initWithNum:(int)num;
- (id)initWithString:(NSString*)num;
-(NSString*)first10Numbers;

-(NSNumber*)getSum;
-(BOOL)isValid;
-(int)intValue;
-(NSUInteger)count;
-(NSNumber*)objectAtIndexedSubscript:(NSUInteger)index;
-(NSString*)description;



#pragma mark Math Operation
-(void)muplitplyTo:(int)num;

-(void)powerOf:(int)num;

-(void)divide:(int)num;
-(void)minus:(BigNumber*)num;
-(void)plus:(BigNumber*)num;
-(void)increase;


-(BOOL)isSumOfFactorialsIsEqualToNumber;
#pragma mark -
@end
