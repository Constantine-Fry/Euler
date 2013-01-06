//
//  Problem17.m
//  GTest
//
//  Created by Constantine Fry on 11/30/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem17.h"

@implementation Problem17{
    NSMutableDictionary *_dic;
}

- (id)init
{
    self = [super init];
    if (self) {
        _dic = [NSMutableDictionary dictionaryWithCapacity:40];
        _dic[@(1)] = @([@"one" length]);
        _dic[@(2)] = @([@"two" length]);
        _dic[@(3)] = @([@"three" length]);
        _dic[@(4)] = @([@"four" length]);
        _dic[@(5)] = @([@"five" length]);
        _dic[@(6)] = @([@"six" length]);
        _dic[@(7)] = @([@"seven" length]);
        _dic[@(8)] = @([@"eight" length]);
        _dic[@(9)] = @([@"nine" length]);
        
        _dic[@(10)] = @([@"ten" length]);
        _dic[@(11)] = @([@"eleven" length]);
        _dic[@(12)] = @([@"twelve" length]);
        _dic[@(13)] = @([@"thirteen" length]);
        _dic[@(14)] = @([@"fourteen" length]);
        _dic[@(15)] = @([@"fifteen" length]);
        _dic[@(16)] = @([@"sixteen" length]);
        _dic[@(17)] = @([@"seventeen" length]);
        _dic[@(18)] = @([@"eighteen" length]);
        _dic[@(19)] = @([@"nineteen" length]);

        
        _dic[@(20)] = @([@"twenty" length]);
        _dic[@(30)] = @([@"thirty" length]);
        _dic[@(40)] = @([@"forty" length]);
        _dic[@(50)] = @([@"fifty" length]);
        _dic[@(60)] = @([@"sixty" length]);
        _dic[@(70)] = @([@"seventy" length]);
        _dic[@(80)] = @([@"eighty" length]);
        _dic[@(90)] = @([@"ninety" length]);
        
        _dic[@(100)] = @([@"hundred" length]);
        _dic[@(1000)] = @([@"thousand" length]);

        
    }
    return self;
}

-(void)solve{
    EULog(@"Answer: %@",[self solveFor:1000]);//21124
}

-(int)getSum9{
    int res = 0;
    for (int i = 1; i <= 9; i+=1) {
        res += [_dic[@(i)] intValue];
    }
    return res;
}

-(int)getSum1019{
    int res = 0;
    for (int i = 10; i <= 19; i+=1) {
        res += [_dic[@(i)] intValue];
    }
    return res;
}

-(int)getSum99{
    int sum9 = [self getSum9];
    int res = 0;
    for (int i = 20; i <= 90; i+=10) {
        res += [_dic[@(i)] intValue]*10 + sum9;
    }
    return res + sum9 + [self getSum1019];
}

-(int)getSumeForHundreds:(int)num{
    int sum99 = [self getSum99];
    int res = sum99 * num;
    for (int i = 1; i < num; i++) {
        res += ([_dic[@(i)] intValue]+[_dic[@(100)] intValue] + 3)*100-3;
    }
    res += [_dic[@(num)] intValue] + [_dic[@(num*100)] intValue];
    return res;
}

-(NSNumber*)solveFor:(int)num{
    if (num%100 != 0 || num > 1000) {
        return @(NAN);
    }
    int res1 = [self getSumeForHundreds:num/100];
    return @(res1);
}
@end
