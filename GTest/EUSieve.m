//
//  EUSieve.m
//  GTest
//
//  Created by Constantine Fry on 11/22/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "EUSieve.h"

@implementation EUSieve
{
    NSMutableArray *_primes;
    int _N;
}



- (id)init
{
    self = [super init];
    if (self) {
        _primes = [NSMutableArray arrayWithCapacity:_N];
        [self fillWith:100000];

    }
    return self;
}


-(void)fillWith:(int)num{
    _N = num;
    
    [self fill];

}
-(void)fill{
    NSMutableArray *a = [NSMutableArray arrayWithCapacity:_N];
    

    [a addObject:@NO];
    for(int i = 1; i < _N; i++){
        [a addObject:@YES];    
    }
    
    for (int i=2; i*i < _N; i++)
        if ([a[i] boolValue])
            for (int j=i*i; j < _N; j+=i)
                a[j] = @NO;
    
    _primes = a;
}



-(BOOL)isPrimeNumer:(int)num{
    if (num >= _N) {
        [self fillWith:_N*2];
    }
    return  [_primes[num] boolValue];
}
@end
