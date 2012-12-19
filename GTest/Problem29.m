//
//  Problem29.m
//  GTest
//
//  Created by Constantine Fry on 12/13/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem29.h"
#import "BigNumber.h"
@implementation Problem29

-(void)solve{
    int n = 100;
    NSMutableSet *dic = [[NSMutableSet alloc]initWithCapacity:n*n];
    for (int i = 2; i <= n; i++) {
        for (int j = 2; j<=n; j++) {
            double d = pow(i, j);
            [dic addObject:@(d)];
        }
    }
    EULog(@"%d",dic.count);
}
@end
