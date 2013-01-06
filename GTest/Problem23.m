//
//  Problem23.m
//  GTest
//
//  Created by Constantine Fry on 12/4/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem23.h"
#import "EUProperDivisor.h"


@implementation Problem23{
    EUProperDivisor *_pd;
}

- (id)init
{
    self = [super init];
    if (self) {
        _pd = [[EUProperDivisor alloc]init];
    }
    return self;
}

-(NSArray*)abundants{
    NSMutableArray *abundants = [NSMutableArray arrayWithCapacity:7000];
    for (int i = 1; i<=28123; i++) {
        if ([_pd isAbundantNumber:i]) {
            NSNumber *iNum = @(i);
            [abundants addObject:iNum];
        }
    }
    return abundants;
}

-(void)solve{
    int* allInteger = malloc(28122*sizeof(int));
    NSArray *abundants = [self abundants];
    
    for (NSNumber* num1 in abundants) {
        for (NSNumber *num2 in abundants) {
            int  a = num1.intValue+num2.intValue;
            if (a < 28123) {
                allInteger[a] = 1;
            }
        }
    }
    
    int sum = 0;
    for (int i = 0; i<=28122; i++) {
        if (!allInteger[i]) {
            sum += i;
        }
    }
    free(allInteger);
    EULog(@"Answer: %d",sum);
}
//4179871

@end
