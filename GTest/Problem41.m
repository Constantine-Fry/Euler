//
//  Problem41.m
//  GTest
//
//  Created by Constantine Fry on 12/21/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem41.h"
@implementation Problem41{
    int res;
    int *_cur;
}



-(BOOL)isPrime:(int )num
{
    if (num <=1)
        return false;
    else if (num == 2)
        return true;
    else if (num % 2 == 0)
        return false;
    else
    {
        bool prime = true;
        int divisor = 3;
        double num_d = (double)(num);
        int upperLimit = (int)(sqrt(num_d) +1);
        
        while (divisor <= upperLimit)
        {
            if (num % divisor == 0)
                prime = false;
            divisor +=2;
        }
        return prime;
    }
}


-(BOOL)isValidForDep:(int)dep{
    BOOL ok = YES;
    for (int i = 1; i<=dep; i++) {
        if (!_cur[i]) {
            ok = NO;
        }
    }
    return ok;
}

-(void)rec:(int)dep num:(int)num{
    if (dep == 9 || res) {
        return;
    }

    if ([self isPrime:num] && [self isValidForDep:dep]) {
        res = num;
        return;
    }


    for (int i = 9; i>=1; i--) {
        if (!_cur[i]) {
            _cur[i]=1;
            int a = (num*10);
            [self rec:dep+1 num:a+i];
            _cur[i]=0;
        }
    }
}


-(void)solve{
    res = 0;
    _cur = malloc(10*sizeof(int));
    for (int i = 9; i>=1; i--) {
        if(res)
            break;
        _cur[i] = 1;
        [self rec:1 num:i];
        _cur[i]=0;
    }
    free(_cur);
    EULog(@"%d",res);
}


@end
