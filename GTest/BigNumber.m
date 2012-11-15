//
//  BigNumber.m
//  GTest
//
//  Created by Constantine Fry on 11/15/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "BigNumber.h"
#import "NSArray_ext.h"

@implementation BigNumber{
    NSMutableArray *_numbers;
}

-(NSMutableArray*)convertToArray:(int)num{
    NSString *s = [NSString stringWithFormat:@"%d",num];
    NSMutableArray* arr = [NSMutableArray arrayWithCapacity:s.length];
    for (int i = 0; i < s.length ; i++) {
        NSString *cc = [s substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:@(cc.intValue)];
    }
    return arr;
}

- (id)initWithNum:(int)num
{
    self = [super init];
    if (self) {
        _numbers  = [self convertToArray:num];
    }
    return self;
}

-(void)muplitplyTo:(int)n{
    int carry = 0;
    int ii = (int)_numbers.count-1;
    for (int i = ii; i >= 0; --i){
        int a = [_numbers[i] intValue];
        _numbers[i] = @((a * n) + carry );
        a = [_numbers[i] intValue];
        carry = a/10;
        _numbers[i] = @(a % 10);
    }
    
    while (carry) {
        [_numbers insertObject:@(carry%10) atIndex:0];
        carry = carry/10;
    }
}


-(NSNumber*)getSum{
    return [_numbers sum];
}

-(int)intValue{
    NSString *s = [_numbers componentsJoinedByString:@""];
    return s.intValue;
}


-(void)powerOf:(int)num{
    int count = num-1;
    int n = [self intValue];
    while (count) {
        [self muplitplyTo:n];
        count--;
    }
}

@end
