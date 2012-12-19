//
//  Problem30.m
//  GTest
//
//  Created by Constantine Fry on 12/13/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem30.h"


@implementation Problem30{
    NSMutableDictionary *_dic;
}

- (id)init
{
    self = [super init];
    if (self) {
        _dic = [[NSMutableDictionary alloc]initWithCapacity:10];
        for (int i = 0; i<=9; i++) {
            _dic[@(i)] = @(pow(i, 5));
        }
    }
    return self;
}


-(void)solve{
    int res = 0;
    int counter = 999999;
    while (counter > 1) {
        int sum = 0;
        int a = counter;
        while (a) {
            sum += [_dic[@(a%10)] intValue];
            a /= 10;
        }
        if (sum == counter) {
            res += counter;
        }
        counter--;
    }
    EULog(@"Answer: %d",res);
}
@end
