//
//  Problem9.m
//  GTest
//
//  Created by Constantine Fry on 11/23/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem9.h"
//a*a + b*b - c*c = 0
//a + b + c = 1000.
@implementation Problem9


//1.
//c = 1000 - a -b
//cc = aa + bb





-(void)solve{
    int sum = 1000;
    for (int a = 1; a <sum; a++) {
        for (int b = a+1; b<sum; b++) {
            self.steps ++;
            
            int c = (sum - a - b);
            int left = a*a + b*b;
            
            if (left == c*c) {
                NSLog(@"steps = %d",(int)self.steps);
                NSLog(@"%d %d %d",a,b,c);
                NSLog(@"a*b*c = %d",a*b*c);
                return;
            }
            
            if (left > c*c ) {
                break;
            }
        }
    }
}


@end
