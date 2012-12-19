//
//  Problem27.m
//  GTest
//
//  Created by Constantine Fry on 12/13/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem27.h"
#import "EUSieve.h"
@implementation Problem27{
    EUSieve *_sieve;
}

- (id)init
{
    self = [super init];
    if (self) {
        _sieve = [[EUSieve alloc]init];
    }
    return self;
}
-(void)solve{
    int max = 0;
    int res = 0;
    for (int i = -1000; i<=1000; i++) {
        for (int j = -1000; j<=1000; j++) {
            int counter = 0;
            while (1) {
                int n = counter*counter + i*counter + j;
                if (n>0 && [_sieve isPrimeNumer:n]) {
                    counter++;
                }else{
                    break;
                }
            }
            if (max < counter) {
                max = counter;
                res = i*j;
                
            }
        }
    }
    EULog(@"Answer: %d",res);
}

@end
