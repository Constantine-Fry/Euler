//
//  Problem43.m
//  GTest
//
//  Created by Constantine Fry on 12/22/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem43.h"

@implementation Problem43{
    int *_array;
    int *_curNum;
    int *_digits;
    NSUInteger sum;
}

- (id)init
{
    self = [super init];
    if (self) {
        _array  = malloc(10*sizeof(int));
        _curNum  = malloc(10*sizeof(int));
        _digits  = malloc(8*sizeof(int));
        _digits[1] = 2;
        _digits[2] = 3;
        _digits[3] = 5;
        _digits[4] = 7;
        _digits[5] = 11;
        _digits[6] = 13;
        _digits[7] = 17;
    }
    return self;
}
- (void)dealloc
{
    free(_array);
    free(_digits);
    free(_curNum);
}

-(void)rec:(NSUInteger)num dep:(int)dep{
    if (dep == 10) {
        BOOL ok = YES;

        for (int i = 1; i<=7; i++) {
            int a = 0;
            for (int j = i; j<=i+2; j++) { 
                a = a*10+_curNum[j];
            }
            
            if (a%_digits[i]) {
                ok = NO;
                break;
            }
        }
        if (ok) 
            sum+= num;
        
        return;
    }
    
    for (int i = 0; i<=9; i++) {
        if (_array[i]) 
            continue;
        _array[i]=1;
        _curNum[dep] = i;
        [self rec:num*10+i dep:dep+1];
        _curNum[dep] = 0;
        _array[i]=0;
    }
}

-(void)solve{
    sum = 0;
    for (int i = 1; i<=9; i++) {
        _array[i]=1;
        _curNum[0] = i;
        [self rec:i dep:1];
        _curNum[0] = 0;
        _array[i]=0;
    }
    EULog(@"%ld",sum);
}

@end
