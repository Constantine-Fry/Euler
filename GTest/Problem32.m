//
//  Problem32.m
//  GTest
//
//  Created by Constantine Fry on 12/18/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem32.h"

@implementation Problem32{
    NSArray *_permutations;
}

-(void)generatePermutation{
    _permutations = @[@[@1,@2],@[@2,@1]];
    
    NSMutableArray *cur;
    for (int i = 3; i<=9; i++) {
        cur = [NSMutableArray array];
        for (NSArray *a in _permutations) {
            for (int j = 0; j<=a.count; j++) {
                NSMutableArray *newA = [a mutableCopy];
                [newA insertObject:@(i) atIndex:j];
                [cur addObject:newA];
            }
        }
        _permutations = cur;
    }
//    EULog(@"%d",_permutations.count);
//    EULog(@"done");
//    
}

-(int)get:(int)a b:(int)b array:(NSArray*)array{
    int x = 0,y = 0,z = 0;
    int t = 1;
    for (int i = 0; i<a; i++) {
        x+= [array[i] intValue]*t;
        t*=10;
    }
    t = 1;
    for (int i = a; i<a+b; i++) {
        y+= [array[i] intValue]*t;
        t*=10;
    }
    t = 1;
    for (int i = a+b; i<array.count; i++) {
        z+= [array[i] intValue]*t;
        t*=10;
    }
    if (z == x*y) {
//        EULog(@"%d * %d = %d",x,y,z);
        return z;
    }
    return 0;
}



-(void)solve{
    [self generatePermutation];
    int sum = 0;
    NSMutableDictionary *d = [NSMutableDictionary dictionaryWithCapacity:15];

    for (NSArray *a in _permutations) {
        int z = 0;
        z = [self get:2 b:3 array:a];
        if (z && !d[@(z)]) {
            d[@(z)] = @(z);
            sum += z;
        }
        
        z = [self get:1 b:4 array:a];
        if (z && !d[@(z)]) {
            d[@(z)] = @(z);
            sum += z;
        }
        
    }
    

    EULog(@"Answer: %d",sum);
}

@end
