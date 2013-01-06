//
//  Problem38.m
//  GTest
//
//  Created by Constantine Fry on 12/20/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem38.h"

@implementation Problem38


-(int)getNum:(int)i{
    int a = i;
    int counter = 2;
    while (a < 100000000) {
        int b = i*counter;
        int c = b;
        while (c) {
            a*=10;
            c/=10;
        }
        a+=b;
        counter++;
    }
    if (a > 999999999) {
        return 0;
    }
    return a;
}



-(void)solve{
    int res = 0;
    int ii = 0;
    int *array = malloc(10*sizeof(int));
    for (int i = 9999; i >= 1; i--) {
        int a = [self getNum:i];
        if (!a)
            continue;
        memset(array, 0, 10*sizeof(int));
        int b = a;
        BOOL ok = YES;
        while (b) {
            int rem = b%10;
            b/=10;
            array[rem] = 1;
        }
        
        for (int i = 1; i<=9; i++) {
            if (!array[i]) {
                ok = NO;
                break;
            }
        }
        if (ok && res < a) {
            res = a;
            ii = i;
            break;
        }
        
    }
    EULog(@"%d %d",res,ii);
    free(array);
}

@end
