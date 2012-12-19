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

- (id)copyWithZone:(NSZone *)zone{
    BigNumber *new = [[BigNumber alloc]initWithArray:[_numbers mutableCopy]];
    return new;
}

-(NSMutableArray*)convertToArray:(int)num{
    NSString *s = [NSString stringWithFormat:@"%d",num];
    return [self convertStringToArray:s];
}

-(NSMutableArray*)convertStringToArray:(NSString*)s{
    NSMutableArray* arr = [NSMutableArray arrayWithCapacity:s.length];
    for (int i = 0; i < s.length ; i++) {
        NSString *cc = [s substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:@(cc.intValue)];
    }
    return arr;
}

-(NSString*)description{
    NSString* s = [_numbers componentsJoinedByString:@""];
    return s;
    
}

-(NSString*)first10Numbers{
    NSMutableString *res = [NSMutableString string];
    BOOL shoudExlude = YES;
    int count = 10;
    for (NSNumber *n in _numbers) {
        if (!n.intValue && shoudExlude) {
            continue;
        }
        shoudExlude = NO;
        [res appendFormat:@"%@",n];
        count--;
        if (!count) {
            break;
        }
    }
    [res appendFormat:@"..."];
    return res;
    
}


- (id)initWithString:(NSString*)num
{
    self = [super init];
    if (self) {
        _numbers  = [self convertStringToArray:num];
    }
    return self;
}

- (id)initWithArray:(NSMutableArray*)num{
    self = [super init];
    if (self) {
        _numbers  = [num mutableCopy];
    }
    return self;
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
        int newVal = (a * n) + carry;
        _numbers[i] = @(newVal % 10 );
        carry = newVal/10;
    }
    
    while (carry) {
        [_numbers insertObject:@(carry%10) atIndex:0];
        carry = carry/10;
    }
}

-(void)increase{
    
}

-(void)plus:(BigNumber*)num{
    [self makeSureBothBigNumberWithSameSize:self and:num];

    int carry = 0;
    int ii = (int)_numbers.count-1;
    for (int i = ii; i >= 0; --i){
        int a1 = [self[i] intValue];
        int a2 = [num[i] intValue];
        int newVal = a1 + a2 + carry;
        _numbers[i] = @(newVal%10);
        carry = newVal/10;
    }
    
    while (carry) {
        [_numbers insertObject:@(carry%10) atIndex:0];
        carry = carry/10;
    }
}

-(void)minus:(BigNumber*)num{
    [self makeSureBothBigNumberWithSameSize:self and:num];
    
    int carry = 0;
    int ii = (int)_numbers.count-1;
    for (int i = ii; i >= 0; --i){
        int a1 = [self[i] intValue];
        int a2 = [num[i] intValue];
        int newVal = a1 - a2 - carry;
        if (newVal < 0) {
            newVal = 10 + newVal;
            carry = 1;
        }else{
            carry = 0;
        }
        _numbers[i] = @(newVal);
    }
    if (carry) {
        _numbers = nil;
    }
}

-(BOOL)isValid{
    return _numbers != nil;
}

-(void)divide:(int)num{
    int counter = 0;
    BigNumber *n = [[BigNumber alloc]initWithNum:num];
    while ([self intValue] > 0) {
        counter ++;
        [self minus:n];
    }
    if ([self isValid]) {
        (void)[self initWithNum:counter];
    }
}

-(void)makeSureBothBigNumberWithSameSize:(BigNumber*)n1 and:(BigNumber*)n2{
    int l1 = (int)n1.count-1;
    int l2 = (int)n2.count-1;
    if (l2 > l1) {
        [n1 insertZeros:l2-l1];
    }else{
        [n2 insertZeros:l1-l2];
    }
    
}






-(NSNumber*)getSum{
    return [_numbers sum];
}

-(int)intValue{
    if (!_numbers) {
        return -1;
    }
    NSString *s = [_numbers componentsJoinedByString:@""];
    return s.intValue;
}

-(NSUInteger)count{
    return _numbers.count;
}

-(NSNumber*)objectAtIndexedSubscript:(NSUInteger)index{
    return [_numbers objectAtIndex:index];
}


-(void)powerOf:(int)num{
    int count = num-1;
    int n = [self intValue];
    while (count) {
        [self muplitplyTo:n];
        count--;
    }
}


static char *_factorals;

-(void)initFactorials{
    _factorals = malloc(10*sizeof(char));
    _factorals[0] = 0;
    for (int i = 1; i<=9; i++) {
        int fac = 1;
        for (int j = 2; j<=i; j++) {
            fac*=j;
        }
    _factorals[i] = fac;
    }
}
    
-(void)insertZeros:(int)num{
    for (int i = num; i > 0 ; i--) {
        [_numbers insertObject:@(0) atIndex:0];
    }
}

-(BOOL)isEqualTo:(BigNumber*)object{
    return [_numbers isEqualTo:[object numbers]];
}

-(BOOL)isSumOfFactorialsIsEqualToNumber{
    if (!_factorals) {
        [self initFactorials];
    }
    BigNumber *b = [[BigNumber alloc]initWithNum:0];
    for (NSNumber *n in _numbers) {
        [b plus:[[BigNumber alloc]initWithNum:_factorals[n.intValue]]];
    }
    if ([b isEqualTo:self]) {
        return YES;
    }
    return NO;
}


-(NSArray*)numbers{
    return _numbers;
}


@end
