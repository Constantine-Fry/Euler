//
//  Problem51.m
//  GTest
//
//  Created by Constantine Fry on 1/8/13.
//  Copyright (c) 2013 Constantine Fry. All rights reserved.
//

#import "Problem51.h"
#import "EUSieve.h"

@implementation Problem51{
    EUSieve *_sieve;
}


- (id)init
{
    self = [super init];
    if (self) {
        _sieve = [[EUSieve alloc]init];
    }
    return self;
}





-(void)solve{
    int length = 0;
    int res = 0;
    int numbers[10] = {0,1,2,3,4,5,6,7,8,9};
    int size= 6;
    int arr[6];
    for (int i = 100000; i<=999999; i++) {
        if (![_sieve isPrimeNumer:i]) 
            continue;
        

        int rem = i;
        int counter = 0;
        while (rem) {
            arr[size-counter-1] = rem%10;
            rem/=10;
            counter++;
        }
        
        
        for (int j=0; j<size-3; j++) {
            for (int k=j+1; k<size-2; k++) {
                for (int z=k+1; z<size-1; z++) {
                int curLen = 0;
                int curRes = 0;
                int arr1[6];
                memcpy(&arr1, &arr, size*sizeof(int));
                for (int rr=0; rr<=9; rr++) {

                    arr1[j] = numbers[rr];
                    arr1[k] = numbers[rr];
                    arr1[z] = numbers[rr];
                    
                    int a = 0;
                    int d = 1;
                    for (int r = size-1; r>=0; r--) {
                        a += arr1[r]*d;
                        d*=10;
                    }
                    
                    if ([_sieve isPrimeNumer:a] && a>100000) {
                        if (!curRes) {
                            curRes = a;
                        }
                        curLen++;
                    }
                }
                
                if (curLen > length) {
                    length = curLen;
                    res = curRes;
                    if (length == 8) {
                        EULog(@"%d, %d",res,length);
                        return ;
                    }
                }
                
                }
            }
        }
        

    }
    

}

@end
