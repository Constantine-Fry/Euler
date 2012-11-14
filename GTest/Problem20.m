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
    NSLog(@"there is several ways to compute factorial!");
    
    EUProblem *p = [[Problem20_Recursive alloc]init];
    NSLog(@"------------------------------");
    NSLog(@"Recursive way:");
    [p solve];
    
    p = [[Problem20_Iterative alloc]init];
    NSLog(@"------------------------------");
    NSLog(@"Iterative way:");
    [p solve];
    
    p = [[Problem20_Gamma alloc]init];
    NSLog(@"------------------------------");
    NSLog(@"Gamma way:");
    NSLog(@"http://blog.andrewwei.mu/?p=92");
    
    [p solve];
    
    p = [[Problem20_NumArray alloc]init];
    NSLog(@"------------------------------");
    NSLog(@"Array way:");
    [p solve];
    
    
}

@end










@implementation Problem20_NumArray


-(void)solve{
    NSArray* result2 = [self factorial:10];
    NSNumber *num = [self getSum:result2];
    NSLog(@"sum(10!) = %@",num);
    
    result2 = [self factorial:100];
    num = [self getSum:result2];
    NSLog(@"sum(100!) = %@",num);
}




-(NSNumber*)getSum:(NSArray*)number{
    double r= 0;
    for (NSNumber *num  in number) {
        r += num.intValue;
    }
    return @(r);
}



-(NSMutableArray*)convertToArray:(int)num{
    NSString *s = [NSString stringWithFormat:@"%d",num];
    NSMutableArray* arr = [NSMutableArray arrayWithCapacity:s.length];
    for (int i = 0; i < s.length ; i++) {
        NSString *cc = [s substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:@(cc.intValue)];
    }
    return arr;
}

-(NSArray*)factorial:(int)num{
    NSMutableArray* arr = [self convertToArray:num];
    [self fac:arr n:num-1];
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










@implementation Problem20_Recursive


-(void)solve{
    double d = [self factorial:10];
    NSLog(@"sum(10!) = %d",[self getSum:d]);
    
    d = [self factorial:100];
    NSLog(@"sum(100!) = %d",[self getSum:d]);
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

