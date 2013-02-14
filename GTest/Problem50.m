//
//  Problem50.m
//  GTest
//
//  Created by Constantine Fry on 1/8/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

#import "Problem50.h"
#import "EUSieve.h"

@implementation Problem50{
    EUSieve *_sieve;
    int _len;
    int _res;
    int max;
}

- (id)init
{
    self = [super init];
    if (self) {
        max = 1000000;
        _sieve = [[EUSieve alloc]initWith:max];
    }
    return self;
}

-(void)rec:(int)num length:(int)len re:(int)res{
    if (res>max || num >max) {
        return;
    }
    int n = num+1;
    while (![_sieve isPrimeNumer:n]) {
        n++;
    }
    
    
    
    
    int res1 = res+n;
    int len1 = len+1;
    if (_len < len1 && [_sieve isPrimeNumer:res1] && res1<max) {
        _len = len1;
        _res = res1;
    }
    [self rec:n length:len1 re:res1];
}

-(void)solve{
    for (int i = 2; i<=max/4; i++) {
        if ([_sieve isPrimeNumer:i]) {
            [self rec:i length:0 re:0];
        }
    }
    EULog(@"Answer: %d, terms: %d",_res, _len);
}
@end
