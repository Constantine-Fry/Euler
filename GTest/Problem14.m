//
//  Problem14.m
//  GTest
//
//  Created by Constantine Fry on 11/29/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem14.h"

@implementation Problem14{
    int *_array;
}

- (id)init
{
    self = [super init];
    if (self) {
        _array = malloc(sizeof(int)*1000000);
    }
    return self;
}
- (void)dealloc{
    free(_array);
}

-(void)solve{
    int max = 0;
    int num = 0;
    for (int i = 1; i < 1000000; i++) {
        int a = [self getSequenceLength:i];
        if (max < a) {
            max = a;
            num = i;
        }
    }
    EULog(@"Answer: %d",num);
    
}

-(int)getSequenceLength:(long)num{
    int res = 1;
    long cur = num;
    while (cur > 1) {
        if (_array[num]) {
            res += _array[num] - 1;
            break;
        }
//        cur = ((cur % 2) == 0)?cur >> 1: 3 * cur + 1;
        if ((cur % 2) == 0) {
            cur = cur >> 1;
        }else{
            cur = 3 * cur + 1;
        }
        res++;

    }
    _array[num] = res;
    return res;
}

@end
