//
//  Problem5.m
//  GTest
//
//  Created by Constantine Fry on 11/21/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem5.h"

@implementation Problem5
//solved with 11 639 628 steps: 232792560
//10 2520
//15 360360
//18 12252240
//19 232792560
//20 232792560
int iterations = 0;

-(int)valide:(int)num with:(int)validator{
    int a = 0;
    for (int i = validator; i > 0 ; i--) {
        if (num%i == 0) {
            a++;
        }
    }
    return a;
}


-(NSNumber*)solveFor:(int)num{
    int result = 0;
    int step = 1;
    int maxGoodRresult = 0;
    iterations = 0;
    while (1) {
        iterations++;
        result += step;
        int r = [self valide:result with:num];
        if (r == num) {
            break;
        }else if(r > maxGoodRresult){
            maxGoodRresult = r;
            step = result;
        }
    }
    return @(result);
}

-(void)solve{
    int a = 10;
    EULog(@"Divisible for 1-%d. Answer: %@. Solved with %d steps.",a,[self solveFor:a],iterations);
    a = 20;
    EULog(@"Divisible for 1-%d. Answer: %@. Solved with %d steps. ",a,[self solveFor:a],iterations);
}

@end
