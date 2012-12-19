//
//  Problem26.m
//  GTest
//
//  Created by Constantine Fry on 12/6/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem26.h"
#import "BigNumber.h"

@implementation Problem26



-(void)solve{
    int sequenceLength = 0;
    int res = 0;
    for (int i = 2; i < 1000; i++) {
        int* foundRemainders = malloc(i*sizeof(int));
        memset(foundRemainders, 0, i*sizeof(int));
        int value = 1;
        int position = 0;
        
        while (foundRemainders[value] == 0 && value != 0) {
            foundRemainders[value] = position;
            value *= 10;
            value %= i;
            position++;
        }
        
        if (position - foundRemainders[value] > sequenceLength) {
            sequenceLength = position - foundRemainders[value];
            res = i;
        }
        free(foundRemainders);
    }
    EULog(@"Answer %d",res);
}

@end
