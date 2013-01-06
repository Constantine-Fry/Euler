//
//  Problem40.m
//  GTest
//
//  Created by Constantine Fry on 12/21/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem40.h"

@implementation Problem40

-(void)solve{
    int res = 1;
    int counter = 0;
    int i = 1;
    int d = 1;
    int *arr = malloc(10*sizeof(int));
    while (d < 1000000) {
        int b = i;
        int c = 0;
        while (b) {
            int rem = b%10;
            b/=10;
            c++;
            arr[c] = rem;
        }
        i++;
        if (counter+c < d){
            counter += c;
            continue;
        }
        while (c) {
            counter++;
            if(counter == d){
                res *= arr[c];
                d*=10;
            }
            c--;
        }
        
    }
    free(arr);
    EULog(@"Answer: %D",res);
}
@end
