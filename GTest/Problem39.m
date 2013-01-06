//
//  Problem39.m
//  GTest
//
//  Created by Constantine Fry on 12/21/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "Problem39.h"

@implementation Problem39

-(void)solve{
    int res = 0;
    int pp = 0;
    int *table = malloc(1001*sizeof(int));
    memset(table, 0, 1001*sizeof(int));
    double c;
    for (int a = 1; a<=500; a++){
        for (int b = 1; b<=500; b++){
            float p = a+b+sqrt(a*a+b*b);
            if (modf(p, &c) == 0) {
                int ppp = p;
                table[ppp]++;
                if (res < table[ppp]) {
                    res = table[ppp];
                    pp = ppp;
                }
            }
        }
    }   
    
    EULog(@"Answer: %d",pp);
    free(table);
}

@end
