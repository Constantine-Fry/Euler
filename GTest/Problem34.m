//
//  Problem34.m
//  GTest
//
//  Created by Constantine Fry on 12/18/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem34.h"
#import "BigNumber.h"


@interface Num : NSObject
@property (nonatomic,assign)long number;
@property (nonatomic,assign)long fac;
@end
@implementation Num

-(NSString*)description{
    return [NSString stringWithFormat:@"%@",@(self.number)];
}

- (void)dealloc
{
    
}

@end


@implementation Problem34{
    long *_factorals;
}



- (id)init
{
    self = [super init];
    if (self) {
        _factorals = malloc(10*sizeof(long));
        _factorals[0] = 1;
        for (int i = 1; i<=9; i++) {
            int fac = 1;
            for (int j = 2; j<=i; j++) {
                fac*=j;
            }
            _factorals[i] = fac;
        }
    }
    return self;
}

- (void)dealloc
{
    free(_factorals);
}

//http://mathworld.wolfram.com/Factorion.html
-(void)solve{
    int result = -3;
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    for (long  i = 1; i<=_factorals[9]; i++) {
        long sum = 0;
        long a = i;
        while (a) {
            long remainder = a%10;
            sum += _factorals[remainder];
            a /= 10;
        }

        if (i == sum) {
            result += i;
            EULog(@"%d",i);
        }
        
    }

    EULog(@"%f",CFAbsoluteTimeGetCurrent() - start);
    EULog(@"Answer: %d",result);
}



@end
