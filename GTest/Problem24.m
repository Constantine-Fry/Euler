//
//  Problem24.m
//  GTest
//
//  Created by Constantine Fry on 12/5/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem24.h"

@implementation Problem24{
    int* _result;
    int counter;
}

- (id)init{
    self = [super init];
    if (self) {
        _result = malloc(10*sizeof(int));
    }
    return self;
}

- (void)dealloc{
    free(_result);
}

-(void)printResult{
    NSMutableString *result = [NSMutableString stringWithCapacity:10];
    for (int i = 0; i<10; i++) {
        [result appendFormat:@"%d",_result[i]];
    }
    EULog(@"Answer: %@",result);
}

-(BOOL)solveForArray:(int*)array arrayLength:(int)n depth:(int)depth{
    
    if (depth == 0 ){
        if (++counter == 1000000){
            [self printResult];
            return YES;
        }
    }

    
    for (int i = 0; i < n; i++) {
        if (array[i] == -1) 
            continue;
        
        _result[10-depth] = array[i];
        int *a = malloc(sizeof(int)*10);
        memcpy(a, array, sizeof(int)*10);
        a[i] = -1;
        BOOL res = [self solveForArray:a
                           arrayLength:n
                                 depth:depth-1];
        free(a);
        if (res)
            return YES;
    }
    return NO;
}

-(void)solve{
    counter = 0;
    int a[] = {0,1,2,3,4,5,6,7,8,9};
    memset(_result, 0, sizeof(int)*10);
    [self solveForArray:(int*)&a
            arrayLength:10
                  depth:10];
}

@end
