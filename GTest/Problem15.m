//
//  Problem15.m
//  GTest
//
//  Created by Constantine Fry on 11/29/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem15.h"

@implementation Problem15

-(void)solve{
    EULog(@"Answer: %@",[self solveFor:20]);
}

-(NSMutableArray *)getGridWithSize:(int)num{
    NSMutableArray *grid = [NSMutableArray arrayWithCapacity:num];
    for (int i = 0; i < num; i++) {
        NSMutableArray *r = [NSMutableArray arrayWithCapacity:20];
        if (i == 0) {
            for (int j = 0; j < num; j++) {
                [r addObject:@(1)];
            }
        }
        else{
            [r addObject:@(1)];
        }
        [grid addObject:r];
    }
    return grid;
}

-(void)printGrid:(NSArray*)grid{
    for (NSArray *r in grid) {
        EULog(@"%@",[r componentsJoinedByString:@" "]);
    }
}

-(NSNumber*)solveFor:(int)num{
    int n = num+1;
    NSMutableArray *grid = [self getGridWithSize:n];
    for (int i = 1; i< n; i++) {
        for (int j = 1; j<n; j++) {
            long n = [grid[i][j-1] longValue] + [grid[i-1][j] longValue];
            grid[i][j] =@(n);
        }
    }
    return grid[n-1][n-1];
}


@end
