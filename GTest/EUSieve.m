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
}
int N = 200000;





- (id)init
{
    self = [super init];
    if (self) {
        _primes = [NSMutableArray arrayWithCapacity:200000];
        [self fill];
    }
    return self;
}

-(void)fill{
    [_primes addObject:@NO];
    
    for(int i = 1; i < N; i++){
        [_primes addObject:@YES];
        
    }
    
    for (int i=2; i*i < N; i++)
        if ([_primes[i] boolValue])
            for (int j=i*i; j < N; j+=i)
                _primes[j] = @NO;
    
}


-(BOOL)isPrimeNumer:(int)num{
    return  [_primes[num] boolValue];
}
@end
