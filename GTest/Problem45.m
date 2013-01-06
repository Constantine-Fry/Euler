//
//  Problem45.m
//  GTest
//
//  Created by Constantine Fry on 1/5/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

@interface Counter : NSObject
@property (assign)int num;
@end

@implementation Counter

- (id)init
{
    self = [super init];
    if (self) {
        self.num = 0;
    }
    return self;
}

@end

#import "Problem45.h"

@implementation Problem45{
    NSMutableDictionary *_dic;
    long n;
    BOOL stop;
    long res;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(long)tringle{
    return (n*(n+1))/2;
}

-(long)pentagonal{
    return (n*(3*n-1))/2;
}

-(long)hexagonal{
    return n*(2*n-1);
}

-(void)process:(SEL)selector{
    long t = (long)[self performSelector:selector];
    NSNumber *tObj = @(t);
    Counter *num = _dic[tObj];
    if (!num) {
        num = [[Counter alloc]init];
    }
    num.num++;
    if (num.num == 3 && t > 40755) {
        res = t;
        stop = YES;
    }
    _dic[tObj] = num;
}

-(void)solve2{
    n = 300;
    stop = NO;
    _dic = [NSMutableDictionary dictionaryWithCapacity:10000];
    while (!stop) {
        n++;
        [self process:@selector(tringle)];
        [self process:@selector(pentagonal)];
        [self process:@selector(hexagonal)];
        
    }
    EULog(@"%ld",res);
}

-(void)solve{
    n = 300;
    stop = NO;
    while (!stop) {
        n++;
        if ([self isPentagonal:[self hexagonal]]) {
            res = [self hexagonal];
            break;
        }
    }
    EULog(@"%ld",res);
}

-(BOOL)isPentagonal:(long)num{
    double a = (sqrt(24*num+1)+1)/6;
    return a == (int)a;
}

@end
