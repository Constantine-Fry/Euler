//
//  NSArray_ext.m
//  GTest
//
//  Created by Constantine Fry on 11/16/12.
//  Copyright (c) 2012 Constantine Fry. All rights reserved.
//

#import "NSArray_ext.h"

@implementation NSArray(ext)

-(NSNumber*)sum{
    double r= 0;
    for (NSNumber *num  in self) {
        r += num.intValue;
    }
    return @(r);
}

@end
