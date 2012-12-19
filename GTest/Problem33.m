//
//  Problem33.m
//  GTest
//
//  Created by Constantine Fry on 12/18/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem33.h"



@implementation Problem33
-(void)solve{
    int c = 0;
    int A = 1;
    int B = 1;
    for (int i = 1; i <=9; i++) {
        for (int j = 1; j<=9; j++) {
            if (i == j) {
                continue;
            }
            int a = i+j*10;
            for (int k = 1; k<=9; k++) {
                int b = i*10+k;
                c++;
                if ((float)a/b == (float)j/k) {
                    A *= a;
                    B *= b;
                    EULog(@"%d/%d",a,b);
                }
            }
        }
    }
    EULog(@"Iterations: %d ",c);
    EULog(@"%d/%d",A,B);
    EULog(@"Answer: %d",B/A);
}
@end
