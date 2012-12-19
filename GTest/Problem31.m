//
//  Problem31.m
//  GTest
//
//  Created by Constantine Fry on 12/13/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem31.h"

@implementation Problem31{
    short *_coins;
    int *_cur;
    NSMutableDictionary *_dic;
    int n;
    int aim;
    int result;
}


- (id)init
{
    self = [super init];
    if (self) {
        n = 8;
        _coins = malloc(n*sizeof(short));
        _coins[0] = 1;
        _coins[1] = 2;
        _coins[2] = 5;
        _coins[3] = 10;
        _coins[4] = 20;
        _coins[5] = 50;
        _coins[6] = 100;
        _coins[7] = 200;
        aim = _coins[n-1];

    }
    return self;
}

- (void)dealloc
{
    free(_coins);
}

-(void)makeKey{
    NSMutableString *s = [NSMutableString stringWithCapacity:10];
    for (int i = 0; i<n ; i++) {
        [s appendFormat:@"%d ",_cur[i]];
    }
    _dic[s] = @"";
}


-(void)recWith:(int)num{
    result++;
    [self makeKey];
    if (num == 0) {
        return;
    }
    int *orig = malloc(n*sizeof(int));
    memcpy(orig, _cur, n*sizeof(int));
    int counter = _cur[num];

    [self recWith:num-1];
    memcpy(_cur, orig, n*sizeof(int));
    while (counter) {
        counter--;
        memcpy(_cur, orig, n*sizeof(int));
        _cur[num] = counter;
        int curAim = _coins[num]*(orig[num]-counter);
        int i = num -1;
        while (curAim) {
            int count = curAim/_coins[i];
            curAim -= _coins[i]*count;
            _cur[i] += count;
            i--;
        }
        [self recWith:num-1];
    }
    free(orig);
    
}

-(void)solve{
    _cur = malloc(n*sizeof(int));
    memset(_cur, 0, n*sizeof(int));
    _cur[n-1] = 1;
    _dic = [NSMutableDictionary dictionaryWithCapacity:80000];
    result = 0;
    [self recWith:n-1];
    free(_cur);

    EULog(@"Answer: %d",_dic.allKeys.count);
    
}

@end
