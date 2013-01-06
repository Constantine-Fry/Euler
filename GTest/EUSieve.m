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
    BOOL *_primes;
    unsigned int _N;
}



- (id)init
{
    self = [super init];
    if (self) {
        _N = 100000;
        [self fillWith:_N];

    }
    return self;
}

- (id)initWith:(int)num
{
    self = [super init];
    if (self) {
        _N = num;
        [self fillWith:_N];
        
    }
    return self;
}



- (void)dealloc
{
    free(_primes);
}


-(void)fillWith:(int)num{
    _N = num;
    [self fill];
}

-(void)fill{
    if (_primes != NULL) {
        free(_primes);
    }
    _primes = malloc(_N*sizeof(BOOL));
    memset(_primes, YES, _N*sizeof(BOOL));
    _primes[0] = NO;
    _primes[1] = NO;
    
    for (int i=2; i*i < _N; i++)
        if (_primes[i])
            for (int j=i*i; j < _N; j+=i)
                _primes[j] = NO;
}



-(BOOL)isPrimeNumer:(unsigned int)num{
    if (num >= _N) {
        [self fillWith:num*2];
    }
    return  _primes[num];
}
@end
