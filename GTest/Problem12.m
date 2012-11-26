//
//  Problem12.m
//  GTest
//
//  Created by Constantine Fry on 11/26/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem12.h"
#import "EUSieve.h"




@implementation Problem12


-(int)question{
    return 4;
}

-(int)answer{
    return 25;
}

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(int)getTriangleNumber:(long)num{
    //from wiwikipedia
    return (0.5)*num*(num+1);
}

-(int)getDevidersCount:(long)number{

    int res = 0;
    int sqrt = (int) sqrtf(number);
    for(int i = 1; i<= sqrt; i++){
        if(number % i == 0){
            res += 2;
        }
    }
    if (sqrt * sqrt == number) {
        res--;
    }
    
    return res;
}

-(void)solve{
    EULog(@"Answer : %@",[self solveFor:500]);
}

-(NSNumber*)solveFor:(int)num{
    long i = 1;
    long result = 0;
    while (1) {
        result = [self getTriangleNumber:i];
        int b = [self getDevidersCount:result];
        
        if (b > num) {
            break;
        }
        i++;
    }
    return @(result);
}

@end
