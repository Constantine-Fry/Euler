//
//  main.m
//  GTest
//
//  Created by Constantine Fry on 11/4/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"
#import "EUSDK.h"



int main(int argc, const char * argv[])
{
    @autoreleasepool {
        srand((unsigned)time(0));
        
        EUProblem *p = [[Problem13 alloc]init];
        [p solve];
    }
    return 0;
}

