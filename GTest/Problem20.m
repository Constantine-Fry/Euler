//
//  Problem20.m
//  GTest
//
//  Created by Constantine Fry on 11/14/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem20.h"


@implementation Problem20


-(void)solve{
    NSArray* result2 = [self getFac:@10];
    NSNumber *num = [self getSum:result2];
    NSLog(@"%@",num);
    
    result2 = [self getFac:@100];
    num = [self getSum:result2];
    NSLog(@"%@",num);
}




-(NSNumber*)getSum:(NSArray*)number{
    double r= 0;
    for (NSNumber *num  in number) {
        r += num.intValue;
    }
    return @(r);
}



-(NSArray*)getFac:(NSNumber*)num{
    NSString *s = [NSString stringWithFormat:@"%.0f",num.doubleValue];
    NSMutableArray* arr = [NSMutableArray arrayWithCapacity:s.length];
    for (int i = 0; i < s.length ; i++) {
        NSString *cc = [s substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:@(cc.intValue)];
    }
    [self fac:arr n:num.intValue-1];
    return arr;
}


-(void)fac:(NSMutableArray*)arr n:(int)n{
    if (!n) 
        return;
    
    
    
    int carry = 0;
    int ii = (int)arr.count-1;
    for (int i = ii; i >= 0; --i){
        int a = [arr[i] intValue];
        arr[i] = @((a * n) + carry );
        a = [arr[i] intValue];
        carry = a/10;
        arr[i] = @(a % 10);
    }
    
    while (carry) {
        [arr insertObject:@(carry%10) atIndex:0];
        carry = carry/10;
    }
    
    [self fac:arr n:n-1];
}

@end
