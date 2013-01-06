//
//  Problem44.m
//  GTest
//
//  Created by Constantine Fry on 1/5/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

#import "Problem44.h"

@implementation Problem44
{
    int res;
    int max;
}



- (id)init
{
    self = [super init];
    if (self) {
        max = 10000;
    }
    return self;
}



-(void)solve{
    int i = 2;
    while (!res){
        int a = (i*(3*i-1))/2;
        for (int j = i-1; j > 0; j--) {
            int b = (j*(3*j-1))/2;
            int c = a+b;
            int cc = a-b;
            
            if ([self isPentagonal:c] && [self isPentagonal:cc]) {
                res = cc;
                break;
            }
        }
        i++;
    }

    EULog(@"%d",res);
}
// test for pentagonals numbers
//http://en.wikipedia.org/wiki/Pentagonal_number
-(BOOL)isPentagonal:(long)num{
    double a = (sqrt(24.0*num+1.0)+1.0)/6.0;
    return a == (int)a;
}

@end
