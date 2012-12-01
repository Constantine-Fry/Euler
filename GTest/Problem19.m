//
//  Problem19.m
//  GTest
//
//  Created by Constantine Fry on 12/1/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem19.h"

@implementation Problem19

-(BOOL)canBeTested{
    return NO;
}

-(NSArray *)generateMonths{
    int s = 0;
    NSMutableArray *daysPrMonth = [NSMutableArray arrayWithCapacity:12*100];
    for (int i = 1900; i<= 2000; i++) {
        for (int j = 1; j<=12; j++) {
            int days = 0;
            if (j == 2) {
                if (i%4==0 && i%400 !=0) {
                    s++;
                    days = 29;
                }else{
                    days = 28;
                }
            }else if (j == 9 || j == 4 || j== 6 || j==10){
                days = 30;
            }else{
                days = 31;
            }
            [daysPrMonth addObject:@(days)];
        }
    }
    return daysPrMonth;
}
-(void)solve{
    CFAbsoluteTime time = CFAbsoluteTimeGetCurrent();
    NSArray *daysPrMonth = [self generateMonths];
    int result = 0;
    int counter = 0;
    for (int i = 0; i<daysPrMonth.count; i++) {
        NSNumber *m = daysPrMonth[i];
        counter += m.intValue;
        if ((counter+1)%7 == 0 && i>12) {
            result++;
        }
    }
    EULog(@"time:%f",CFAbsoluteTimeGetCurrent()-time);
    EULog(@"Answer: %d",result);
}

@end
