//
//  Problem4.m
//  GTest
//
//  Created by Constantine Fry on 11/18/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem4.h"
#import "BigNumber.h"

@implementation Problem4


-(void)solve{
    NSLog(@"%d",[self findLargestPalindromMadeFromTwo2Numbers]);
    NSLog(@"%d",[self findLargestPalindromMadeFromTwo3Numbers]);
}




-(int)findLargestPalindromMadeFromTwo2Numbers{
    int max = 99;
    int min = 9;
    return [self findLargestPalindromWith2DigitsBetween:min and:max];
}
-(int)findLargestPalindromMadeFromTwo3Numbers{
    int max = 999;
    int min = 99;
    return [self findLargestPalindromWith2DigitsBetween:min and:max];
}

-(int)findLargestPalindromWith2DigitsBetween:(int)min and:(int)max{
    NSArray *palindroms = [self generatePalindromsBetweenMin:min andMax:max];
    for (NSNumber *num  in palindroms) {
        int a = num.intValue;
        for (int i = max; i > min; i--) {
            if (a/i <= max && a/i > min && a%i == 0 ) {
                return a;
            }
        }
    }
    return -1;
}

-(NSArray*)generatePalindromsBetweenMin:(int)min andMax:(int)max{
    NSMutableArray *palindroms = [NSMutableArray array];
    for(int i = max; i >= min;i--){
        [palindroms addObjectsFromArray:[self generatePalindromsWithLeft:i max:max*max]];
    }
    [palindroms sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    return palindroms;
}

-(NSArray*)generatePalindromsWithLeft:(int)num max:(int)max{
    NSMutableArray *result = [NSMutableArray array];
    int right = 0;
    int left = num;
    int mn = 1;
    while(num > 0){
        right = right*10 + (num % 10);
        num = num/10;
        mn *= 10;
    }
    int evenPal =left*mn+right;
    [result addObject:@(evenPal)];
    left *=(mn*10);
    for (int i = 9; i >= 0; i--) {
        int oddPal = left+i*mn+right;
        if (oddPal > max) {
            return result;
        }
        [result addObject:@(oddPal)];
    }
    
    return result;
}

@end

