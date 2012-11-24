//
//  Problem20.m
//  GTest
//
//  Created by Constantine Fry on 11/14/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem20.h"
#import "BigNumber.h"

@implementation Problem20

-(void)solve{
    EULog(@"there is several ways to compute factorial!");
    
    EUProblem *p = [[Problem20_Recursive alloc]init];
    EULog(@"------------------------------");
    EULog(@"Recursive way:");
    [p solve];
    
    p = [[Problem20_Iterative alloc]init];
    EULog(@"------------------------------");
    EULog(@"Iterative way:");
    [p solve];
    
    p = [[Problem20_Gamma alloc]init];
    EULog(@"------------------------------");
    EULog(@"Gamma way:");
    EULog(@"http://blog.andrewwei.mu/?p=92");
    
    [p solve];
    
    p = [[Problem20_NumArray alloc]init];
    EULog(@"------------------------------");
    EULog(@"Array way:");
    [p solve];
    
    
}

@end










@implementation Problem20_NumArray

-(void)solve{
    BigNumber* result = [self factorial:10];
    NSNumber *num = [result getSum];
    EULog(@"sum(10!) = %@",num);
    
    result = [self factorial:100];
    num = [result getSum];
    EULog(@"sum(100!) = %@",num);
}

-(BigNumber*)factorial:(int)num{
    BigNumber* bNum = [[BigNumber alloc]initWithNum:num];
    [self fac:bNum n:num-1];
    return bNum;
}

-(void)fac:(BigNumber*)arr n:(int)n{
    if (!n) 
        return;
    [arr muplitplyTo:n];
    [self fac:arr n:n-1];
}

@end










@implementation Problem20_Recursive


-(void)solve{
    double d = [self factorial:10];
    EULog(@"sum(10!) = %d",[self getSum:d]);
    
    d = [self factorial:100];
    EULog(@"sum(100!) = %d",[self getSum:d]);
}




-(int)getSum:(double)number{
    NSString *s = [NSString stringWithFormat:@"%.0f",number];
    double r= 0;
    for (int i = 0; i < s.length ; i++) {
        NSString *cc = [s substringWithRange:NSMakeRange(i, 1)];
        r += cc.intValue;
    }
    return r;
}





- (double)factorial:(double)operand
{
    if (operand == 1) return 1;
    
    if (operand > 1)
        return operand * [self factorial:operand - 1];
    
    return -1;
}




@end










@implementation Problem20_Iterative

-(double)factorial:(double)operand{
    if (operand == 1)
        return 1;
    
    if (operand < 0) 
        return -1;
    
    double result = operand;
    for (double i = operand-1; i>1; i--) {
        result *= i;
    }
    return result;
    
}

@end









@implementation Problem20_Gamma

- (double)factorial:(double)operand
{
    double output = operand;
    
    if      (output == 0) output = 1; // factorial of 0 is 1
    else if (output < 0)  output = NAN;
    else if (output > 0)
    {
        if (fmod(output, floor(output)) == 0) // integer
            output = round(exp(lgamma(output + 1)));
        else // natural number
            output = exp(lgamma(output + 1));
    }
    
    return output;
}


@end

