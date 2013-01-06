//
//  Problem49.m
//  GTest
//
//  Created by Constantine Fry on 1/6/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

#import "EUSieve.h"


@interface Result49 : NSObject
@property (nonatomic,readonly)NSMutableSet* nums;
@end

@implementation Result49

- (id)init
{
    self = [super init];
    if (self) {
        _nums = [NSMutableSet setWithCapacity:3];
    }
    return self;
}

@end


#import "Problem49.h"

@implementation Problem49{
    EUSieve *_sieve;
}


- (id)init
{
    self = [super init];
    if (self) {
        _sieve = [[EUSieve alloc]initWith:9999];
    }
    return self;
}
-(NSArray*)permute:(NSArray*)arr with:(NSNumber*)num{
    NSMutableArray *res = [NSMutableArray arrayWithCapacity:24];
    for (NSArray *a  in arr) {
        for (int i = 0; i<=a.count; i++) {
            NSMutableArray *b = [a mutableCopy];
            [b insertObject:num atIndex:i];
            [res addObject:b];
        }
    }
    return res;
}

-(void)solve{
    int count = 0;
    for (int i = 0; i<=9; i++) {
        NSArray *a = @[@[@(i)]];
        for (int j = i; j<=9; j++) {
            NSArray *b = [self permute:a with:@(j)];
            for (int k = j; k<=9; k++) {
                NSArray *c = [self permute:b with:@(k)];
                for (int z = k; z<=9; z++) {
    
                    NSArray *d = [self permute:c with:@(z)];
                    
                    
                    
                    
                    NSMutableArray *numbers = [NSMutableArray arrayWithCapacity:24];
                    for (NSArray *arr in d) {
                        int a = [arr[0] intValue] +
                        [arr[1] intValue]*10+[arr[2] intValue]*100+[arr[3] intValue]*1000;
                        if ([_sieve isPrimeNumer:a] && a>1023) {
                            [numbers addObject:@(a)];
                        }
                    }
                    if (numbers.count < 3) {
                        continue;
                    }
//                    [numbers sortedArrayUsingSelector:@selector(compare:)];

                    for (NSNumber *aa in numbers) {
                        for (NSNumber *bb in numbers) {
                            for (NSNumber *cc  in numbers) {
                                if (bb.intValue - aa.intValue
                                    == cc.intValue-bb.intValue &&
                                    bb.intValue - aa.intValue > 0) {
                                    
                                    EULog(@"%@%@%@ %d",aa,bb,cc,bb.intValue - aa.intValue);
                                    count++;
                                    if (count ==2) {
                                        return;
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                    
                    
                }
            }
        }
    }
    
    
    
    
    
}

@end
